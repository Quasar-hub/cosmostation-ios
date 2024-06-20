//
//  ChainArchway.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/10/01.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainArchway: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Archway"
        tag = "archway118"
        logo1 = "chainArchway"
        apiName = "archway"
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/118'/0'/0/X")
        
        
        supportCosmosGrpc = true
        stakeDenom = "aarch"
        bechAccountPrefix = "archway"
        validatorPrefix = "archwayvaloper"
        supportCw20 = true
        supportCw721 = true
        grpcHost = "grpc-archway.cosmostation.io"
        
        initFetcher()
    }
}
/*
class ChainArchway: CosmosClass  {
    
    override init() {
        super.init()
        
        name = "Archway"
        tag = "archway118"
        logo1 = "chainArchway"
        logo2 = "chainArchway2"
        apiName = "archway"
        stakeDenom = "aarch"
        
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/118'/0'/0/X")
        bechAccountPrefix = "archway"
        validatorPrefix = "archwayvaloper"
        supportCw20 = true
        supportCw721 = true
        
        grpcHost = "grpc-archway.cosmostation.io"
    }
    
}
*/
let ARCH_NAME_SERVICE = "archway1275jwjpktae4y4y0cdq274a2m0jnpekhttnfuljm6n59wnpyd62qppqxq0"
