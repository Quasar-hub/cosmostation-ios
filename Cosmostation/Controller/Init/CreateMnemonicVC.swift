//
//  CreateMnemonicVC.swift
//  SplashWallet
//
//  Created by yongjoo jung on 2022/12/15.
//

import UIKit
import web3swift

class CreateMnemonicVC: BaseVC {
    
    @IBOutlet weak var nextBtn: BaseButton!
    @IBOutlet weak var warningTitleLabel: UILabel!
    @IBOutlet weak var warningMsgLabel: UILabel!
    @IBOutlet weak var mnemonicTitle: UILabel!
    @IBOutlet weak var wordCntBtn: UIButton!
    @IBOutlet weak var tapToCopyLabel: UILabel!
    
    @IBOutlet weak var wordCardView: CardView!
    @IBOutlet weak var word00: UILabel!
    @IBOutlet weak var word01: UILabel!
    @IBOutlet weak var word02: UILabel!
    @IBOutlet weak var word03: UILabel!
    @IBOutlet weak var word04: UILabel!
    @IBOutlet weak var word05: UILabel!
    @IBOutlet weak var word06: UILabel!
    @IBOutlet weak var word07: UILabel!
    @IBOutlet weak var word08: UILabel!
    @IBOutlet weak var word09: UILabel!
    @IBOutlet weak var word10: UILabel!
    @IBOutlet weak var word11: UILabel!
    @IBOutlet weak var word12: UILabel!
    @IBOutlet weak var word13: UILabel!
    @IBOutlet weak var word14: UILabel!
    @IBOutlet weak var word15: UILabel!
    @IBOutlet weak var word16: UILabel!
    @IBOutlet weak var word17: UILabel!
    @IBOutlet weak var word18: UILabel!
    @IBOutlet weak var word19: UILabel!
    @IBOutlet weak var word20: UILabel!
    @IBOutlet weak var word21: UILabel!
    @IBOutlet weak var word22: UILabel!
    @IBOutlet weak var word23: UILabel!
    
    @IBOutlet weak var stack04: UIStackView!
    @IBOutlet weak var stack05: UIStackView!
    @IBOutlet weak var stack06: UIStackView!
    @IBOutlet weak var stack07: UIStackView!
    @IBOutlet weak var word17View: UIView!
    @IBOutlet weak var word18View: UIView!
    
    var wordLabels: [UILabel] = [UILabel]()
    var accountName: String!
    var mnemonic: String!
    var bitsOfEntropy = 256

    override func viewDidLoad() {
        super.viewDidLoad()
        wordLabels = [word00, word01, word02, word03, word04, word05, word06, word07, word08, word09, word10, word11,
                      word12, word13, word14, word15, word16, word17, word18, word19, word20, word21, word22, word23]
        
        onUpdateView()
        onSetWordCntButton()
        
        let copyTap = UITapGestureRecognizer(target: self, action: #selector(onCopyMenmonics))
        copyTap.cancelsTouchesInView = false
        wordCardView.addGestureRecognizer(copyTap)
    }
    
    override func setLocalizedString() {
        navigationItem.title = NSLocalizedString("title_mnemonic_create", comment: "")
        warningTitleLabel.text = NSLocalizedString("str_warnning", comment: "")
        warningMsgLabel.text = NSLocalizedString("msg_mnemonic_wanning", comment: "")
        mnemonicTitle.text = NSLocalizedString("str_mnemonic_phrases", comment: "")
        tapToCopyLabel.text = NSLocalizedString("msg_tap_to_mnemonic_copy", comment: "")
        nextBtn.setTitle(NSLocalizedString("str_create_account", comment: ""), for: .normal)
    }
    
    func onSetWordCntButton() {
        wordCntBtn.showsMenuAsPrimaryAction = true
        wordCntBtn.overrideUserInterfaceStyle = .light
        let words_12 = UIAction(title: "12 Words", image: nil, handler: { _ in
            self.wordCntBtn.setTitle("12 Words", for: .normal)
            self.bitsOfEntropy = 128
            self.onUpdateView()
        })
        let words_16 = UIAction(title: "16 Words", image: nil, handler: { _ in
            self.wordCntBtn.setTitle("16 Words", for: .normal)
            self.bitsOfEntropy = 192
            self.onUpdateView()
        })
        let words_24 = UIAction(title: "24 Words", image: nil, handler: { _ in
            self.wordCntBtn.setTitle("24 Words", for: .normal)
            self.bitsOfEntropy = 256
            self.onUpdateView()
        })
        if #available(iOS 16.0, *) {
            wordCntBtn.menu = UIMenu(title: "",
                                     image: nil,
                                     identifier: nil,
                                     options: .displayInline,
                                     preferredElementSize: .medium,
                                     children: [words_12, words_16, words_24])
        } else {
            wordCntBtn.menu = UIMenu(title: "",
                                     image: nil,
                                     identifier: nil,
                                     options: .displayInline,
                                     children: [words_12, words_16, words_24])
        }
    }
    
    func onUpdateView() {
        mnemonic = try! BIP39.generateMnemonics(bitsOfEntropy: bitsOfEntropy)
        let words = mnemonic!.components(separatedBy: " ")
        for (index, word) in words.enumerated() {
            wordLabels[index].text = word
            wordLabels[index].adjustsFontSizeToFitWidth = true
        }
        if bitsOfEntropy == 128 {
            stack04.isHidden = true
            stack05.isHidden = true
            stack06.isHidden = true
            stack07.isHidden = true
            
        } else if bitsOfEntropy == 192 {
            stack04.isHidden = false
            stack05.isHidden = false
            word17View.isHidden = true
            word18View.isHidden = true
            stack06.isHidden = true
            stack07.isHidden = true
            
            
        } else if bitsOfEntropy == 256 {
            stack04.isHidden = false
            stack05.isHidden = false
            word17View.isHidden = false
            word18View.isHidden = false
            stack06.isHidden = false
            stack07.isHidden = false
            
        }
    }
    
    @IBAction func onClickNext(_ sender: UIButton) {
        onCreateAccount(accountName, mnemonic)
    }
    
    @objc func onCopyMenmonics() {
        UIPasteboard.general.string = mnemonic
        onShowToast(NSLocalizedString("mnemonic_copied", comment: ""))
    }
    
    func onCreateAccount(_ name: String, _ mnemonic: String) {
        showWait()
        DispatchQueue.global().async {
            let keychain = BaseData.instance.getKeyChain()
            let seed = KeyFac.getSeedFromWords(mnemonic)
            let newAccount = BaseAccount(name, .withMnemonic, "0")
            let id = BaseData.instance.insertAccount(newAccount)
            let newData = mnemonic + " : " + seed!.toHexString()
            try? keychain.set(newData, key: newAccount.uuid.sha1())
            BaseData.instance.setLastAccount(id)
            BaseData.instance.baseAccount = BaseData.instance.getLastAccount()
            
            DispatchQueue.main.async(execute: {
                self.hideWait()
                self.onStartMainTab()
            });
        }
    }
}
