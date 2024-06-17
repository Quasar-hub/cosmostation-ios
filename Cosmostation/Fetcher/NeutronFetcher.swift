//
//  NeutronFetcher.swift
//  Cosmostation
//
//  Created by yongjoo jung on 6/16/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import Foundation
import GRPC
import NIO
import SwiftProtobuf
import Alamofire
import SwiftyJSON

class NeutronFetcher: FetcherGrpc {
    
    var vaultsList: [JSON]?
    var daosList: [JSON]?
    var neutronDeposited = NSDecimalNumber.zero
    var neutronVesting: JSON?
    
    override func fetchGrpcData(_ id: Int64) async -> Bool {
        cosmosAuth = nil
        cosmosBalances = nil
        neutronDeposited = NSDecimalNumber.zero
        neutronVesting = nil
        vaultsList = chain.getChainListParam()["vaults"].arrayValue
        daosList = chain.getChainListParam()["daos"].arrayValue
        
        do {
            if let cw20Tokens = try? await fetchCw20Info(),
               let auth = try? await fetchAuth(),
               let balance = try await fetchBalance(),
               let vault = try? await fetchVaultDeposit(),
               let vesting = try? await fetchNeutronVesting() {
                self.mintscanCw20Tokens = cw20Tokens ?? []
                self.cosmosAuth = auth
                self.cosmosBalances = balance
                if let vault = vault,
                   let deposited = try? JSONDecoder().decode(JSON.self, from: vault) {
                    self.neutronDeposited = NSDecimalNumber(string: deposited["power"].string)
                }
                if let vesting = vesting,
                   let vestingInfo = try? JSONDecoder().decode(JSON.self, from: vesting) {
                    self.neutronVesting = vestingInfo
                }
                
                await mintscanCw20Tokens.concurrentForEach { cw20 in
                    self.fetchCw20Balance(cw20)
                }
            }
            return true
            
        } catch {
            return false
        }
    }
    
    override func denomValue(_ denom: String, _ usd: Bool? = false) -> NSDecimalNumber {
        if (denom == chain.stakeDenom) {
            return balanceValue(denom, usd).adding(neutronVestingValue(usd)).adding(neutronDepositedValue(usd))
        } else {
            return balanceValue(denom, usd)
        }
    }
    
    override func allStakingDenomAmount() -> NSDecimalNumber {
        return balanceAmount(chain.stakeDenom!).adding(neutronVestingAmount()).adding(neutronDeposited)
    }
    
    override func allCoinValue(_ usd: Bool? = false) -> NSDecimalNumber {
        return balanceValueSum(usd).adding(neutronVestingValue(usd)).adding(neutronDepositedValue(usd))
    }
    
    
    func neutronVestingAmount() -> NSDecimalNumber  {
        if let allocated = neutronVesting?["allocated_amount"].string,
           let withdrawn = neutronVesting?["withdrawn_amount"].string {
            let allocatedAmount = NSDecimalNumber(string: allocated)
            let withdrawnAmount = NSDecimalNumber(string: withdrawn)
            return allocatedAmount.subtracting(withdrawnAmount)
        }
        return NSDecimalNumber.zero
    }
    
    func neutronVestingValue(_ usd: Bool? = false) -> NSDecimalNumber {
        if let msAsset = BaseData.instance.getAsset(chain.apiName, chain.stakeDenom!) {
            let msPrice = BaseData.instance.getPrice(msAsset.coinGeckoId, usd)
            let amount = neutronVestingAmount()
            return msPrice.multiplying(by: amount).multiplying(byPowerOf10: -msAsset.decimals!, withBehavior: handler6)
        }
        return NSDecimalNumber.zero
    }
    
    func neutronDepositedValue(_ usd: Bool? = false) -> NSDecimalNumber {
        if let msAsset = BaseData.instance.getAsset(chain.apiName, chain.stakeDenom!) {
            let msPrice = BaseData.instance.getPrice(msAsset.coinGeckoId, usd)
            let amount = neutronDeposited
            return msPrice.multiplying(by: amount).multiplying(byPowerOf10: -msAsset.decimals!, withBehavior: handler6)
        }
        return NSDecimalNumber.zero
    }
    
}

extension NeutronFetcher {
    
    func fetchVaultDeposit() async throws -> Data? {
        let query: JSON = ["voting_power_at_height" : ["address" : chain.bechAddress!]]
        let queryBase64 = try! query.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
        let req = Cosmwasm_Wasm_V1_QuerySmartContractStateRequest.with {
            $0.address = NEUTRON_VAULT_ADDRESS
            $0.queryData = Data(base64Encoded: queryBase64)!
        }
        return try? await Cosmwasm_Wasm_V1_QueryNIOClient(channel: getClient()).smartContractState(req, callOptions: getCallOptions()).response.get().data
    }
    
    func fetchNeutronVesting() async throws -> Data? {
        let query: JSON = ["allocation" : ["address" : chain.bechAddress!]]
        let queryBase64 = try! query.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
        let req = Cosmwasm_Wasm_V1_QuerySmartContractStateRequest.with {
            $0.address = NEUTRON_VESTING_CONTRACT_ADDRESS
            $0.queryData = Data(base64Encoded: queryBase64)!
        }
        return try? await Cosmwasm_Wasm_V1_QueryNIOClient(channel: getClient()).smartContractState(req, callOptions: getCallOptions()).response.get().data
    }
    
}
