//
//  BaseSheet.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/30.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import SwiftyJSON
import Lottie

class BaseSheet: BaseVC, UISearchBarDelegate {
    
    @IBOutlet weak var sheetTitle: UILabel!
    @IBOutlet weak var sheetSearchBar: UISearchBar!
    @IBOutlet weak var sheetTableView: UITableView!
    @IBOutlet weak var loadingView: LottieAnimationView!
    
    var sheetType: SheetType?
    var sheetDelegate: BaseSheetDelegate?
    
    var targetChain: CosmosClass!
    var targetEvmChain: EvmClass!
    var swapChains = Array<CosmosClass>()
    var swapChainsSearch = Array<CosmosClass>()
    var swapAssets = Array<JSON>()
    var swapAssetsSearch = Array<JSON>()
    var swapBalance = Array<Cosmos_Base_V1beta1_Coin>()
    
    var feeDatas = Array<FeeData>()
    var validators = Array<Cosmos_Staking_V1beta1_Validator>()
    var validatorsSearch = Array<Cosmos_Staking_V1beta1_Validator>()
    var delegations = Array<Cosmos_Staking_V1beta1_DelegationResponse>()
    var delegation: Cosmos_Staking_V1beta1_DelegationResponse!
    var unbondingEnrtyPosition: Int?
    var cosmosChainList = Array<CosmosClass>()
    var nameservices = Array<NameService>()
    var oktValidators = [JSON]()
    
    var senderAddress: String!
    var refAddresses = Array<RefAddress>()
    var addressBook = Array<AddressBook>()
    
    var hardMarketDenom: String?
    var swpName: String?
    var cdpType: String?
    var earnCoin: Cosmos_Base_V1beta1_Coin?
    
    
    var selectedAccount: BaseAccount?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView.isHidden = true
        loadingView.animation = LottieAnimation.named("loading")
        loadingView.contentMode = .scaleAspectFit
        loadingView.loopMode = .loop
        loadingView.animationSpeed = 1.3
        loadingView.play()
        
        updateTitle()
        
        sheetSearchBar.backgroundImage = UIImage()
        sheetSearchBar.delegate = self
        
        sheetTableView.delegate = self
        sheetTableView.dataSource = self
        sheetTableView.separatorStyle = .none
        sheetTableView.register(UINib(nibName: "BaseSheetCell", bundle: nil), forCellReuseIdentifier: "BaseSheetCell")
        sheetTableView.register(UINib(nibName: "BaseMsgSheetCell", bundle: nil), forCellReuseIdentifier: "BaseMsgSheetCell")
        sheetTableView.register(UINib(nibName: "BaseImgSheetCell", bundle: nil), forCellReuseIdentifier: "BaseImgSheetCell")
        sheetTableView.register(UINib(nibName: "SwitchAccountCell", bundle: nil), forCellReuseIdentifier: "SwitchAccountCell")
        sheetTableView.register(UINib(nibName: "SwitchCurrencyCell", bundle: nil), forCellReuseIdentifier: "SwitchCurrencyCell")
        sheetTableView.register(UINib(nibName: "SwitchPriceDisplayCell", bundle: nil), forCellReuseIdentifier: "SwitchPriceDisplayCell")
        sheetTableView.register(UINib(nibName: "SwitchStyleCell", bundle: nil), forCellReuseIdentifier: "SwitchStyleCell")
        
        sheetTableView.register(UINib(nibName: "SelectSwapChainCell", bundle: nil), forCellReuseIdentifier: "SelectSwapChainCell")
        sheetTableView.register(UINib(nibName: "SelectSwapAssetCell", bundle: nil), forCellReuseIdentifier: "SelectSwapAssetCell")
        sheetTableView.register(UINib(nibName: "SelectAccountCell", bundle: nil), forCellReuseIdentifier: "SelectAccountCell")
        sheetTableView.register(UINib(nibName: "SelectEndpointCell", bundle: nil), forCellReuseIdentifier: "SelectEndpointCell")
        
