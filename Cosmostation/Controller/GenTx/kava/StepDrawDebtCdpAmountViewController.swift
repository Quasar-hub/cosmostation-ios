//
//  StepDrawDebtCdpAmountViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2020/04/01.
//  Copyright © 2020 wannabit. All rights reserved.
//

import UIKit
import GRPC
import NIO
import Alamofire

class StepDrawDebtCdpAmountViewController: BaseViewController, UITextFieldDelegate, SBCardPopupDelegate{
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var loadingImg: LoadingImageView!
    
    @IBOutlet weak var pDenomImg: UIImageView!
    @IBOutlet weak var pDenomLabel: UILabel!
    @IBOutlet weak var pAmountInput: AmountInputTextField!
    @IBOutlet weak var btnPAmountClear: UIButton!
    @IBOutlet weak var pAvailabeMinLabel: UILabel!
    @IBOutlet weak var pAvailabeMaxLabel: UILabel!
    @IBOutlet weak var pAvailableDenom: UILabel!

    @IBOutlet weak var beforeSafeTxt: UILabel!
    @IBOutlet weak var beforeSafeRate: UILabel!
    @IBOutlet weak var afterSafeTxt: UILabel!
    @IBOutlet weak var afterSafeRate: UILabel!
    
    var pageHolderVC: StepGenTxViewController!
    
    var mCDenom: String = ""
    var mPDenom: String = ""
    var cDpDecimal:Int16 = 6
    var pDpDecimal:Int16 = 6
    var mMarketID: String = ""
    
    var mCollateralParamType: String!
    var mCollateralParam: Kava_Cdp_V1beta1_CollateralParam!
    var mKavaCdpParams_gRPC: Kava_Cdp_V1beta1_Params!
    var mKavaOraclePrice: Kava_Pricefeed_V1beta1_CurrentPriceResponse?
    var mKavaMyCdp_gRPC: Kava_Cdp_V1beta1_CDPResponse?
    var mSelfDepositAmount: NSDecimalNumber = NSDecimalNumber.zero
    
    var currentPrice: NSDecimalNumber = NSDecimalNumber.zero
    var beforeLiquidationPrice: NSDecimalNumber = NSDecimalNumber.zero
    var afterLiquidationPrice: NSDecimalNumber = NSDecimalNumber.zero
    var beforeRiskRate: NSDecimalNumber = NSDecimalNumber.zero
    var afterRiskRate: NSDecimalNumber = NSDecimalNumber.zero
    
    var pMaxAmount: NSDecimalNumber = NSDecimalNumber.zero
    var pMinAmount: NSDecimalNumber = NSDecimalNumber.zero
    var toPAmount: NSDecimalNumber = NSDecimalNumber.zero
    var sumPAmount: NSDecimalNumber = NSDecimalNumber.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = WUtils.getChainType(account!.account_base_chain)
        self.pageHolderVC = self.parent as? StepGenTxViewController
        
        mCollateralParamType = pageHolderVC.mCollateralParamType
        mKavaCdpParams_gRPC = BaseData.instance.mKavaCdpParams_gRPC
        mCollateralParam = mKavaCdpParams_gRPC?.getCollateralParamByType(mCollateralParamType)
        mMarketID = mCollateralParam!.liquidationMarketID
        
        self.loadingImg.onStartAnimation()
        self.onFetchCdpData()
        
