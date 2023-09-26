//
//  CosmosStakingInfoVC.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/09/23.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import Lottie
import Alamofire
import AlamofireImage
import SwiftyJSON
import GRPC
import NIO
import SwiftProtobuf

class CosmosStakingInfoVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stakeBtn: BaseButton!
    @IBOutlet weak var loadingView: LottieAnimationView!
    
    var selectedChain: CosmosClass!
    var rewardAddress: String?
    var chainParam: JSON?
    var validators = Array<Cosmos_Staking_V1beta1_Validator>()
    var delegations = Array<Cosmos_Staking_V1beta1_DelegationResponse>()
    var unbondings = Array<UnbondingEntry>()
    var rewards = Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>()
    var cosmostationValAddress: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseAccount = BaseData.instance.baseAccount
        
        tableView.isHidden = true
        loadingView.isHidden = false
        loadingView.animation = LottieAnimation.named("loading")
        loadingView.contentMode = .scaleAspectFit
        loadingView.loopMode = .loop
        loadingView.animationSpeed = 1.3
        loadingView.play()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "StakeRewardAddressCell", bundle: nil), forCellReuseIdentifier: "StakeRewardAddressCell")
        tableView.register(UINib(nibName: "StakeDelegateCell", bundle: nil), forCellReuseIdentifier: "StakeDelegateCell")
        tableView.register(UINib(nibName: "StakeUnbondingCell", bundle: nil), forCellReuseIdentifier: "StakeUnbondingCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 0.0
        
        onFetchData()
    }
    
    override func setLocalizedString() {
        navigationItem.title = NSLocalizedString("title_staking_info", comment: "")
        stakeBtn.setTitle(NSLocalizedString("str_start_stake", comment: ""), for: .normal)
    }
    
    func onFetchData() {
        validators.removeAll()
        delegations.removeAll()
        unbondings.removeAll()
        rewards.removeAll()
        
        Task {
            let channel = getConnection(selectedChain)
            if let param = try? await fetchChainParam(selectedChain),
               let rewardaddr = try? await fetchRewardAddress(channel, selectedChain.address!),
               let bonded = try? await fetchBondedValidator(channel),
               let unbonding = try? await fetchUnbondingValidator(channel),
               let unbonded = try? await fetchUnbondedValidator(channel) {
                
                chainParam = param
                rewardAddress = rewardaddr
                validators.append(contentsOf: bonded ?? [])
                validators.append(contentsOf: unbonding ?? [])
                validators.append(contentsOf: unbonded ?? [])
                
                delegations = selectedChain.cosmosDelegations
                selectedChain.cosmosUnbondings.forEach { unbonding in
                    unbonding.entries.forEach { entry in
                        unbondings.append(UnbondingEntry.init(validatorAddress: unbonding.validatorAddress, entry: entry))
                    }
                }
                
                rewards = selectedChain.cosmosRewards
                print("rewards ", rewards)
                
                validators.sort {
                    if ($0.description_p.moniker == "Cosmostation") { return true }
                    if ($1.description_p.moniker == "Cosmostation") { return false }
                    if ($0.jailed && !$1.jailed) { return false }
                    if (!$0.jailed && $1.jailed) { return true }
                    return Double($0.tokens)! > Double($1.tokens)!
                }
                
                cosmostationValAddress = validators.filter({ $0.description_p.moniker == "Cosmostation" }).first?.operatorAddress
                delegations.sort {
                    if ($0.delegation.validatorAddress == cosmostationValAddress) { return true }
                    if ($1.delegation.validatorAddress == cosmostationValAddress) { return false }
                    return Double($0.balance.amount)! > Double($1.balance.amount)!
                }
                unbondings.sort {
                    return $0.entry.creationHeight < $1.entry.creationHeight
                }
            }
            
            DispatchQueue.main.async {
                self.onUpdateView()
            }
        }
    }
    
    func onUpdateView() {
        loadingView.isHidden = true
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    @IBAction func onClickStake(_ sender: BaseButton) {
        
    }
}


