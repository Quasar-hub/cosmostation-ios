//
//  ChainBitCoin44.swift
//  Cosmostation
//
//  Created by yongjoo jung on 8/20/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import Foundation

class ChainBitCoin44: BaseChain {
    
    override init() {
        super.init()
        
        name = "BitCoin"
        tag = "bitcoin84"
        logo1 = "chainBitcoin"
        isDefault = false
        apiName = "bitcoin"
        accountKeyType = AccountKeyType(.BITCOIN_Legacy, "m/44'/0'/0'/0/X")
        
        coinSymbol = "BTC"
        coinGeckoId = "bitcoin"
        coinLogo = "tokenBtc"
        
        mainUrl = ""
    }
    
    override func setInfoWithPrivateKey(_ priKey: Data) {
        privateKey = priKey
        publicKey = KeyFac.getPubKeyFromPrivateKey(privateKey!, accountKeyType.pubkeyType)
        mainAddress = KeyFac.getAddressFromPubKey(publicKey!, accountKeyType.pubkeyType, nil)
        
        print("ChainBitCoin44 ", mainAddress)
    }
    
}
