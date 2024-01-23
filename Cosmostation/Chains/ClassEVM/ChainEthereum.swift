//
//  ChainEthereum.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/07/19.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainEthereum: EvmClass  {
    
    override init() {
        super.init()
        
        name = "Ethereum"
        tag = "ethereum60"
        logo1 = "chainEthereum"
        logo2 = "chainEthereum2"
        apiName = "ethereum"
        coinGeckoId = "ethereum"
        
        accountKeyType = AccountKeyType(.ETH_Keccak256, "m/44'/60'/0'/0/X")
        
        rpcURL = "http://eth4.cosmostation.io/rpc"
    }
    
}