extension CosmosStakingInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = BaseHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        if (section == 0) {
            view.titleLabel.text = NSLocalizedString("str_reward_address", comment: "")
            view.cntLabel.text = ""
        } else if (section == 1) {
            view.titleLabel.text = NSLocalizedString("str_my_delegations", comment: "")
            view.cntLabel.text = String(delegations.count)
        } else if (section == 2) {
            view.titleLabel.text = NSLocalizedString("str_my_unbondings", comment: "")
            view.cntLabel.text = String(unbondings.count)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            if (rewardAddress?.isEmpty == true || rewardAddress == selectedChain.address) { return 0 }
            else  { return 40 }
        } else if (section == 1) {
            return (delegations.count > 0) ? 40 : 0
        } else if (section == 2) {
            return (unbondings.count > 0) ? 40 : 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else if (section == 1) {
            return delegations.count
        } else if (section == 2) {
            return unbondings.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"StakeRewardAddressCell") as! StakeRewardAddressCell
            cell.onBindRewardAddress(rewardAddress)
            return cell
            
        } else if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"StakeDelegateCell") as! StakeDelegateCell
            let delegation = delegations[indexPath.row]
            if let validator = validators.filter({ $0.operatorAddress == delegation.delegation.validatorAddress }).first {
                cell.onBindMyDelegate(selectedChain, validator, delegation)
            }
            return cell
            
        } else if (indexPath.section == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"StakeUnbondingCell") as! StakeUnbondingCell
            let entry = unbondings[indexPath.row]
            if let validator = validators.filter({ $0.operatorAddress == entry.validatorAddress }).first {
                cell.onBindMyUnbonding(selectedChain, validator, entry)
            }
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            if (rewardAddress?.isEmpty == true || rewardAddress == selectedChain.address) { return 0 }
        }
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            
        } else if (indexPath.section == 1) {
            let baseSheet = BaseSheet(nibName: "BaseSheet", bundle: nil)
            baseSheet.sheetDelegate = self
            baseSheet.sheetType = .SelectDelegatedAction
            onStartSheet(baseSheet)
            
        } else if (indexPath.section == 2) {
            let baseSheet = BaseSheet(nibName: "BaseSheet", bundle: nil)
            baseSheet.sheetDelegate = self
            baseSheet.sheetType = .SelectUnbondingAction
            onStartSheet(baseSheet, 240)
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in tableView.visibleCells {
            let hiddenFrameHeight = scrollView.contentOffset.y + (navigationController?.navigationBar.frame.size.height ?? 44) - cell.frame.origin.y
            if (hiddenFrameHeight >= 0 || hiddenFrameHeight <= cell.frame.size.height) {
                maskCell(cell: cell, margin: Float(hiddenFrameHeight))
            }
        }
    }

    func maskCell(cell: UITableViewCell, margin: Float) {
        cell.layer.mask = visibilityMaskForCell(cell: cell, location: (margin / Float(cell.frame.size.height) ))
        cell.layer.masksToBounds = true
    }

    func visibilityMaskForCell(cell: UITableViewCell, location: Float) -> CAGradientLayer {
        let mask = CAGradientLayer()
        mask.frame = cell.bounds
        mask.colors = [UIColor(white: 1, alpha: 0).cgColor, UIColor(white: 1, alpha: 1).cgColor]
        mask.locations = [NSNumber(value: location), NSNumber(value: location)]
        return mask;
    }
}

extension CosmosStakingInfoVC: BaseSheetDelegate, PinDelegate {
    
    public func onSelectedSheet(_ sheetType: SheetType?, _ result: BaseSheetResult) {
        if (sheetType == .SelectDelegatedAction) {
            print("SelectDelegatedAction ", result.position)
            
        } else if (sheetType == .SelectUnbondingAction) {
            print("SelectUnbondingAction ", result.position)
            
        }
    }
    
    func pinResponse(_ request: LockType, _ result: UnLockResult) {
        
    }
}

extension CosmosStakingInfoVC {
    
    func fetchChainParam(_ chain: BaseChain) async throws -> JSON {
        print("fetchChainParam ", BaseNetWork.msChainParam(chain))
        return try await AF.request(BaseNetWork.msChainParam(chain), method: .get).serializingDecodable(JSON.self).value
    }
    
    func fetchBondedValidator(_ channel: ClientConnection) async throws -> [Cosmos_Staking_V1beta1_Validator]? {
        let page = Cosmos_Base_Query_V1beta1_PageRequest.with { $0.limit = 300 }
        let req = Cosmos_Staking_V1beta1_QueryValidatorsRequest.with { $0.pagination = page; $0.status = "BOND_STATUS_BONDED" }
        return try? await Cosmos_Staking_V1beta1_QueryNIOClient(channel: channel).validators(req).response.get().validators
    }
    
    func fetchUnbondedValidator(_ channel: ClientConnection) async throws -> [Cosmos_Staking_V1beta1_Validator]? {
        let page = Cosmos_Base_Query_V1beta1_PageRequest.with { $0.limit = 300 }
        let req = Cosmos_Staking_V1beta1_QueryValidatorsRequest.with { $0.pagination = page; $0.status = "BOND_STATUS_UNBONDED" }
        return try? await Cosmos_Staking_V1beta1_QueryNIOClient(channel: channel).validators(req).response.get().validators
    }
    
    func fetchUnbondingValidator(_ channel: ClientConnection) async throws -> [Cosmos_Staking_V1beta1_Validator]? {
        let page = Cosmos_Base_Query_V1beta1_PageRequest.with { $0.limit = 300 }
        let req = Cosmos_Staking_V1beta1_QueryValidatorsRequest.with { $0.pagination = page; $0.status = "BOND_STATUS_UNBONDING" }
        return try? await Cosmos_Staking_V1beta1_QueryNIOClient(channel: channel).validators(req).response.get().validators
    }
    
    func fetchRewardAddress(_ channel: ClientConnection, _ address: String) async throws -> String? {
        let req = Cosmos_Distribution_V1beta1_QueryDelegatorWithdrawAddressRequest.with { $0.delegatorAddress = address }
        return try? await Cosmos_Distribution_V1beta1_QueryNIOClient(channel: channel).delegatorWithdrawAddress(req).response.get().withdrawAddress.replacingOccurrences(of: "\"", with: "")
    }
    
    
    func getConnection(_ chain: CosmosClass) -> ClientConnection {
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        return ClientConnection.usingPlatformAppropriateTLS(for: group).connect(host: chain.grpcHost, port: chain.grpcPort)
    }
}


struct UnbondingEntry {
    var validatorAddress: String = String()
    var entry: Cosmos_Staking_V1beta1_UnbondingDelegationEntry
}
