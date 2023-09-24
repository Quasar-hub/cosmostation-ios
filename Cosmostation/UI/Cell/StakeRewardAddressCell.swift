//
//  StakeRewardAddressCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/09/23.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit

class StakeRewardAddressCell: UITableViewCell {
    
    @IBOutlet weak var rootView: CardViewCell!
    @IBOutlet weak var rewardAddressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        rootView.setBlur()
    }
    
    override func prepareForReuse() {
        rootView.setBlur()
    }
    
    func onBindRewardAddress(_ address: String?) {
        rewardAddressLabel.text = address
    }
    
}