        sheetTableView.register(UINib(nibName: "SelectFeeCoinCell", bundle: nil), forCellReuseIdentifier: "SelectFeeCoinCell")
        sheetTableView.register(UINib(nibName: "SelectValidatorCell", bundle: nil), forCellReuseIdentifier: "SelectValidatorCell")
        sheetTableView.register(UINib(nibName: "SelectNameServiceCell", bundle: nil), forCellReuseIdentifier: "SelectNameServiceCell")
        sheetTableView.register(UINib(nibName: "SelectRefAddressCell", bundle: nil), forCellReuseIdentifier: "SelectRefAddressCell")
        sheetTableView.register(UINib(nibName: "SelectAddressBookCell", bundle: nil), forCellReuseIdentifier: "SelectAddressBookCell")
        sheetTableView.register(UINib(nibName: "SelectBepRecipientCell", bundle: nil), forCellReuseIdentifier: "SelectBepRecipientCell")
        sheetTableView.sectionHeaderTopPadding = 0
        
        
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dismissTap.cancelsTouchesInView = false
        view.addGestureRecognizer(dismissTap)
        
//        print("senderAddress ", senderAddress)
//        print("targetChain ", targetChain.bechAccountPrefix)
//        
//        let ref = BaseData.instance.selectAllRefAddresses()
//        print("ref ", ref.count)
//        
//        ref.forEach { refAddress in
//            print("refAddress ", refAddress.chainTag, "  ", refAddress.bechAddress , "  ", refAddress.evmAddress)
//        }
    }
    
    func updateTitle() {
        if (sheetType == .SelectCreateAccount) {
            sheetTitle.text = NSLocalizedString("title_create_account", comment: "")
            
        } else if (sheetType == .SelectOptionMnemonicAccount) {
            sheetTitle.text = NSLocalizedString("title_select_options", comment: "")
            
        } else if (sheetType == .SelectOptionPrivateKeyAccount) {
            sheetTitle.text = NSLocalizedString("title_select_options", comment: "")
            
        } else if (sheetType == .SwitchAccount) {
            sheetTitle.text = NSLocalizedString("title_select_account", comment: "")
            
        } else if (sheetType == .SwitchLanguage) {
            sheetTitle.text = NSLocalizedString("title_select_language", comment: "")
            
        } else if (sheetType == .SwitchCurrency) {
            sheetTitle.text = NSLocalizedString("title_select_currency", comment: "")
            
        } else if (sheetType == .SwitchPriceColor) {
            sheetTitle.text = NSLocalizedString("str_price_change_color", comment: "")
            
        } else if (sheetType == .SwitchAutoPass) {
            sheetTitle.text = NSLocalizedString("str_autopass", comment: "")
            
        } else if (sheetType == .SwitchStyle) {
            sheetTitle.text = NSLocalizedString("str_select_style", comment: "")
            
        } else if (sheetType == .SelectSwapInputChain) {
            sheetTitle.text = NSLocalizedString("title_select_input_chain", comment: "")
            sheetSearchBar.isHidden = false
            swapChains.sort {
                if ($0.tag == "cosmos118") { return true }
                if ($1.tag == "cosmos118") { return false }
                return $0.name < $1.name
            }
            swapChainsSearch = swapChains
            
        } else if (sheetType == .SelectSwapOutputChain) {
            sheetTitle.text = NSLocalizedString("title_select_output_chain", comment: "")
            sheetSearchBar.isHidden = false
            swapChains.sort {
                if ($0.tag == "cosmos118") { return true }
                if ($1.tag == "cosmos118") { return false }
                return $0.name < $1.name
            }
            swapChainsSearch = swapChains
            
        } else if (sheetType == .SelectSwapInputAsset) {
            sheetTitle.text = NSLocalizedString("title_select_input_asset", comment: "")
            sheetSearchBar.isHidden = false
            loadingView.isHidden = false
            DispatchQueue.global().async { [self] in
                swapAssets.sort {
                    if ($0["symbol"] == "ATOM") { return true }
                    if ($1["symbol"] == "ATOM") { return false }
                    let value0 = targetChain.balanceValue($0["denom"].stringValue)
                    let value1 = targetChain.balanceValue($1["denom"].stringValue)
                    if (value0.compare(value1).rawValue > 0 ) { return true }
                    if (value0.compare(value1).rawValue < 0 ) { return false }
                    let amount0 = targetChain.balanceAmount($0["denom"].stringValue)
                    let amount1 = targetChain.balanceAmount($1["denom"].stringValue)
                    if (amount0.compare(amount1).rawValue > 0 ) { return true }
                    if (amount0.compare(amount1).rawValue < 0 ) { return false }
                    return $0["symbol"].stringValue < $1["symbol"].stringValue
                }
                swapAssetsSearch = swapAssets
                DispatchQueue.main.async(execute: {
                    self.loadingView.isHidden = true
                    self.sheetTableView.reloadData()
                })
            }
            
        } else if (sheetType == .SelectSwapOutputAsset) {
            sheetTitle.text = NSLocalizedString("title_select_output_asset", comment: "")
            sheetSearchBar.isHidden = false
            loadingView.isHidden = false
            DispatchQueue.global().async { [self] in
                swapAssets.sort {
                    if ($0["symbol"] == "ATOM") { return true }
                    if ($1["symbol"] == "ATOM") { return false }
                    let value0 = targetChain.balanceValue($0["denom"].stringValue)
                    let value1 = targetChain.balanceValue($1["denom"].stringValue)
                    if (value0.compare(value1).rawValue > 0 ) { return true }
                    if (value0.compare(value1).rawValue < 0 ) { return false }
                    let amount0 = targetChain.balanceAmount($0["denom"].stringValue)
                    let amount1 = targetChain.balanceAmount($1["denom"].stringValue)
                    if (amount0.compare(amount1).rawValue > 0 ) { return true }
                    if (amount0.compare(amount1).rawValue < 0 ) { return false }
                    return $0["symbol"].stringValue < $1["symbol"].stringValue
                }
                swapAssetsSearch = swapAssets
                DispatchQueue.main.async(execute: {
                    self.loadingView.isHidden = true
                    self.sheetTableView.reloadData()
                })
            }
            
        } else if (sheetType == .SelectSwapSlippage) {
            sheetTitle.text = NSLocalizedString("title_select_slippage", comment: "")
            
        } else if (sheetType == .SelectDelegatedAction || sheetType == .SelectUnbondingAction) {
            sheetTitle.text = NSLocalizedString("title_select_options", comment: "")
            
        } else if (sheetType == .SelectFeeDenom) {
            sheetTitle.text = NSLocalizedString("str_select_coin_for_fee", comment: "")
            
        } else if (sheetType == .SelectValidator) {
            sheetTitle.text = NSLocalizedString("str_select_validators", comment: "")
            sheetSearchBar.isHidden = false
            validatorsSearch = validators
            
        } else if (sheetType == .SelectUnStakeValidator) {
            sheetTitle.text = NSLocalizedString("str_select_validators", comment: "")
            delegations = targetChain.cosmosDelegations
            delegations.forEach { delegation in
                if let validator = targetChain.cosmosValidators.filter({ $0.operatorAddress == delegation.delegation.validatorAddress }).first {
                    validators.append(validator)
                }
            }
            
        } else if (sheetType == .SelectCosmosRecipientChain) {
            sheetTitle.text = NSLocalizedString("title_select_recipient_chain", comment: "")
            
        } else if (sheetType == .SelectCosmosRecipientBechAddress) {
            sheetTitle.text = NSLocalizedString("str_address_book_list", comment: "")
            BaseData.instance.selectAllRefAddresses().filter {
                $0.bechAddress.starts(with: targetChain.bechAccountPrefix! + "1") &&
                $0.bechAddress != senderAddress }.forEach { refAddress in
                    if (refAddresses.filter { $0.bechAddress == refAddress.bechAddress && $0.accountId == refAddress.accountId }.count == 0) {
                        refAddresses.append(refAddress)
                    }
                }
            refAddresses.sort {
                if let account0 = BaseData.instance.selectAccount($0.accountId),
                   let account1 = BaseData.instance.selectAccount($1.accountId) {
                    return account0.order < account1.order
                }
                return false
            }
            
            BaseData.instance.selectAllAddressBooks().filter { 
                $0.dpAddress.starts(with: targetChain.bechAccountPrefix! + "1") &&
                $0.dpAddress != senderAddress }.forEach { book in
                    addressBook.append(book)
                }
            
        } else if (sheetType == .SelectCosmosNameServiceAddress) {
            sheetTitle.text = String(format: NSLocalizedString("title_select_nameservice", comment: ""), nameservices[0].name ?? "")
            
        } else if (sheetType == .SelectBepRecipientAddress) {
            sheetTitle.text = NSLocalizedString("str_recipient_address", comment: "")
            
        } else if (sheetType == .SelectNeutronVault) {
            sheetTitle.text = NSLocalizedString("title_select_vaults", comment: "")
            
        } else if (sheetType == .SelectHardAction) {
            sheetTitle.text = NSLocalizedString("title_select_hardpool_action", comment: "")
            
        } else if (sheetType == .SelectSwpAction) {
            sheetTitle.text = NSLocalizedString("title_select_swappool_action", comment: "")
            
        } else if (sheetType == .SelectMintAction) {
            sheetTitle.text = NSLocalizedString("title_select_mint_action", comment: "")
            
        } else if (sheetType == .SelectEarnAction) {
            sheetTitle.text = NSLocalizedString("title_select_earn_action", comment: "")
            
        } else if (sheetType == .SelectBuyCrypto) {
            sheetTitle.text = NSLocalizedString("title_buy_crypto", comment: "")
            
        }
    }
    
    @objc func dismissKeyboard() {
        sheetSearchBar.endEditing(true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (sheetType == .SelectSwapInputChain || sheetType == .SelectSwapOutputChain) {
            swapChainsSearch = searchText.isEmpty ? swapChains : swapChains.filter { chain in
                return chain.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            
        } else if (sheetType == .SelectSwapInputAsset || sheetType == .SelectSwapOutputAsset) {
            swapAssetsSearch = searchText.isEmpty ? swapAssets : swapAssets.filter { json in
                return json["symbol"].stringValue.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
        } else if (sheetType == .SelectValidator) {
            validatorsSearch = searchText.isEmpty ? validators : validators.filter { validator in
                return validator.description_p.moniker.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
        }
        sheetTableView.reloadData()
    }
}


extension BaseSheet: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (sheetType == .SelectCosmosRecipientBechAddress) {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = BaseSheetHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        if (sheetType == .SelectCosmosRecipientBechAddress) {
            if (section == 0) {
                view.titleLabel.text = "My Account"
                view.cntLabel.text = String(refAddresses.count)
            } else {
                view.titleLabel.text = "Address Book"
                view.cntLabel.text = String(addressBook.count)
            }
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (sheetType == .SelectCosmosRecipientBechAddress) {
            if (section == 0) {
                return (refAddresses.count > 0) ? 40 : 0
            } else if (section == 1) {
                return (addressBook.count > 0) ? 40 : 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (sheetType == .SelectCreateAccount) {
            return 3
            
        } else if (sheetType == .SelectOptionMnemonicAccount) {
            return 4
            
        } else if (sheetType == .SelectOptionPrivateKeyAccount) {
            return 3
            
        } else if (sheetType == .SwitchAccount) {
            return BaseData.instance.selectAccounts().count
            
        } else if (sheetType == .SwitchLanguage) {
            return Language.getLanguages().count
            
        } else if (sheetType == .SwitchCurrency) {
            return Currency.getCurrencys().count
            
        } else if (sheetType == .SwitchPriceColor) {
            return 2
            
        } else if (sheetType == .SwitchAutoPass) {
            return AutoPass.getAutoPasses().count
            
        } else if (sheetType == .SwitchStyle) {
            return 2
            
        } else if (sheetType == .SelectSwapInputChain || sheetType == .SelectSwapOutputChain) {
            return swapChainsSearch.count
            
        } else if (sheetType == .SelectSwapInputAsset || sheetType == .SelectSwapOutputAsset) {
            return swapAssetsSearch.count
            
        } else if (sheetType == .SelectSwapSlippage) {
            return 3
            
        } else if (sheetType == .SelectDelegatedAction) {
            return 5
            
        } else if (sheetType == .SelectUnbondingAction) {
            return 1
            
        } else if (sheetType == .SelectFeeDenom) {
            return feeDatas.count
            
        } else if (sheetType == .SelectValidator) {
            return validatorsSearch.count
            
        } else if (sheetType == .SelectUnStakeValidator) {
            return validators.count
            
        } else if (sheetType == .SelectCosmosRecipientChain) {
            return cosmosChainList.count
            
        } else if (sheetType == .SelectCosmosRecipientBechAddress) {
            if (section == 0) {
                return refAddresses.count
            } else {
                return addressBook.count
            }
            
        } else if (sheetType == .SelectCosmosNameServiceAddress) {
            return nameservices.count
            
        } else if (sheetType == .SelectBepRecipientAddress) {
            return cosmosChainList.count
            
        } else if (sheetType == .SelectNeutronVault) {
            return 2
            
        } else if (sheetType == .SelectHardAction) {
            return 4
            
        } else if (sheetType == .SelectSwpAction) {
            return 2
            
        } else if (sheetType == .SelectMintAction) {
            return 4
            
        } else if (sheetType == .SelectEarnAction) {
            return 2
            
        } else if (sheetType == .SelectBuyCrypto) {
            return 3
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (sheetType == .SelectCreateAccount) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseMsgSheetCell") as? BaseMsgSheetCell
            cell?.onBindCreate(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectOptionMnemonicAccount) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseMsgSheetCell") as? BaseMsgSheetCell
            cell?.onBindMnemonicAccount(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectOptionPrivateKeyAccount) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseMsgSheetCell") as? BaseMsgSheetCell
            cell?.onBindPrivateKeyAccount(indexPath.row)
            return cell!
            
        } else if (sheetType == .SwitchAccount) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SwitchAccountCell") as? SwitchAccountCell
            cell?.onBindAccount(BaseData.instance.selectAccounts()[indexPath.row])
            return cell!
            
        } else if (sheetType == .SwitchLanguage) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseSheetCell") as? BaseSheetCell
            cell?.onBindLanguage(indexPath.row)
            return cell!
            
        } else if (sheetType == .SwitchCurrency) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SwitchCurrencyCell") as? SwitchCurrencyCell
            cell?.onBindCurrency(indexPath.row)
            return cell!
            
        } else if (sheetType == .SwitchPriceColor) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SwitchPriceDisplayCell") as? SwitchPriceDisplayCell
            cell?.onBindPriceDisplay(indexPath.row)
            return cell!
            
        } else if (sheetType == .SwitchAutoPass) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseSheetCell") as? BaseSheetCell
            cell?.onBindAutoPass(indexPath.row)
            return cell!
            
        } else if (sheetType == .SwitchStyle) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SwitchStyleCell") as? SwitchStyleCell
            cell?.onBindStyle(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectSwapInputChain || sheetType == .SelectSwapOutputChain) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectSwapChainCell") as? SelectSwapChainCell
            cell?.onBindCosmosChain(swapChainsSearch[indexPath.row])
            return cell!
            
        } else if (sheetType == .SelectSwapInputAsset || sheetType == .SelectSwapOutputAsset)  {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectSwapAssetCell") as? SelectSwapAssetCell
            cell?.onBindAsset(targetChain, swapAssetsSearch[indexPath.row], swapBalance)
            return cell!
            
        } else if (sheetType == .SelectSwapSlippage) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseSheetCell") as? BaseSheetCell
            cell?.onSkipSwapSlippage(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectDelegatedAction) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseMsgSheetCell") as? BaseMsgSheetCell
            cell?.onBindDelegate(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectUnbondingAction) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseMsgSheetCell") as? BaseMsgSheetCell
            cell?.onBindUndelegate(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectFeeDenom) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectFeeCoinCell") as? SelectFeeCoinCell
            cell?.onBindFeeCoin(targetChain, feeDatas[indexPath.row])
            return cell!
            
        } else if (sheetType == .SelectValidator) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectValidatorCell") as? SelectValidatorCell
            cell?.onBindValidator(targetChain, validatorsSearch[indexPath.row])
            return cell!
            
        } else if (sheetType == .SelectUnStakeValidator) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectValidatorCell") as? SelectValidatorCell
            cell?.onBindUnstakeValidator(targetChain, validators[indexPath.row])
            return cell!
            
        } else if (sheetType == .SelectCosmosRecipientChain) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectSwapChainCell") as? SelectSwapChainCell
            cell?.onBindCosmosChain(cosmosChainList[indexPath.row])
            return cell!
            
        } else if (sheetType == .SelectCosmosRecipientBechAddress) {
            if (indexPath.section == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"SelectRefAddressCell") as? SelectRefAddressCell
                cell?.onBindBechRefAddress(targetChain, refAddresses[indexPath.row])
                return cell!
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier:"SelectAddressBookCell") as? SelectAddressBookCell
                cell?.onBindBechAddressBook(targetChain, addressBook[indexPath.row])
                return cell!
            }
            
        } else if (sheetType == .SelectCosmosNameServiceAddress) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectNameServiceCell") as? SelectNameServiceCell
            cell?.onBindNameservice(nameservices[indexPath.row])
            return cell!
            
        } else if (sheetType == .SelectBepRecipientAddress) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectBepRecipientCell") as? SelectBepRecipientCell
            cell?.onBindBepRecipient(cosmosChainList[indexPath.row])
            return cell!
            
        } else if (sheetType == .SelectNeutronVault) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseSheetCell") as? BaseSheetCell
            cell?.onBindVault(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectHardAction) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseSheetCell") as? BaseSheetCell
            cell?.onBindHard(indexPath.row, hardMarketDenom)
            return cell!
            
        } else if (sheetType == .SelectSwpAction) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseSheetCell") as? BaseSheetCell
            cell?.onBindSwp(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectMintAction) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseSheetCell") as? BaseSheetCell
            cell?.onBindMint(indexPath.row, cdpType!)
            return cell!
            
        } else if (sheetType == .SelectEarnAction) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseSheetCell") as? BaseSheetCell
            cell?.onBindEarn(indexPath.row)
            return cell!
            
        } else if (sheetType == .SelectBuyCrypto) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"BaseImgSheetCell") as? BaseImgSheetCell
            cell?.onBindBuyCrypto(indexPath.row)
            return cell!
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (sheetType == .SwitchAccount) {
            let result: [String : Any] = ["index" : indexPath.row, "accountId" : BaseData.instance.selectAccounts()[indexPath.row].id]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectOptionMnemonicAccount || sheetType == .SelectOptionPrivateKeyAccount) {
            let result: [String : Any] = ["index" : indexPath.row, "account" : selectedAccount]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectDelegatedAction) {
            let result: [String : Any] = ["index" : indexPath.row, "validatorAddress" : delegation.delegation.validatorAddress]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectUnbondingAction) {
            let result: [String : Any] = ["index" : indexPath.row, "entryPosition" : unbondingEnrtyPosition!]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectSwapInputChain || sheetType == .SelectSwapOutputChain) {
            let result: [String : Any] = ["index" : indexPath.row, "chainId" : swapChainsSearch[indexPath.row].chainIdCosmos]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectSwapInputAsset || sheetType == .SelectSwapOutputAsset)  {
            let result: [String : Any] = ["index" : indexPath.row, "denom" : swapAssetsSearch[indexPath.row]["denom"].stringValue]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectValidator) {
            let result: [String : Any] = ["index" : indexPath.row, "validatorAddress" : validatorsSearch[indexPath.row].operatorAddress]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectUnStakeValidator) {
            let result: [String : Any] = ["index" : indexPath.row, "validatorAddress" : validators[indexPath.row].operatorAddress]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectCosmosRecipientChain) {
            let result: [String : Any] = ["index" : indexPath.row, "chainId" : cosmosChainList[indexPath.row].chainIdCosmos]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectCosmosRecipientBechAddress) {
            if (indexPath.section == 0) {
                let result: [String : Any] = ["index" : indexPath.row, "address" : refAddresses[indexPath.row].bechAddress]
                sheetDelegate?.onSelectedSheet(sheetType, result)
            } else {
                let result: [String : Any] = ["index" : indexPath.row, "address" : addressBook[indexPath.row].dpAddress, "memo" : addressBook[indexPath.row].memo]
                sheetDelegate?.onSelectedSheet(sheetType, result)
            }
            
        } else if (sheetType == .SelectBepRecipientAddress) {
            let chain = cosmosChainList[indexPath.row]
            if let bnbChain = chain as? ChainBinanceBeacon {
                let availableAmount = bnbChain.lcdBalanceAmount(bnbChain.stakeDenom)
                let fee = NSDecimalNumber(string: BNB_BEACON_BASE_FEE)
                if (availableAmount.compare(fee).rawValue < 0) {
                    onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
                    dismiss(animated: true)
                }
                
            } else {
                let availableAmount = chain.balanceAmount(chain.stakeDenom)
                let fee = NSDecimalNumber(string: KAVA_BASE_FEE)
                if (availableAmount.compare(fee).rawValue < 0) {
                    onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
                    dismiss(animated: true)
                }
            }
            let result: [String : Any] = ["index" : indexPath.row, "address" : chain.bechAddress]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectHardAction) {
            let result: [String : Any] = ["index" : indexPath.row, "denom" : hardMarketDenom!]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectSwpAction) {
            let result: [String : Any] = ["index" : indexPath.row, "swpName" : swpName!]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectMintAction) {
            let result: [String : Any] = ["index" : indexPath.row, "cdpType" : cdpType!]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else if (sheetType == .SelectEarnAction) {
            let result: [String : Any] = ["index" : indexPath.row, "targetCoin" : earnCoin!]
            sheetDelegate?.onSelectedSheet(sheetType, result)
            
        } else {
            let result: [String : Any] = ["index" : indexPath.row]
            sheetDelegate?.onSelectedSheet(sheetType, result)
        }
        dismiss(animated: true)
    }
    
}


