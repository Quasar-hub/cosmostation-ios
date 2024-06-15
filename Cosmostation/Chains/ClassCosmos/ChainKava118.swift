//
//  ChainKava_Legacy.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/13.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainKava118: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Kava"
        tag = "kava118"
        logo1 = "chainKava"
        logo2 = "chainKava2"
        isDefault = false
        supportCosmos = true
        apiName = "kava"
        
        stakeDenom = "ukava"
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/118'/0'/0/X")
        bechAccountPrefix = "kava"
        validatorPrefix = "kavavaloper"
        grpcHost = "grpc-kava.cosmostation.io"
        
        initFetcher()
    }
}