        pAmountInput.delegate = self
    }
    
    override func enableUserInteraction() {
        self.btnCancel.isUserInteractionEnabled = true
        self.btnNext.isUserInteractionEnabled = true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        if (text.contains(".") && string.contains(".") && range.length == 0) { return false }
        if (text.count == 0 && string.starts(with: ".")) { return false }
        if (text.contains(",") && string.contains(",") && range.length == 0) { return false }
        if (text.count == 0 && string.starts(with: ",")) { return false }
        if let index = text.range(of: ".")?.upperBound {
            if(text.substring(from: index).count > (pDpDecimal - 1) && range.length == 0) { return false }
        }
        if let index = text.range(of: ",")?.upperBound {
            if(text.substring(from: index).count > (pDpDecimal - 1) && range.length == 0) { return false }
        }
        return true
    }
    
    @IBAction func AmountChangedP(_ sender: AmountInputTextField) {
        guard let text = sender.text?.trimmingCharacters(in: .whitespaces) else {
            sender.layer.borderColor = UIColor.init(hexString: "f31963").cgColor
            return
        }
        if (text.count == 0) {
            sender.layer.borderColor = UIColor.white.cgColor
            return
        }
        let userInput = WUtils.localeStringToDecimal(text)
        if (text.count > 1 && userInput == NSDecimalNumber.zero) {
            sender.layer.borderColor = UIColor.init(hexString: "f31963").cgColor
            return
        }
        if (userInput.multiplying(byPowerOf10: pDpDecimal).compare(pMaxAmount).rawValue > 0) {
            sender.layer.borderColor = UIColor.init(hexString: "f31963").cgColor
            return
        }
        if (userInput.multiplying(byPowerOf10: pDpDecimal).compare(pMinAmount).rawValue < 0) {
            sender.layer.borderColor = UIColor.init(hexString: "f31963").cgColor
            return
        }
        sender.layer.borderColor = UIColor.white.cgColor
        onUpdateNextBtn()
    }
    
    @IBAction func onClickPAmountClear(_ sender: UIButton) {
        pAmountInput.text = ""
        onUpdateNextBtn()
    }
    
    @IBAction func onClickPMin(_ sender: UIButton) {
        let calValue = pMinAmount.multiplying(byPowerOf10: -pDpDecimal, withBehavior: WUtils.getDivideHandler(pDpDecimal))
        pAmountInput.text = WUtils.decimalNumberToLocaleString(calValue, pDpDecimal)
        AmountChangedP(pAmountInput)
    }
    
    @IBAction func onClickP1_4(_ sender: UIButton) {
        var calValue = pMaxAmount.multiplying(by: NSDecimalNumber.init(string: "0.25"))
        if (calValue.compare(pMinAmount).rawValue < 0) {
            calValue = pMinAmount
            self.onShowToast(NSLocalizedString("error_less_than_min_principal", comment: ""))
        }
        calValue = calValue.multiplying(byPowerOf10: -pDpDecimal, withBehavior: WUtils.getDivideHandler(pDpDecimal))
        pAmountInput.text = WUtils.decimalNumberToLocaleString(calValue, pDpDecimal)
        AmountChangedP(pAmountInput)
    }
    
    @IBAction func onClickPHalf(_ sender: UIButton) {
        var calValue = pMaxAmount.multiplying(by: NSDecimalNumber.init(string: "0.5"))
        if (calValue.compare(pMinAmount).rawValue < 0) {
            calValue = pMinAmount
            self.onShowToast(NSLocalizedString("error_less_than_min_principal", comment: ""))
        }
        calValue = calValue.multiplying(byPowerOf10: -pDpDecimal, withBehavior: WUtils.getDivideHandler(pDpDecimal))
        pAmountInput.text = WUtils.decimalNumberToLocaleString(calValue, pDpDecimal)
        AmountChangedP(pAmountInput)
    }
    
    @IBAction func onClickPAdd3_4(_ sender: UIButton) {
        var calValue = pMaxAmount.multiplying(by: NSDecimalNumber.init(string: "0.75"))
        if (calValue.compare(pMinAmount).rawValue < 0) {
            calValue = pMinAmount
            self.onShowToast(NSLocalizedString("error_less_than_min_principal", comment: ""))
        }
        calValue = calValue.multiplying(byPowerOf10: -pDpDecimal, withBehavior: WUtils.getDivideHandler(pDpDecimal))
        pAmountInput.text = WUtils.decimalNumberToLocaleString(calValue, pDpDecimal)
        AmountChangedP(pAmountInput)
    }
    
    @IBAction func onClickPMax(_ sender: UIButton) {
        let maxValue = pMaxAmount.multiplying(byPowerOf10: -pDpDecimal, withBehavior: WUtils.getDivideHandler(pDpDecimal))
        pAmountInput.text = WUtils.decimalNumberToLocaleString(maxValue, pDpDecimal)
        AmountChangedP(pAmountInput)
    }
    

    
    @IBAction func onClickCancel(_ sender: UIButton) {
        self.btnCancel.isUserInteractionEnabled = false
        self.btnNext.isUserInteractionEnabled = false
        pageHolderVC.onBeforePage()
    }
    
    @IBAction func onClickNext(_ sender: UIButton) {
        if (isValiadPAmount()) {
            view.endEditing(true)
            let popupVC = RiskCheckPopupViewController(nibName: "RiskCheckPopupViewController", bundle: nil)
            popupVC.type = popupVC.RISK_POPUP_CHANGE
            popupVC.cDenom = self.mCDenom
            popupVC.DNcurrentPrice = self.currentPrice
            popupVC.DNbeforeLiquidationPrice = self.beforeLiquidationPrice
            popupVC.DNbeforeRiskRate = self.beforeRiskRate
            popupVC.DNafterLiquidationPrice = self.afterLiquidationPrice
            popupVC.DNafterRiskRate = self.afterRiskRate
            
            let cardPopup = SBCardPopupViewController(contentViewController: popupVC)
            cardPopup.resultDelegate = self
            cardPopup.show(onViewController: self)

        } else {
            self.onShowToast(NSLocalizedString("error_amount", comment: ""))
        }
    }
    
    func SBCardPopupResponse(type:Int, result: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
            if(result == 10) {
                let pCoin = Coin.init(self.mPDenom, self.toPAmount.stringValue)
                self.pageHolderVC.mPrincipal = pCoin

                self.pageHolderVC.currentPrice = self.currentPrice
                self.pageHolderVC.beforeLiquidationPrice = self.beforeLiquidationPrice
                self.pageHolderVC.afterLiquidationPrice = self.afterLiquidationPrice
                self.pageHolderVC.beforeRiskRate = self.beforeRiskRate
                self.pageHolderVC.afterRiskRate = self.afterRiskRate
                self.pageHolderVC.mPDenom = self.mPDenom
                self.pageHolderVC.totalLoanAmount = self.sumPAmount
                self.pageHolderVC.mKavaCollateralParam = self.mCollateralParam

                self.btnCancel.isUserInteractionEnabled = false
                self.btnNext.isUserInteractionEnabled = false
                self.pageHolderVC.onNextPage()
            }
        })
    }
    
    func isValiadPAmount() -> Bool {
        let text = pAmountInput.text?.trimmingCharacters(in: .whitespaces)
        if (text == nil || text!.count == 0) { return false }
        let userInput = WUtils.localeStringToDecimal(text!)
        if (userInput == NSDecimalNumber.zero) { return false }
        if (userInput.multiplying(byPowerOf10: pDpDecimal).compare(pMaxAmount).rawValue > 0 ||
            userInput.multiplying(byPowerOf10: pDpDecimal).compare(pMinAmount).rawValue < 0) {
            return false
        }
        
        toPAmount = userInput.multiplying(byPowerOf10: pDpDecimal)
        sumPAmount = mKavaMyCdp_gRPC!.getEstimatedTotalDebt(mCollateralParam!).adding(toPAmount)
        let collateralAmount = mKavaMyCdp_gRPC!.getRawCollateralAmount().multiplying(byPowerOf10: -cDpDecimal)
        let rawDebtAmount = sumPAmount.multiplying(by: mCollateralParam!.getLiquidationRatioAmount()).multiplying(byPowerOf10: -pDpDecimal)
        afterLiquidationPrice = rawDebtAmount.dividing(by: collateralAmount, withBehavior: WUtils.getDivideHandler(pDpDecimal))
        afterRiskRate = NSDecimalNumber.init(string: "100").subtracting(currentPrice.subtracting(afterLiquidationPrice).multiplying(byPowerOf10: 2).dividing(by: currentPrice, withBehavior: WUtils.handler2Down))
        
//        print("currentPrice ", currentPrice)
//        print("afterLiquidationPrice ", afterLiquidationPrice)
//        print("afterRiskRate ", afterRiskRate)
        return true
    }
    
    
    func onUpdateNextBtn() {
        if (!isValiadPAmount()) {
            btnNext.backgroundColor = UIColor.clear
            btnNext.setTitle(NSLocalizedString("tx_next", comment: ""), for: .normal)
            btnNext.setTitleColor(COLOR_PHOTON, for: .normal)
            btnNext.layer.borderWidth = 1.0
            afterSafeRate.isHidden = true
            afterSafeTxt.isHidden = true
        } else {
            btnNext.setTitleColor(UIColor.black, for: .normal)
            btnNext.layer.borderWidth = 0.0
            if (afterRiskRate.doubleValue <= 50) {
                btnNext.backgroundColor = COLOR_CDP_SAFE
//                btnNext.setTitle(afterRiskRate.stringValue + " SAFE", for: .normal)
                btnNext.setTitle("SAFE", for: .normal)
                
            } else if (afterRiskRate.doubleValue < 80) {
                btnNext.backgroundColor = COLOR_CDP_STABLE
//                btnNext.setTitle(afterRiskRate.stringValue + " STABLE", for: .normal)
                btnNext.setTitle("STABLE", for: .normal)
                
            } else {
                btnNext.backgroundColor = COLOR_CDP_DANGER
//                btnNext.setTitle(afterRiskRate.stringValue + " DANGER", for: .normal)
                btnNext.setTitle("DANGER", for: .normal)
            }
            WUtils.showRiskRate2(afterRiskRate, afterSafeRate, afterSafeTxt)
            afterSafeRate.isHidden = false
            afterSafeTxt.isHidden = false
        }
    }
    
    var mFetchCnt = 0
    func onFetchCdpData() {
        self.mFetchCnt = 3
        self.onFetchgRPCKavaPrice(mMarketID)
        self.onFetchgRPCMyCdp(account!.account_address, mCollateralParamType)
        self.onFetchCdpDeposit(account!.account_address, mCollateralParamType!)
    }
    
    func onFetchFinished() {
        self.mFetchCnt = self.mFetchCnt - 1
        if (mFetchCnt <= 0) {
            if (mKavaMyCdp_gRPC ==  nil || mKavaOraclePrice == nil) { return }
            self.mCDenom = mCollateralParam!.getcDenom()!
            self.mPDenom = mCollateralParam!.getpDenom()!
            self.cDpDecimal = WUtils.getKavaCoinDecimal(mCDenom)
            self.pDpDecimal = WUtils.getKavaCoinDecimal(mPDenom)
            self.currentPrice = NSDecimalNumber.init(string: mKavaOraclePrice?.price).multiplying(byPowerOf10: -18, withBehavior: WUtils.handler6)
            
            let currentPAmount = mKavaMyCdp_gRPC!.getRawPrincipalAmount()
            let debtFloor = mKavaCdpParams_gRPC!.getDebtFloorAmount()
            
            if (currentPAmount.compare(debtFloor).rawValue > 0) {
                pMinAmount = NSDecimalNumber.one
            } else {
                pMinAmount = debtFloor.subtracting(currentPAmount)
            }

            //calculate max debtable amount from current state.
            pMaxAmount = mKavaMyCdp_gRPC!.getMoreLoanableAmount(mCollateralParam!)

            pAvailabeMinLabel.attributedText = WUtils.displayAmount2(pMinAmount.stringValue, pAvailabeMinLabel.font!, pDpDecimal, pDpDecimal)
            pAvailabeMaxLabel.attributedText = WUtils.displayAmount2(pMaxAmount.stringValue, pAvailabeMaxLabel.font!, pDpDecimal, pDpDecimal)

            beforeLiquidationPrice = mKavaMyCdp_gRPC!.getLiquidationPrice(mCDenom, mPDenom, mCollateralParam!)
            beforeRiskRate = NSDecimalNumber.init(string: "100").subtracting(currentPrice.subtracting(beforeLiquidationPrice).multiplying(byPowerOf10: 2).dividing(by: currentPrice, withBehavior: WUtils.handler2Down))
            WUtils.showRiskRate2(beforeRiskRate, beforeSafeRate, beforeSafeTxt)
            
//            print("currentPrice ", currentPrice)
//            print("beforeLiquidationPrice ", beforeLiquidationPrice)
//            print("beforeRiskRate ", beforeRiskRate)
            
            pDenomLabel.text = WUtils.getKavaTokenName(mPDenom)
            pAvailableDenom.text = WUtils.getKavaTokenName(mPDenom)
            let pUrl = KAVA_COIN_IMG_URL + mPDenom + ".png"
            self.pDenomImg.af_setImage(withURL: URL(string: pUrl)!)
            self.loadingImg.onStopAnimation()
            self.loadingImg.isHidden = true
        }
    }
    
    func onFetchgRPCKavaPrice(_ marketId: String) {
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.chainType!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let req = Kava_Pricefeed_V1beta1_QueryPriceRequest.with {
                    $0.marketID = marketId
                }
                if let response = try? Kava_Pricefeed_V1beta1_QueryClient(channel: channel).price(req, callOptions: BaseNetWork.getCallOptions()).response.wait() {
                    self.mKavaOraclePrice = response.price
                }
                try channel.close().wait()
                
            } catch {
                print("onFetchgRPCPrices failed: \(error)")
            }
            DispatchQueue.main.async(execute: { self.onFetchFinished() });
        }
        
    }
    
    func onFetchgRPCMyCdp(_ address: String, _ collateralType: String) {
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.chainType!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let req = Kava_Cdp_V1beta1_QueryCdpRequest.with { $0.owner = address; $0.collateralType = collateralType }
                if let response = try? Kava_Cdp_V1beta1_QueryClient(channel: channel).cdp(req, callOptions: BaseNetWork.getCallOptions()).response.wait() {
                    //                    print("onFetchgRPCMyCdp ", response.cdp)
                    self.mKavaMyCdp_gRPC = response.cdp
                }
                try channel.close().wait()
                
            } catch {
                print("onFetchgRPCMyCdp failed: \(error)")
            }
            DispatchQueue.main.async(execute: { self.onFetchFinished() });
        }
    }
    
    func onFetchCdpDeposit(_ address: String, _ collateralType: String) {
        let request = Alamofire.request(BaseNetWork.depositCdpUrl(chainType, address, collateralType), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
        request.responseJSON { (response) in
            switch response.result {
            case .success(let res):
                guard let responseData = res as? NSDictionary, let _ = responseData.object(forKey: "height") as? String else {
                    self.onFetchFinished()
                    return
                }
                let cdpDeposits = KavaCdpDeposits.init(responseData)
                if let selfDeposit = cdpDeposits.result?.filter({ $0.depositor == self.account?.account_address}).first {
                    self.mSelfDepositAmount = NSDecimalNumber.init(string: selfDeposit.amount?.amount)
                }
//                print("mSelfDepositAmount ", self.mSelfDepositAmount)
                
            case .failure(let error):
                print("onFetchCdpDeposit ", error)
            }
            self.onFetchFinished()
        }
    }

}