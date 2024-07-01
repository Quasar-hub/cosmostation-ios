//
//  ChainMedibloc.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/10/04.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainMedibloc: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Medibloc"
        tag = "medibloc371"
        logo1 = "chainMedibloc"
        apiName = "medibloc"
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/371'/0'/0/X")
        
        
        supportCosmosGrpc = true
        stakeDenom = "umed"
        bechAccountPrefix = "panacea"
        validatorPrefix = "panaceavaloper"
        grpcHost = "grpc-medibloc.cosmostation.io"
    }
}

