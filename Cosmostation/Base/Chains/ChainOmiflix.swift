//
//  ChainOmiflix.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/05/10.
//  Copyright © 2022 wannabit. All rights reserved.
//

import UIKit
import Foundation

class ChainOmniflix: ChainConfig {
    var isGrpc = true
    var chainType = ChainType.OMNIFLIX_MAIN
    var chainImg = UIImage(named: "chainOmniflix")
    var chainInfoImg = UIImage(named: "infoOmniflix")
    var chainInfoTitle = NSLocalizedString("send_guide_title_omniflix", comment: "")
    var chainInfoMsg = NSLocalizedString("send_guide_msg_omniflix", comment: "")
    var chainColor = UIColor(named: "omniflix")!
    var chainColorBG = UIColor(named: "omniflix_bg")!
    var chainTitle = "(Omniflix Mainnet)"
    var chainTitle2 = "OMNIFLIX"
    var chainDBName = "SUPPORT_CHAIN_OMNIFLIX"
    var chainAPIName = "flix"
    
    var stakeDenomImg = UIImage(named: "tokenOmniflix")
    var stakeDenom = "uflix"
    var stakeSymbol = "FLIX"
    var stakeSendImg = UIImage(named: "sendImg")
    var stakeSendBg = UIColor(named: "omniflix")!
    
    var addressPrefix = "omniflix"
    let addressHdPath0 = "m/44'/118'/0'/0/X"
    
    var pushSupport = false
    var grpcUrl = "lcd-omniflix-app.cosmostation.io"
    var grpcPort = "9090"
    var lcdUrl = "https://lcd-omniflix-app.cosmostation.io"
    var apiUrl = "https://api-omniflix.cosmostation.io/"
    var explorerUrl = MintscanUrl + "omniflix/"
    var validatorImgUrl = MonikerUrl + "omniflix/"
    var relayerImgUrl = RelayerUrl + "omniflix/relay-omniflix-unknown.png"
    var priceUrl = CoingeckoUrl + "omniflix-network"
    
    required init(_ chainType: ChainType) {
        self.chainType = chainType
    }
    
    func supportHdPaths() -> Array<String> {
        return [addressHdPath0]
    }
    
    func getHdPath(_ type: Int, _ path: Int) -> String {
        supportHdPaths()[type].replacingOccurrences(of: "X", with: String(path))
    }
    
    func getInfoLink1() -> String {
        return "https://www.omniflix.network/"
    }

    func getInfoLink2() -> String {
        return "https://blog.omniflix.network/"
    }
}

