//
//  ChainCrescent.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/09/28.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainCrescent: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Crescent"
        tag = "crescent118"
        logo1 = "chainCrescent"
        apiName = "crescent"
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/118'/0'/0/X")
        
        
        supportCosmosGrpc = true
        stakeDenom = "ucre"
        bechAccountPrefix = "cre"
        validatorPrefix = "crevaloper"
        grpcHost = "grpc-crescent.cosmostation.io"
    }
    
}