protocol BaseSheetDelegate {
    func onSelectedSheet(_ sheetType: SheetType?, _ result: Dictionary<String, Any>)
}

public enum SheetType: Int {
    case SelectCreateAccount = 0
    case SelectOptionMnemonicAccount = 1
    case SelectOptionPrivateKeyAccount = 2
    
    case SwitchAccount = 11
    case SwitchLanguage = 12
    case SwitchCurrency = 13
    case SwitchPriceColor = 14
    case SwitchAutoPass = 15
    case SwitchStyle = 16
    
    case SelectSwapInputChain = 21
    case SelectSwapOutputChain = 22
    case SelectSwapInputAsset = 23
    case SelectSwapOutputAsset = 24
    case SelectSwapSlippage = 25
    
    case SelectDelegatedAction = 31
    case SelectUnbondingAction = 32
    
    case SelectFeeDenom = 41
    case SelectValidator = 42
    case SelectUnStakeValidator = 43
    case SelectCosmosRecipientChain = 44
    case SelectCosmosRecipientBechAddress = 45
    case SelectCosmosNameServiceAddress = 46
    case SelectBepRecipientAddress = 47
    
    case SelectNeutronVault = 51
    
    case SelectHardAction = 61
    case SelectSwpAction = 62
    case SelectMintAction = 63
    case SelectEarnAction = 64
    
    
    case SelectBuyCrypto = 71
}
