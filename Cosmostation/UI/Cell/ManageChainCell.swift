//
//  ManageChainCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/09/18.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit

class ManageChainCell: UITableViewCell {
    
    @IBOutlet weak var rootView: CardViewCell!
    @IBOutlet weak var logoImg1: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var evmLayer: UIView!
    @IBOutlet weak var evmEndpointLabel: UILabel!
    @IBOutlet weak var evmEndpointTag: RoundedPaddingLabel!
    @IBOutlet weak var cosmosLayer: UIView!
    @IBOutlet weak var cosmosEndpointLabel: UILabel!
    @IBOutlet weak var cosmosEndpointTag: RoundedPaddingLabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        evmLayer.isHidden = true
        cosmosLayer.isHidden = true
    }
    
    override func prepareForReuse() {
        evmLayer.isHidden = true
        cosmosLayer.isHidden = true
    }
    
    
    func bindManageChain(_ chain: BaseChain) {
        logoImg1.image =  UIImage.init(named: chain.logo1)
        nameLabel.text = chain.name.uppercased()
        
        if (chain.getCosmosfetcher()?.getEndpointType() == .UseGRPC) {
            cosmosLayer.isHidden = false
            cosmosEndpointTag.text = "gRPC"
            cosmosEndpointLabel.text = chain.getCosmosfetcher()!.getGrpc().host + " : " +  String(chain.getCosmosfetcher()!.getGrpc().port)
            cosmosEndpointLabel.adjustsFontSizeToFitWidth = true
            
        } else if (chain.getCosmosfetcher()?.getEndpointType() == .UseLCD) {
            cosmosLayer.isHidden = false
            cosmosEndpointTag.text = "Rest"
            cosmosEndpointLabel.text = chain.getCosmosfetcher()?.getLcd().replacingOccurrences(of: "https://", with: "")
            cosmosEndpointLabel.adjustsFontSizeToFitWidth = true
        }
        
        if (chain.supportEvm) {
            evmLayer.isHidden = false
            evmEndpointTag.text = "Evm RPC"
            evmEndpointLabel.text = chain.getEvmfetcher()!.getEvmRpc().replacingOccurrences(of: "https://", with: "")
            evmEndpointLabel.adjustsFontSizeToFitWidth = true
        }
        
        if let suiFetcher = (chain as? ChainSui)?.getSuiFetcher() {
            //using evm field
            evmLayer.isHidden = false
            evmEndpointTag.text = "RPC"
            evmEndpointLabel.text = suiFetcher.getSuiRpc().replacingOccurrences(of: "https://", with: "")
            evmEndpointLabel.adjustsFontSizeToFitWidth = true
        } else if let btcFetcher = (chain as? ChainBitCoin84)?.getBtcFetcher() {
            //using evm field
            evmLayer.isHidden = false
            evmEndpointTag.text = "API"
            evmEndpointLabel.text = btcFetcher.mempoolUrl().replacingOccurrences(of: "https://", with: "")
            evmEndpointLabel.adjustsFontSizeToFitWidth = true
        }
    }
    
}
