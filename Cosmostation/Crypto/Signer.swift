//
//  Signer.swift
//  Cosmostation
//
//  Created by 정용주 on 2020/12/14.
//  Copyright © 2020 wannabit. All rights reserved.
//

import Foundation
import HDWalletKit
import secp256k1
import SwiftProtobuf
import SwiftyJSON

class Signer {
//    //Tx for Common Denom Transfer
//    static func genSimpleSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                              _ toAddress: String, _ amount: Array<Coin>,
//                              _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType)  -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let sendMsg = genSendMsg(auth, toAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, sendMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulSimpleSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                _ toAddress: String, _ amount: Array<Coin>,
//                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType)  -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let sendMsg = genSendMsg(auth, toAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, sendMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSendMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ toAddress: String, _ amount: Array<Coin>) -> [Google_Protobuf_Any] {
//        let sendCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount[0].denom
//            $0.amount = amount[0].amount
//        }
//        let sendMsg = Cosmos_Bank_V1beta1_MsgSend.with {
//            $0.fromAddress = WUtils.onParseAuthGrpc(auth).0!
//            $0.toAddress = toAddress
//            $0.amount = [sendCoin]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.bank.v1beta1.MsgSend"
//            $0.value = try! sendMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
    //Tx for Common Delegate
    static func genDelegateTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse,
                              _ toDelegate: Cosmos_Staking_V1beta1_MsgDelegate,
                              _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let deleMsg = genDelegateMsg(auth, toDelegate)
        return getSignedTx(auth, deleMsg, fee, memo, baseChain)
    }
    
    static func genDelegateTxSimul(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse,
                                   _ toDelegate: Cosmos_Staking_V1beta1_MsgDelegate,
                                   _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let deleMsg = genDelegateMsg(auth, toDelegate)
        return getSimulateTx(auth, deleMsg, fee, memo, baseChain)
    }
    
    static func genDelegateMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse,
                               _ toDelegate: Cosmos_Staking_V1beta1_MsgDelegate) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.staking.v1beta1.MsgDelegate"
            $0.value = try! toDelegate.serializedData()
        }
        return [anyMsg]
    }
//    
//    //Tx for Tgrade Delegate
//    static func genSignedTgradeDelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ toValAddress: String, _ availableAmount: Coin, _ vestingAmount: Coin,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let deleMsg = genTgradeDelegateMsg(auth, toValAddress, availableAmount, vestingAmount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, deleMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateTgradeDelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ toValAddress: String, _ availableAmount: Coin, _ vestingAmount: Coin,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let deleMsg = genTgradeDelegateMsg(auth, toValAddress, availableAmount, vestingAmount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, deleMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genTgradeDelegateMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ toValAddress: String, _ availableAmount: Coin, _ vestingAmount: Coin) -> [Google_Protobuf_Any] {
//        let availableCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = availableAmount.denom
//            $0.amount = availableAmount.amount
//        }
//        let vestingCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = vestingAmount.denom
//            $0.amount = vestingAmount.amount
//        }
//        let deleMsg = Confio_Poe_V1beta1_MsgDelegate.with {
//            $0.operatorAddress = toValAddress
//            $0.amount = availableCoin
//            $0.vestingAmount = vestingCoin
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/confio.poe.v1beta1.MsgDelegate"
//            $0.value = try! deleMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
    //Tx for Common UnDelegate
    static func genUndelegateTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse,
                                _ toUndelegate: Cosmos_Staking_V1beta1_MsgUndelegate,
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let undeleMsg = genUndelegateMsg(auth, toUndelegate)
        return getSignedTx(auth, undeleMsg, fee, memo, baseChain)
    }
    
    static func genUndelegateTxSimul(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse,
                                     _ toUndelegate: Cosmos_Staking_V1beta1_MsgUndelegate,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let undeleMsg = genUndelegateMsg(auth, toUndelegate)
        return getSimulateTx(auth, undeleMsg, fee, memo, baseChain)
    }
    
    static func genUndelegateMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ toUndelegate: Cosmos_Staking_V1beta1_MsgUndelegate) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.staking.v1beta1.MsgUndelegate"
            $0.value = try! toUndelegate.serializedData()
        }
        return [anyMsg]
    }
    

    //Tx for Common ReDelegate
    static func genRedelegateTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, 
                                _ toRedelegate: Cosmos_Staking_V1beta1_MsgBeginRedelegate,
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let redeleMsg = genRedelegateMsg(auth, toRedelegate)
        return getSignedTx(auth, redeleMsg, fee, memo, baseChain)
    }
    
    static func genRedelegateTxSimul(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse,
                                     _ toRedelegate: Cosmos_Staking_V1beta1_MsgBeginRedelegate,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let redeleMsg = genRedelegateMsg(auth, toRedelegate)
        return getSimulateTx(auth, redeleMsg, fee, memo, baseChain)
    }
    
    static func genRedelegateMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ toRedelegate: Cosmos_Staking_V1beta1_MsgBeginRedelegate) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.staking.v1beta1.MsgBeginRedelegate"
            $0.value = try! toRedelegate.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Common Claim Staking Rewards
    static func genClaimRewardsTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse,
                                      _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward],
                                      _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest  {
        let claimRewardMsg = genClaimStakingRewardMsg(auth, rewards)
        return getSignedTx(auth, claimRewardMsg, fee, memo, baseChain)
    }
    
    static func genClaimRewardsSimul(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse,
                                      _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward],
                                      _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let claimRewardMsg = genClaimStakingRewardMsg(auth, rewards)
        return getSimulateTx(auth, claimRewardMsg, fee, memo, baseChain)
    }
    
    static func genClaimStakingRewardMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, 
                                         _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward]) -> [Google_Protobuf_Any] {
        var anyMsgs = [Google_Protobuf_Any]()
        for reward in rewards {
            let claimMsg = Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.with {
                $0.delegatorAddress = WUtils.onParseAuthGrpc(auth).0!
                $0.validatorAddress = reward.validatorAddress
            }
            let anyMsg = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
                $0.value = try! claimMsg.serializedData()
            }
            anyMsgs.append(anyMsg)
        }
        return anyMsgs
    }
    
//    
//    //Tx for Common Re-Invest
//    static func genSignedReInvestTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ valAddress: String, _ amount: Coin,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let reinvestMsg = genReInvestMsg(auth, valAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, reinvestMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateReInvestTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ valAddress: String, _ amount: Coin,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let reinvestMsg = genReInvestMsg(auth, valAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, reinvestMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genReInvestMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ valAddress: String, _ amount: Coin) -> [Google_Protobuf_Any] {
//        var anyMsgs = Array<Google_Protobuf_Any>()
//        let claimMsg = Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.with {
//            $0.delegatorAddress = WUtils.onParseAuthGrpc(auth).0!
//            $0.validatorAddress = valAddress
//        }
//        let claimAnyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
//            $0.value = try! claimMsg.serializedData()
//        }
//        anyMsgs.append(claimAnyMsg)
//        let deleCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount.denom
//            $0.amount = amount.amount
//        }
//        let deleMsg = Cosmos_Staking_V1beta1_MsgDelegate.with {
//            $0.delegatorAddress = WUtils.onParseAuthGrpc(auth).0!
//            $0.validatorAddress = valAddress
//            $0.amount = deleCoin
//        }
//        let deleAnyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.staking.v1beta1.MsgDelegate"
//            $0.value = try! deleMsg.serializedData()
//        }
//        anyMsgs.append(deleAnyMsg)
//        return anyMsgs
//    }
//    
//    
//    //Tx for Common Compounding
//    static func genSignedCompounding(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                     _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>,
//                                     _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let compoundingMsg = genCompoundingMsg(auth, rewards, chainType)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, compoundingMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateCompounding(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                       _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>,
//                                       _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let compoundingMsg = genCompoundingMsg(auth, rewards, chainType)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, compoundingMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCompoundingMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>, _ chainType: ChainType) -> [Google_Protobuf_Any] {
//        let chainConfig = ChainFactory.getChainConfig(chainType)
//        var anyMsgs = Array<Google_Protobuf_Any>()
//        rewards.forEach { reward in
//            let claimMsg = Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.with {
//                $0.delegatorAddress = WUtils.onParseAuthGrpc(auth).0!
//                $0.validatorAddress = reward.validatorAddress
//            }
//            let claimAnyMsg = Google_Protobuf_Any.with {
//                $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
//                $0.value = try! claimMsg.serializedData()
//            }
//            anyMsgs.append(claimAnyMsg)
//            let rewardCoin = reward.reward.filter({ $0.denom == chainConfig?.stakeDenom }).first
//            let deleCoin = Cosmos_Base_V1beta1_Coin.with {
//                $0.denom = rewardCoin!.denom
//                $0.amount = NSDecimalNumber.init(string: rewardCoin!.amount).multiplying(byPowerOf10: -18, withBehavior: WUtils.handler0).stringValue
//            }
//            let deleMsg = Cosmos_Staking_V1beta1_MsgDelegate.with {
//                $0.delegatorAddress = WUtils.onParseAuthGrpc(auth).0!
//                $0.validatorAddress = reward.validatorAddress
//                $0.amount = deleCoin
//            }
//            let deleAnyMsg = Google_Protobuf_Any.with {
//                $0.typeURL = "/cosmos.staking.v1beta1.MsgDelegate"
//                $0.value = try! deleMsg.serializedData()
//            }
//            anyMsgs.append(deleAnyMsg)
//        }
//        return anyMsgs
//    }
//    
//    //Tx for Common Vote
//    static func genSignedVoteTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ proposals: Array<MintscanProposalDetail>,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let voteMsg = genVoteMsg(auth, proposals)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, voteMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateVoteTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                      _ proposals: Array<MintscanProposalDetail>,
//                                      _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let voteMsg = genVoteMsg(auth, proposals)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, voteMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genVoteMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ proposals: Array<MintscanProposalDetail>) -> [Google_Protobuf_Any] {
//        var anyMsgs = Array<Google_Protobuf_Any>()
//        proposals.forEach { proposal in
//            let voteMsg = Cosmos_Gov_V1beta1_MsgVote.with {
//                $0.voter = WUtils.onParseAuthGrpc(auth).0!
//                $0.proposalID = UInt64(proposal.id!)!
//                if (proposal.getMyVote() == "Yes") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.yes
//                } else if (proposal.getMyVote() == "No") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.no
//                } else if (proposal.getMyVote() == "NoWithVeto") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.noWithVeto
//                } else if (proposal.getMyVote() == "Abstain") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.abstain
//                }
//            }
//            let anyMsg = Google_Protobuf_Any.with {
//                $0.typeURL = "/cosmos.gov.v1beta1.MsgVote"
//                $0.value = try! voteMsg.serializedData()
//            }
//            anyMsgs.append(anyMsg)
//        }
//        return anyMsgs
//    }
//    
//    //Tx for Common Reward Address Change
//    static func genSignedSetRewardAddressTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                _ newRewardAddress: String,
//                                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let setRewardAddressMsg = genSetRewardAddressMsg(auth, newRewardAddress)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, setRewardAddressMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateetRewardAddressTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                 _ newRewardAddress: String,
//                                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let setRewardAddressMsg = genSetRewardAddressMsg(auth, newRewardAddress)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, setRewardAddressMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSetRewardAddressMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ newRewardAddress: String) -> [Google_Protobuf_Any] {
//        let rewardAddressMsg = Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress.with {
//            $0.delegatorAddress = WUtils.onParseAuthGrpc(auth).0!
//            $0.withdrawAddress = newRewardAddress
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.distribution.v1beta1.MsgSetWithdrawAddress"
//            $0.value = try! rewardAddressMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    //for Starname custom msgs
//    //Tx for Starname Register Domain
//    static func genSignedRegisterDomainMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                 _ domain: String, _ admin: String, _ type: String,
//                                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let setRegisterDomainMsg = genSetRegisterDomainMsg(domain, admin, type)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, setRegisterDomainMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateRegisterDomainMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                   _ domain: String, _ admin: String, _ type: String,
//                                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let setRegisterDomainMsg = genSetRegisterDomainMsg(domain, admin, type)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, setRegisterDomainMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSetRegisterDomainMsg(_ domain: String, _ admin: String, _ type: String) -> [Google_Protobuf_Any] {
//        let registerdomainMsg = Starnamed_X_Starname_V1beta1_MsgRegisterDomain.with {
//            $0.name = domain
//            $0.admin = admin
//            $0.domainType = type
//            $0.broker = ""
//            $0.payer = ""
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/starnamed.x.starname.v1beta1.MsgRegisterDomain"
//            $0.value = try! registerdomainMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Starname Register Account
//    static func genSignedRegisterAccountMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                  _ domain: String, _ name: String, _ owner: String, _ registerer: String, _ resources: Array<Starnamed_X_Starname_V1beta1_Resource>,
//                                                  _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let registerAccountMsg = genRegisterAccountMsg(domain, name, owner, registerer, resources)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, registerAccountMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateRegisterAccountMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                    _ domain: String, _ name: String, _ owner: String, _ registerer: String, _ resources: Array<Starnamed_X_Starname_V1beta1_Resource>,
//                                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let registerAccountMsg = genRegisterAccountMsg(domain, name, owner, registerer, resources)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, registerAccountMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genRegisterAccountMsg(_ domain: String, _ name: String, _ owner: String, _ registerer: String, _ resources: Array<Starnamed_X_Starname_V1beta1_Resource>) -> [Google_Protobuf_Any] {
//        let registerAccountMsg = Starnamed_X_Starname_V1beta1_MsgRegisterAccount.with {
//            $0.domain = domain
//            $0.name = name
//            $0.owner = owner
//            $0.registerer = registerer
//            $0.resources = resources
//            $0.broker = ""
//            $0.payer = ""
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/starnamed.x.starname.v1beta1.MsgRegisterAccount"
//            $0.value = try! registerAccountMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Starname Delete Domain
//    static func genSignedDeleteDomainMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                               _ domain: String, _ owner: String,
//                                               _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let deleteDomainMsg = genDeleteDomainMsg(domain, owner)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, deleteDomainMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateDeleteDomainMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                 _ domain: String, _ owner: String,
//                                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let deleteDomainMsg = genDeleteDomainMsg(domain, owner)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, deleteDomainMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genDeleteDomainMsg(_ domain: String, _ owner: String) -> [Google_Protobuf_Any] {
//        let deleteDomainMsg = Starnamed_X_Starname_V1beta1_MsgDeleteDomain.with {
//            $0.domain = domain
//            $0.owner = owner
//            $0.payer = ""
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/starnamed.x.starname.v1beta1.MsgDeleteDomain"
//            $0.value = try! deleteDomainMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//
//    //Tx for Starname Delete Account
//    static func genSignedDeleteAccountMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                _ domain: String, _ name: String, _ owner: String,
//                                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let deleteAccountMsg = genDeleteAccountMsg(domain, name, owner)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, deleteAccountMsg, privateKey, publicKey, fee, memo)
//    }
//
//    static func genSimulateDeleteAccountMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                  _ domain: String, _ name: String, _ owner: String,
//                                                  _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let deleteAccountMsg = genDeleteAccountMsg(domain, name, owner)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, deleteAccountMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genDeleteAccountMsg(_ domain: String, _ name: String, _ owner: String) -> [Google_Protobuf_Any] {
//        let deleteAccountMsg = Starnamed_X_Starname_V1beta1_MsgDeleteAccount.with {
//            $0.domain = domain
//            $0.name = name
//            $0.owner = owner
//            $0.payer = ""
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/starnamed.x.starname.v1beta1.MsgDeleteAccount"
//            $0.value = try! deleteAccountMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//     
//    //Tx for Starname Renew Domain
//    static func genSignedRenewDomainMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                              _ domain: String, _ signer: String,
//                                              _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let renewDomainMsg = genRenewDomainMsg(domain, signer)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, renewDomainMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateRenewDomainMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                _ domain: String, _ signer: String,
//                                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let renewDomainMsg = genRenewDomainMsg(domain, signer)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, renewDomainMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genRenewDomainMsg(_ domain: String, _ signer: String) -> [Google_Protobuf_Any] {
//        let renewDomainMsg = Starnamed_X_Starname_V1beta1_MsgRenewDomain.with {
//            $0.domain = domain
//            $0.signer = signer
//            $0.payer = ""
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/starnamed.x.starname.v1beta1.MsgRenewDomain"
//            $0.value = try! renewDomainMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Starname Renew Account
//    static func genSignedRenewAccountMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                              _ domain: String, _ name: String, _ signer: String,
//                                              _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let renewAccountMsg = genRenewAccountMsg(domain, name, signer)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, renewAccountMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateRenewAccountMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                 _ domain: String, _ name: String, _ signer: String,
//                                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let renewAccountMsg = genRenewAccountMsg(domain, name, signer)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, renewAccountMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genRenewAccountMsg(_ domain: String, _ name: String, _ signer: String) -> [Google_Protobuf_Any] {
//        let renewAccountMsg = Starnamed_X_Starname_V1beta1_MsgRenewAccount.with {
//            $0.domain = domain
//            $0.name = name
//            $0.signer = signer
//            $0.payer = ""
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/starnamed.x.starname.v1beta1.MsgRenewAccount"
//            $0.value = try! renewAccountMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Starname Replace Resource
//    static func genSignedReplaceResourceMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                  _ domain: String, _ name: String?, _ owner: String, _ resources: Array<Starnamed_X_Starname_V1beta1_Resource>,
//                                                  _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let replaceResourceMsg = genReplaceResourceMsg(domain, name, owner, resources)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, replaceResourceMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateReplaceResourceMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                    _ domain: String, _ name: String?, _ owner: String, _ resources: Array<Starnamed_X_Starname_V1beta1_Resource>,
//                                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let replaceResourceMsg = genReplaceResourceMsg(domain, name, owner, resources)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, replaceResourceMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genReplaceResourceMsg(_ domain: String, _ name: String?, _ owner: String, _ resources: Array<Starnamed_X_Starname_V1beta1_Resource>) -> [Google_Protobuf_Any] {
//        let replaceResourceMsg = Starnamed_X_Starname_V1beta1_MsgReplaceAccountResources.with {
//            if (name != nil) { $0.name = name! }
//            else { $0.name = "" }
//            $0.domain = domain
//            $0.owner = owner
//            $0.newResources = resources
//            $0.payer = ""
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/starnamed.x.starname.v1beta1.MsgReplaceAccountResources"
//            $0.value = try! replaceResourceMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    //for Osmosis custom msgs
//    //Tx for Osmosis Swap In
//    static func genSignedSwapInMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ swapRoutes: [Osmosis_Poolmanager_V1beta1_SwapAmountInRoute], _ inputDenom: String, _ inputAmount: String, _ outputAmount: String,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let SwapInMsg = genSwapInMsg(auth, swapRoutes, inputDenom, inputAmount, outputAmount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, SwapInMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateSwapInMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ swapRoutes: [Osmosis_Poolmanager_V1beta1_SwapAmountInRoute], _ inputDenom: String, _ inputAmount: String, _ outputAmount: String,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let SwapInMsg = genSwapInMsg(auth, swapRoutes, inputDenom, inputAmount, outputAmount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, SwapInMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSwapInMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ swapRoutes: [Osmosis_Poolmanager_V1beta1_SwapAmountInRoute],
//                             _ inputDenom: String, _ inputAmount: String, _ outputAmount: String) -> [Google_Protobuf_Any] {
//        let inputCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = inputDenom
//            $0.amount = inputAmount
//        }
//        let swapMsg = Osmosis_Gamm_V1beta1_MsgSwapExactAmountIn.with {
//            $0.sender = WUtils.onParseAuthGrpc(auth).0!
//            $0.routes = swapRoutes
//            $0.tokenIn = inputCoin
//            $0.tokenOutMinAmount = outputAmount
//            
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/osmosis.gamm.v1beta1.MsgSwapExactAmountIn"
//            $0.value = try! swapMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    //for IBC Transfer custom msgs
//    //Tx for Ibc Transfer
//    static func genIbcSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                           _ receiver: String, _ amount: Array<Coin>, _ path: MintscanPath, _ lastHeight: Ibc_Core_Client_V1_Height,
//                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let ibcTransferMsg = genIbcTransferMsg(auth, receiver, amount, path, lastHeight)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, ibcTransferMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulIbcSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                             _ receiver: String, _ amount: Array<Coin>, _ path: MintscanPath, _ lastHeight: Ibc_Core_Client_V1_Height,
//                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let ibcTransferMsg = genIbcTransferMsg(auth, receiver, amount, path, lastHeight)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, ibcTransferMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genIbcTransferMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ receiver: String, _ amount: Array<Coin>, _ path: MintscanPath, _ lastHeight: Ibc_Core_Client_V1_Height) -> [Google_Protobuf_Any] {
//        let re_timeout_height = Ibc_Core_Client_V1_Height.with {
//            $0.revisionNumber = lastHeight.revisionNumber
//            $0.revisionHeight = lastHeight.revisionHeight + 1000
//        }
//        let re_token = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount[0].denom
//            $0.amount = amount[0].amount
//        }
//        let ibcSendMsg = Ibc_Applications_Transfer_V1_MsgTransfer.with {
//            $0.sender = WUtils.onParseAuthGrpc(auth).0!
//            $0.receiver = receiver
//            $0.sourcePort = path.port!
//            $0.sourceChannel = path.channel!
//            $0.timeoutHeight = re_timeout_height
//            $0.timeoutTimestamp = 0
//            $0.token = re_token
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/ibc.applications.transfer.v1.MsgTransfer"
//            $0.value = try! ibcSendMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //for IRIS custom msgs
//    //Tx for Iris Issue Nft
//    static func genSignedIssueNftIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let irisIssueNft = genIrisIssueNft(signer, denom_id, denom_name, id, name, uri, data)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, irisIssueNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateIssueNftIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                              _ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String,
//                                              _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let irisIssueNft = genIrisIssueNft(signer, denom_id, denom_name, id, name, uri, data)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, irisIssueNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genIrisIssueNft(_ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String) -> [Google_Protobuf_Any] {
//        var anyMsgs = Array<Google_Protobuf_Any>()
//        let issueNftDenom = Irismod_Nft_MsgIssueDenom.with {
//            $0.id = denom_id
//            $0.name = denom_name
//            $0.schema = ""
//            $0.sender = signer
//            $0.symbol = ""
//            $0.mintRestricted = false
//            $0.updateRestricted = false
//        }
//        let issueNftDenomMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/irismod.nft.MsgIssueDenom"
//            $0.value = try! issueNftDenom.serializedData()
//        }
//        anyMsgs.append(issueNftDenomMsg)
//        let issueNft = Irismod_Nft_MsgMintNFT.with {
//            $0.sender = signer
//            $0.recipient = signer
//            $0.id = id
//            $0.denomID = denom_id
//            $0.name = name
//            $0.uri = uri
//            $0.data = data
//        }
//        let issueNftMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/irismod.nft.MsgMintNFT"
//            $0.value = try! issueNft.serializedData()
//        }
//        anyMsgs.append(issueNftMsg)
//        return anyMsgs
//    }
//    
//    //Tx for Iris Send Nft
//    static func genSignedSendNftIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ irisResponse: Irismod_Nft_QueryNFTResponse,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let irisSendNft = genIrisSendNft(signer, recipient, id, denom_id, irisResponse)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, irisSendNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateSendNftIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                             _ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ irisResponse: Irismod_Nft_QueryNFTResponse,
//                                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let irisSendNft = genIrisSendNft(signer, recipient, id, denom_id, irisResponse)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, irisSendNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genIrisSendNft(_ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ irisResponse: Irismod_Nft_QueryNFTResponse) -> [Google_Protobuf_Any] {
//        let issueNft = Irismod_Nft_MsgMintNFT.with {
//            $0.sender = signer
//            $0.recipient = recipient
//            $0.id = id
//            $0.denomID = denom_id
//            $0.name = irisResponse.nft.name
//            $0.uri = irisResponse.nft.uri
//            $0.data = irisResponse.nft.data
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/irismod.nft.MsgTransferNFT"
//            $0.value = try! issueNft.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Iris Issue Nft Denom
//    static func genSignedIssueNftDenomIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                 _ signer: String,_ denom_id: String, _ denom_name: String,
//                                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let irisIssueNftDenom = genIrisIssueNftDenom(signer, denom_id, denom_name)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, irisIssueNftDenom, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateIssueNftDenomIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                   _ signer: String,_ denom_id: String, _ denom_name: String,
//                                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let irisIssueNftDenom = genIrisIssueNftDenom(signer, denom_id, denom_name)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, irisIssueNftDenom, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genIrisIssueNftDenom(_ signer: String,_ denom_id: String, _ denom_name: String) -> [Google_Protobuf_Any] {
//        let issueNft = Irismod_Nft_MsgIssueDenom.with {
//            $0.id = denom_id
//            $0.name = denom_name
//            $0.schema = ""
//            $0.sender = signer
//            $0.symbol = ""
//            $0.mintRestricted = false
//            $0.updateRestricted = false
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/irismod.nft.MsgIssueDenom"
//            $0.value = try! issueNft.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //for CRO custom msgs
//    //Tx for Cro Issue Nft
//    static func genSignedIssueNftCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let croIssueNft = genCroIssueNft(signer, denom_id, denom_name, id, name, uri, data)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, croIssueNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateIssueNftCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                             _ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String,
//                                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let croIssueNft = genCroIssueNft(signer, denom_id, denom_name, id, name, uri, data)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, croIssueNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCroIssueNft(_ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String) -> [Google_Protobuf_Any] {
//        var anyMsgs = Array<Google_Protobuf_Any>()
//        let issueNftDenom = Chainmain_Nft_V1_MsgIssueDenom.with {
//            $0.id = denom_id
//            $0.name = denom_name
//            $0.schema = ""
//            $0.sender = signer
//        }
//        let issueNftDenomMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/chainmain.nft.v1.MsgIssueDenom"
//            $0.value = try! issueNftDenom.serializedData()
//        }
//        anyMsgs.append(issueNftDenomMsg)
//        let issueNft = Chainmain_Nft_V1_MsgMintNFT.with {
//            $0.sender = signer
//            $0.recipient = signer
//            $0.id = id
//            $0.denomID = denom_id
//            $0.name = name
//            $0.uri = uri
//            $0.data = data
//        }
//        let issueNftMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/chainmain.nft.v1.MsgMintNFT"
//            $0.value = try! issueNft.serializedData()
//        }
//        anyMsgs.append(issueNftMsg)
//        return anyMsgs
//    }
//    
//    //Tx for Cro Send Nft
//    static func genSignedSendNftCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ croResponse: Chainmain_Nft_V1_QueryNFTResponse,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let croSendNft = genCroSendNft(signer, recipient, id, denom_id, croResponse)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, croSendNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateSendNftCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ croResponse: Chainmain_Nft_V1_QueryNFTResponse,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let croSendNft = genCroSendNft(signer, recipient, id, denom_id, croResponse)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, croSendNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCroSendNft(_ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ croResponse: Chainmain_Nft_V1_QueryNFTResponse) -> [Google_Protobuf_Any] {
//        let issueNft = Chainmain_Nft_V1_MsgTransferNFT.with {
//            $0.sender = signer
//            $0.recipient = recipient
//            $0.id = id
//            $0.denomID = denom_id
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/chainmain.nft.v1.MsgTransferNFT"
//            $0.value = try! issueNft.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Cro Issue Nft Denom
//    static func genSignedIssueNftDenomCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                _ signer: String,_ denom_id: String, _ denom_name: String,
//                                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let croIssueNftDenom = genCroIssueNftDenom(signer, denom_id, denom_name)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, croIssueNftDenom, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateIssueNftDenomCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                  _ signer: String,_ denom_id: String, _ denom_name: String,
//                                                  _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let croIssueNftDenom = genCroIssueNftDenom(signer, denom_id, denom_name)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, croIssueNftDenom, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCroIssueNftDenom(_ signer: String,_ denom_id: String, _ denom_name: String) -> [Google_Protobuf_Any] {
//        let issueNft = Chainmain_Nft_V1_MsgIssueDenom.with {
//            $0.id = denom_id
//            $0.name = denom_name
//            $0.schema = ""
//            $0.sender = signer
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/chainmain.nft.v1.MsgIssueDenom"
//            $0.value = try! issueNft.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //for kava sign
//    //Tx for Kava CDP Create
//    static func genSignedKavaCDPCreate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                       _ sender: String, _ collateral: Coin, _ principal: Coin, _ collateral_type: String,
//                                       _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let createCdp = genKavaCDPCreate(sender, collateral, principal, collateral_type)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, createCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaCDPCreate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ sender: String, _ collateral: Coin, _ principal: Coin, _ collateral_type: String,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let createCdp = genKavaCDPCreate(sender, collateral, principal, collateral_type)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, createCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaCDPCreate(_ sender: String, _ collateral: Coin, _ principal: Coin, _ collateral_type: String) -> [Google_Protobuf_Any] {
//        let collateralCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = collateral.denom
//            $0.amount = collateral.amount
//        }
//        let principalCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = principal.denom
//            $0.amount = principal.amount
//        }
//        let createCdp = Kava_Cdp_V1beta1_MsgCreateCDP.with {
//            $0.sender = sender
//            $0.collateral = collateralCoin
//            $0.principal = principalCoin
//            $0.collateralType = collateral_type
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.cdp.v1beta1.MsgCreateCDP"
//            $0.value = try! createCdp.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava CDP Deposit
//    static func genSignedKavaCDPDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ owner: String, _ depositor: String, _ collateral: Coin, _ collateral_type: String,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let depositCdp = genKavaCDPDeposit(owner, depositor, collateral, collateral_type)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, depositCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaCDPDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ owner: String, _ depositor: String, _ collateral: Coin, _ collateral_type: String,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let depositCdp = genKavaCDPDeposit(owner, depositor, collateral, collateral_type)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, depositCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaCDPDeposit(_ owner: String, _ depositor: String, _ collateral: Coin, _ collateral_type: String) -> [Google_Protobuf_Any] {
//        let collateralCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = collateral.denom
//            $0.amount = collateral.amount
//        }
//        let depositCdp = Kava_Cdp_V1beta1_MsgDeposit.with {
//            $0.depositor = depositor
//            $0.owner = owner
//            $0.collateral = collateralCoin
//            $0.collateralType = collateral_type
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.cdp.v1beta1.MsgDeposit"
//            $0.value = try! depositCdp.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava CDP Withdraw
//    static func genSignedKavaCDPWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ owner: String, _ depositor: String, _ collateral: Coin, _ collateral_type: String,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let withdrawCdp = genKavaCDPWithdraw(owner, depositor, collateral, collateral_type)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, withdrawCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaCDPWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ owner: String, _ depositor: String, _ collateral: Coin, _ collateral_type: String,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let withdrawCdp = genKavaCDPWithdraw(owner, depositor, collateral, collateral_type)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, withdrawCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaCDPWithdraw(_ owner: String, _ depositor: String, _ collateral: Coin, _ collateral_type: String) -> [Google_Protobuf_Any] {
//        let collateralCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = collateral.denom
//            $0.amount = collateral.amount
//        }
//        let withdrawCdp = Kava_Cdp_V1beta1_MsgWithdraw.with {
//            $0.depositor = depositor
//            $0.owner = owner
//            $0.collateral = collateralCoin
//            $0.collateralType = collateral_type
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.cdp.v1beta1.MsgWithdraw"
//            $0.value = try! withdrawCdp.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava CDP Draw Debt
//    static func genSignedKavaCDPDrawDebt(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ sender: String, _ principal: Coin, _ collateral_type: String,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let drawdebtCdp = genKavaCDPDrawDebt(sender, principal, collateral_type)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, drawdebtCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaCDPDrawDebt(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ sender: String, _ principal: Coin, _ collateral_type: String,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let drawdebtCdp = genKavaCDPDrawDebt(sender, principal, collateral_type)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, drawdebtCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaCDPDrawDebt(_ sender: String, _ principal: Coin, _ collateral_type: String) -> [Google_Protobuf_Any] {
//        let principalCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = principal.denom
//            $0.amount = principal.amount
//        }
//        let drawdebtCdp = Kava_Cdp_V1beta1_MsgDrawDebt.with {
//            $0.sender = sender
//            $0.collateralType = collateral_type
//            $0.principal = principalCoin
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.cdp.v1beta1.MsgDrawDebt"
//            $0.value = try! drawdebtCdp.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava CDP Repay
//    static func genSignedKavaCDPRepay(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                      _ sender: String, _ payment: Coin, _ collateral_type: String,
//                                      _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let repayCdp = genKavaCDPRepay(sender, payment, collateral_type)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, repayCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaCDPRepay(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ sender: String, _ payment: Coin, _ collateral_type: String,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let repayCdp = genKavaCDPRepay(sender, payment, collateral_type)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, repayCdp, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaCDPRepay(_ sender: String, _ payment: Coin, _ collateral_type: String) -> [Google_Protobuf_Any] {
//        let paymentCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = payment.denom
//            $0.amount = payment.amount
//        }
//        let repayCdp = Kava_Cdp_V1beta1_MsgRepayDebt.with {
//            $0.sender = sender
//            $0.collateralType = collateral_type
//            $0.payment = paymentCoin
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.cdp.v1beta1.MsgRepayDebt"
//            $0.value = try! repayCdp.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava Hard Deposit
//    static func genSignedKavaHardDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ depositor: String, _ toDepositCoins: Array<Coin>,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let depositHard = genKavaHardDeposit(depositor, toDepositCoins)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, depositHard, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaHardDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ depositor: String, _ toDepositCoins: Array<Coin>,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let depositHard = genKavaHardDeposit(depositor, toDepositCoins)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, depositHard, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaHardDeposit(_ depositor: String, _ toDepositCoins: Array<Coin>) -> [Google_Protobuf_Any] {
//        let depositHard = Kava_Hard_V1beta1_MsgDeposit.with {
//            $0.depositor = depositor
//            var convertedCoins = Array<Cosmos_Base_V1beta1_Coin>()
//            toDepositCoins.forEach { coin in
//                convertedCoins.append(Cosmos_Base_V1beta1_Coin.with { $0.denom = coin.denom; $0.amount = coin.amount })
//            }
//            $0.amount = convertedCoins
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.hard.v1beta1.MsgDeposit"
//            $0.value = try! depositHard.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava Hard Withdraw
//    static func genSignedKavaHardWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ depositor: String, _ toWithdrawCoins: Array<Coin>,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let withdrawHard = genKavaHardWithdraw(depositor, toWithdrawCoins)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, withdrawHard, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaHardWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ depositor: String, _ toWithdrawCoins: Array<Coin>,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let withdrawHard = genKavaHardWithdraw(depositor, toWithdrawCoins)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, withdrawHard, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaHardWithdraw(_ depositor: String, _ toWithdrawCoins: Array<Coin>) -> [Google_Protobuf_Any] {
//        let withdrawHard = Kava_Hard_V1beta1_MsgWithdraw.with {
//            $0.depositor = depositor
//            var convertedCoins = Array<Cosmos_Base_V1beta1_Coin>()
//            toWithdrawCoins.forEach { coin in
//                convertedCoins.append(Cosmos_Base_V1beta1_Coin.with { $0.denom = coin.denom; $0.amount = coin.amount })
//            }
//            $0.amount = convertedCoins
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.hard.v1beta1.MsgWithdraw"
//            $0.value = try! withdrawHard.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava Hard Borrow
//    static func genSignedKavaHardBorrow(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ borrower: String, _ toBorrowCoins: Array<Coin>,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let borrowHard = genKavaHardBorrow(borrower, toBorrowCoins)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, borrowHard, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaHardBorrow(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ borrower: String, _ toBorrowCoins: Array<Coin>,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let borrowHard = genKavaHardBorrow(borrower, toBorrowCoins)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, borrowHard, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaHardBorrow(_ borrower: String, _ toBorrowCoins: Array<Coin>) -> [Google_Protobuf_Any] {
//        let borrowHard = Kava_Hard_V1beta1_MsgBorrow.with {
//            $0.borrower = borrower
//            var convertedCoins = Array<Cosmos_Base_V1beta1_Coin>()
//            toBorrowCoins.forEach { coin in
//                convertedCoins.append(Cosmos_Base_V1beta1_Coin.with { $0.denom = coin.denom; $0.amount = coin.amount })
//            }
//            $0.amount = convertedCoins
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.hard.v1beta1.MsgBorrow"
//            $0.value = try! borrowHard.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava Hard Repay
//    static func genSignedKavaHardRepay(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                       _ sender: String, _ owner: String, _ toRepayCoins: Array<Coin>,
//                                       _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let repayHard = genKavaHardRepay(sender, owner, toRepayCoins)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, repayHard, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaHardRepay(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ sender: String, _ owner: String, _ toRepayCoins: Array<Coin>,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let repayHard = genKavaHardRepay(sender, owner, toRepayCoins)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, repayHard, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaHardRepay(_ sender: String, _ owner: String, _ toRepayCoins: Array<Coin>) -> [Google_Protobuf_Any] {
//        let repayHard = Kava_Hard_V1beta1_MsgRepay.with {
//            $0.sender = sender
//            $0.owner = owner
//            var convertedCoins = Array<Cosmos_Base_V1beta1_Coin>()
//            toRepayCoins.forEach { coin in
//                convertedCoins.append(Cosmos_Base_V1beta1_Coin.with { $0.denom = coin.denom; $0.amount = coin.amount })
//            }
//            $0.amount = convertedCoins
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.hard.v1beta1.MsgRepay"
//            $0.value = try! repayHard.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava Swap Deposit
//    static func genSignedKavaSwapDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ depositor: String, _ token_a: Coin, _ token_b: Coin, _ slippage: String, _ deadline: Int64,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let swapDeposit = genKavaSwapDeposit(depositor, token_a, token_b, slippage, deadline)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, swapDeposit, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaSwapDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ depositor: String, _ token_a: Coin, _ token_b: Coin, _ slippage: String, _ deadline: Int64,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let swapDeposit = genKavaSwapDeposit(depositor, token_a, token_b, slippage, deadline)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, swapDeposit, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaSwapDeposit(_ depositor: String, _ token_a: Coin, _ token_b: Coin, _ slippage: String, _ deadline: Int64) -> [Google_Protobuf_Any] {
//        let swapDeposit = Kava_Swap_V1beta1_MsgDeposit.with {
//            $0.depositor = depositor
//            $0.tokenA = Cosmos_Base_V1beta1_Coin.with { $0.denom = token_a.denom; $0.amount = token_a.amount }
//            $0.tokenB = Cosmos_Base_V1beta1_Coin.with { $0.denom = token_b.denom; $0.amount = token_b.amount }
//            $0.slippage = slippage
//            $0.deadline = deadline
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.swap.v1beta1.MsgDeposit"
//            $0.value = try! swapDeposit.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava Swap Withdraw
//    static func genSignedKavaSwapWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ from: String, _ shares: String, _ min_token_a: Coin, _ min_token_b: Coin, _ deadline: Int64,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let swapWithdraw = genKavaSwapWithdraw(from, shares, min_token_a, min_token_b, deadline)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, swapWithdraw, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaSwapWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ from: String, _ shares: String, _ min_token_a: Coin, _ min_token_b: Coin, _ deadline: Int64,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let swapWithdraw = genKavaSwapWithdraw(from, shares, min_token_a, min_token_b, deadline)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, swapWithdraw, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaSwapWithdraw(_ from: String, _ shares: String, _ min_token_a: Coin, _ min_token_b: Coin, _ deadline: Int64) -> [Google_Protobuf_Any] {
//        let swapWithdraw = Kava_Swap_V1beta1_MsgWithdraw.with {
//            $0.from = from
//            $0.shares = shares
//            $0.minTokenA = Cosmos_Base_V1beta1_Coin.with { $0.denom = min_token_a.denom; $0.amount = min_token_a.amount }
//            $0.minTokenB = Cosmos_Base_V1beta1_Coin.with { $0.denom = min_token_b.denom; $0.amount = min_token_b.amount }
//            $0.deadline = deadline
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.swap.v1beta1.MsgWithdraw"
//            $0.value = try! swapWithdraw.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava Swap Exact For Tokens
//    static func genSignedKavaSwapExactForTokens(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                _ requester: String, _ swapIn: Coin, _ swapOut: Coin, _ slippage: String, _ deadline: Int64,
//                                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let swapExactForTokens = genKavaSwapExactForTokens(requester, swapIn, swapOut, slippage, deadline)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, swapExactForTokens, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaSwapExactForTokens(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                  _ requester: String, _ swapIn: Coin, _ swapOut: Coin, _ slippage: String, _ deadline: Int64,
//                                                  _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let swapExactForTokens = genKavaSwapExactForTokens(requester, swapIn, swapOut, slippage, deadline)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, swapExactForTokens, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaSwapExactForTokens(_ requester: String, _ swapIn: Coin, _ swapOut: Coin, _ slippage: String, _ deadline: Int64) -> [Google_Protobuf_Any] {
//        let swapExactForToken = Kava_Swap_V1beta1_MsgSwapExactForTokens.with {
//            $0.requester = requester
//            $0.exactTokenA = Cosmos_Base_V1beta1_Coin.with { $0.denom = swapIn.denom; $0.amount = swapIn.amount }
//            $0.tokenB = Cosmos_Base_V1beta1_Coin.with { $0.denom = swapOut.denom; $0.amount = swapOut.amount }
//            $0.slippage = slippage
//            $0.deadline = deadline
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.swap.v1beta1.MsgSwapExactForTokens"
//            $0.value = try! swapExactForToken.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Kava Incentive All
//    static func genSignedKavaIncentiveAll(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ sender: String, _ multiplier_name: String,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let kavaIncentive = genKavaIncentiveAll(sender, multiplier_name)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, kavaIncentive, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaIncentiveAll(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ sender: String, _ multiplier_name: String,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let kavaIncentive = genKavaIncentiveAll(sender, multiplier_name)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, kavaIncentive, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genKavaIncentiveAll(_ sender: String, _ multiplier_name: String) -> [Google_Protobuf_Any] {
//        var anyMsgs = Array<Google_Protobuf_Any>()
//        let incentiveRewards = BaseData.instance.mIncentiveRewards!
//        if (incentiveRewards.getMintingRewardAmount().compare(NSDecimalNumber.zero).rawValue > 0) {
//            anyMsgs.append(getKavaIncentiveUSDXMinting(sender, multiplier_name))
//        }
//        if (incentiveRewards.getHardRewardDenoms().count > 0) {
//            var denoms_to_claims = Array<Kava_Incentive_V1beta1_Selection>()
//            for denom in incentiveRewards.getHardRewardDenoms() {
//                denoms_to_claims.append(Kava_Incentive_V1beta1_Selection.with { $0.denom = denom; $0.multiplierName = multiplier_name })
//            }
//            anyMsgs.append(getKavaIncentiveHard(sender, denoms_to_claims))
//        }
//        if (incentiveRewards.getDelegatorRewardDenoms().count > 0) {
//            var denoms_to_claims = Array<Kava_Incentive_V1beta1_Selection>()
//            for denom in incentiveRewards.getDelegatorRewardDenoms() {
//                denoms_to_claims.append(Kava_Incentive_V1beta1_Selection.with { $0.denom = denom; $0.multiplierName = multiplier_name })
//            }
//            anyMsgs.append(getKavaIncentiveDelegator(sender, denoms_to_claims))
//        }
//        if (incentiveRewards.getSwapRewardDenoms().count > 0) {
//            var denoms_to_claims = Array<Kava_Incentive_V1beta1_Selection>()
//            for denom in incentiveRewards.getSwapRewardDenoms() {
//                denoms_to_claims.append(Kava_Incentive_V1beta1_Selection.with { $0.denom = denom; $0.multiplierName = multiplier_name })
//            }
//            anyMsgs.append(getKavaIncentiveSwap(sender, denoms_to_claims))
//        }
//        if (incentiveRewards.getEarnRewardDenoms().count > 0) {
//            var denoms_to_claims = Array<Kava_Incentive_V1beta1_Selection>()
//            for denom in incentiveRewards.getEarnRewardDenoms() {
//                denoms_to_claims.append(Kava_Incentive_V1beta1_Selection.with { $0.denom = denom; $0.multiplierName = multiplier_name })
//            }
//            anyMsgs.append(getKavaIncentiveEarn(sender, denoms_to_claims))
//        }
//        return anyMsgs
//    }
//    
//    static func getKavaIncentiveUSDXMinting(_ sender: String, _ multiplier_name: String) -> Google_Protobuf_Any {
//        let incentiveMint = Kava_Incentive_V1beta1_MsgClaimUSDXMintingReward.with {
//            $0.sender = sender
//            $0.multiplierName = multiplier_name
//        }
//        return Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.incentive.v1beta1.MsgClaimUSDXMintingReward"
//            $0.value = try! incentiveMint.serializedData()
//        }
//    }
//    
//    static func getKavaIncentiveHard(_ sender: String, _ denoms_to_claims: Array<Kava_Incentive_V1beta1_Selection>) -> Google_Protobuf_Any {
//        let incentiveHard = Kava_Incentive_V1beta1_MsgClaimHardReward.with {
//            $0.sender = sender
//            $0.denomsToClaim = denoms_to_claims
//        }
//        return Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.incentive.v1beta1.MsgClaimHardReward"
//            $0.value = try! incentiveHard.serializedData()
//        }
//    }
//    
//    static func getKavaIncentiveDelegator(_ sender: String, _ denoms_to_claims: Array<Kava_Incentive_V1beta1_Selection>) -> Google_Protobuf_Any {
//        let incentiveDelegator = Kava_Incentive_V1beta1_MsgClaimDelegatorReward.with {
//            $0.sender = sender
//            $0.denomsToClaim = denoms_to_claims
//        }
//        return Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.incentive.v1beta1.MsgClaimDelegatorReward"
//            $0.value = try! incentiveDelegator.serializedData()
//        }
//    }
//    
//    static func getKavaIncentiveSwap(_ sender: String, _ denoms_to_claims: Array<Kava_Incentive_V1beta1_Selection>) -> Google_Protobuf_Any {
//        let incentiveSwap = Kava_Incentive_V1beta1_MsgClaimSwapReward.with {
//            $0.sender = sender
//            $0.denomsToClaim = denoms_to_claims
//        }
//        return Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.incentive.v1beta1.MsgClaimSwapReward"
//            $0.value = try! incentiveSwap.serializedData()
//        }
//    }
//    
//    static func getKavaIncentiveEarn(_ sender: String, _ denoms_to_claims: Array<Kava_Incentive_V1beta1_Selection>) -> Google_Protobuf_Any {
//        let incentiveEarn = Kava_Incentive_V1beta1_MsgClaimEarnReward.with {
//            $0.sender = sender
//            $0.denomsToClaim = denoms_to_claims
//        }
//        return Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.incentive.v1beta1.MsgClaimEarnReward"
//            $0.value = try! incentiveEarn.serializedData()
//        }
//    }
//    
//    //Tx for Kava Earn Deposit
//    static func genSignedKavaEarnDelegateDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ depositor: String, _ validator: String, _ depositCoin: Coin,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let earnDelegateDepositMsg = getKavaEarnDelegateDeposit(depositor, validator, depositCoin)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, [earnDelegateDepositMsg], privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaEarnDelegateMintDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ depositor: String, _ validator: String, _ depositCoin: Coin,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let earnDelegateDepositMsg = getKavaEarnDelegateDeposit(depositor, validator, depositCoin)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, [earnDelegateDepositMsg], privateKey, publicKey, fee, memo)
//    }
//    
//    static func getKavaEarnDelegateDeposit(_ depositor: String, _ validator: String, _ depositCoin: Coin) -> Google_Protobuf_Any {
//        let earnDeposit = Kava_Router_V1beta1_MsgDelegateMintDeposit.with {
//            $0.depositor = depositor
//            $0.validator = validator
//            $0.amount = Cosmos_Base_V1beta1_Coin.with { $0.denom = depositCoin.denom; $0.amount = depositCoin.amount }
//        }
//        return Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.router.v1beta1.MsgDelegateMintDeposit"
//            $0.value = try! earnDeposit.serializedData()
//        }
//    }
//    
//    //Tx for Kava Earn Withdraw
//    static func genSignedKavaEarnWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ from: String, _ validator: String, _ depositCoin: Coin,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let earnWithdrawMsg = getKavaEarnWithdraw(from, validator, depositCoin)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, [earnWithdrawMsg], privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateKavaEarnWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ from: String, _ validator: String, _ depositCoin: Coin,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let earnWithdrawMsg = getKavaEarnWithdraw(from, validator, depositCoin)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, [earnWithdrawMsg], privateKey, publicKey, fee, memo)
//    }
//    
//    static func getKavaEarnWithdraw(_ from: String, _ validator: String, _ depositCoin: Coin) -> Google_Protobuf_Any {
//        let earnWithdraw = Kava_Router_V1beta1_MsgWithdrawBurn.with {
//            $0.from = from
//            $0.validator = validator
//            $0.amount = Cosmos_Base_V1beta1_Coin.with { $0.denom = depositCoin.denom; $0.amount = depositCoin.amount }
//        }
//        return Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.router.v1beta1.MsgWithdrawBurn"
//            $0.value = try! earnWithdraw.serializedData()
//        }
//    }
//    
//    //Tx for Kava Create HTLC Swap
//    static func genSignedKavaCreateHTLCSwap(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ from: String, _ to: String, _ sendCoin: Array<Coin>, _ timeStamp: Int64, _ randomNumberHash: String,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let createAtomicSwap = Kava_Bep3_V1beta1_MsgCreateAtomicSwap.with {
//            $0.from = from
//            $0.to = WUtils.getDuputyAdddress(sendCoin[0].denom).0
//            $0.senderOtherChain = WUtils.getDuputyAdddress(sendCoin[0].denom).1
//            $0.recipientOtherChain = to
//            $0.randomNumberHash = randomNumberHash
//            $0.timestamp = timeStamp
//            $0.amount = [Cosmos_Base_V1beta1_Coin.with { $0.denom = sendCoin[0].denom; $0.amount = sendCoin[0].amount }]
//            $0.heightSpan = 24686
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.bep3.v1beta1.MsgCreateAtomicSwap"
//            $0.value = try! createAtomicSwap.serializedData()
//        }
//        return getGrpcSignedTx(auth, pubkeyType, chainType, [anyMsg], privateKey, publicKey, fee, memo)
//    }
//    
//    //Tx for Kava Claim HTLC Swap
//    static func genSignedKavaClaimHTLCSwap(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ from: String, _ swapID: String, _ randomNumber: String,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainId: String) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let claimAtomicSwap = Kava_Bep3_V1beta1_MsgClaimAtomicSwap.with {
//            $0.from = from
//            $0.swapID = swapID
//            $0.randomNumber = randomNumber
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/kava.bep3.v1beta1.MsgClaimAtomicSwap"
//            $0.value = try! claimAtomicSwap.serializedData()
//        }
//        return getGrpcSignedTx2(auth, pubkeyType, chainId, [anyMsg], privateKey, publicKey, fee, memo)
//        
//    }
//    
//    //for WASM custom msg
//    //Tx for CW20 Transfer
//    static func genWasmSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                            _ toAddress: String, _ contractAddress: String, _ amount: Array<Coin>,
//                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let cw20Send = genCw20Send(auth, toAddress, contractAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, cw20Send, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulWasmSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                              _ toAddress: String, _ contractAddress: String, _ amount: Array<Coin>,
//                              _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let cw20Send = genCw20Send(auth, toAddress, contractAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, cw20Send, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCw20Send(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ toAddress: String, _ contractAddress: String, _ amount: Array<Coin>) -> [Google_Protobuf_Any] {
//        let exeContract = Cosmwasm_Wasm_V1_MsgExecuteContract.with {
//            $0.sender = WUtils.onParseAuthGrpc(auth).0!
//            $0.contract = contractAddress
//            $0.msg  = Cw20TransferReq.init(toAddress, amount[0].amount).getEncode()
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmwasm.wasm.v1.MsgExecuteContract"
//            $0.value = try! exeContract.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for CW20 IBC Transfer
//    static func genWasmIbcSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                               _ toAddress: String, _ cw20ContractAddress: String, _ amount: Array<Coin>, _ path: MintscanPath,
//                               _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let jsonMsg : JSON = ["channel" : path.channel!, "remote_address" : toAddress, "timeout" : 900]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: .sortedKeys).base64EncodedString()
//        let innerMsg = Cw20IbcTransferReq.init(path.getIBCContract(), amount[0].amount, jsonMsgBase64).getEncode()
//        let cw20IbcSend = genCw20IbcSend(auth, cw20ContractAddress, innerMsg)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, cw20IbcSend, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulWasmIbcSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                 _ toAddress: String, _ cw20ContractAddress: String, _ amount: Array<Coin>, _ path: MintscanPath,
//                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let jsonMsg : JSON = ["channel" : path.channel!, "remote_address" : toAddress, "timeout" : 900]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: .sortedKeys).base64EncodedString()
//        let innerMsg = Cw20IbcTransferReq.init(path.getIBCContract(), amount[0].amount, jsonMsgBase64).getEncode()
//        let cw20IbcSend = genCw20IbcSend(auth, cw20ContractAddress, innerMsg)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, cw20IbcSend, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCw20IbcSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ cw20ContractAddress: String, _ innerMsg: Data) -> [Google_Protobuf_Any] {
//        let exeContract = Cosmwasm_Wasm_V1_MsgExecuteContract.with {
//            $0.sender = WUtils.onParseAuthGrpc(auth).0!
//            $0.contract = cw20ContractAddress
//            $0.msg  = innerMsg
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmwasm.wasm.v1.MsgExecuteContract"
//            $0.value = try! exeContract.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //AUTHz
//    //Tx for Authz Claim Rewards
//    static func genAuthzClaimReward(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ grantee: String, _ granter: String, _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzClaimRewards = genAuthzClaimStakingRewardMsg(grantee, granter, rewards)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzClaimRewards, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzClaimReward(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ grantee: String, _ granter: String, _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzClaimRewards = genAuthzClaimStakingRewardMsg(grantee, granter, rewards)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzClaimRewards, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzClaimStakingRewardMsg(_ grantee: String, _ granter: String, _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>) -> [Google_Protobuf_Any] {
//        var innerMsgs = Array<Google_Protobuf_Any>()
//        rewards.forEach { reward in
//            let claimMsg = Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.with {
//                $0.delegatorAddress = granter
//                $0.validatorAddress = reward.validatorAddress
//            }
//            let innerMsg = Google_Protobuf_Any.with {
//                $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
//                $0.value = try! claimMsg.serializedData()
//            }
//            innerMsgs.append(innerMsg)
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = innerMsgs
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz Claim Commission
//    static func genAuthzClaimCommission(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ grantee: String, _ granter: String, _ validatorAddress: String,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzClaimCommission = genAuthzClaimCommissionMsg(grantee, granter, validatorAddress)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzClaimCommission, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzClaimCommission(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                _ grantee: String, _ granter: String, _ validatorAddress: String,
//                                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzClaimCommission = genAuthzClaimCommissionMsg(grantee, granter, validatorAddress)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzClaimCommission, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzClaimCommissionMsg(_ grantee: String, _ granter: String, _ validatorAddress: String) -> [Google_Protobuf_Any] {
//        let claimCommissionMsg = Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission.with {
//            $0.validatorAddress = validatorAddress
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission"
//            $0.value = try! claimCommissionMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz Vote
//    static func genAuthzVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                             _ grantee: String, _ granter: String, _ proposals: Array<MintscanProposalDetail>,
//                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzVote = genAuthzVoteMsg(grantee, granter, proposals)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzVote, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                     _ grantee: String, _ granter: String, _ proposals: Array<MintscanProposalDetail>,
//                                     _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzVote = genAuthzVoteMsg(grantee, granter, proposals)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzVote, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzVoteMsg(_ grantee: String, _ granter: String, _ proposals: Array<MintscanProposalDetail>) -> [Google_Protobuf_Any] {
//        var innerMsgs = Array<Google_Protobuf_Any>()
//        proposals.forEach { proposal in
//            let voteMsg = Cosmos_Gov_V1beta1_MsgVote.with {
//                $0.voter = granter
//                $0.proposalID = UInt64(proposal.id!)!
//                if (proposal.getMyVote() == "Yes") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.yes
//                } else if (proposal.getMyVote() == "No") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.no
//                } else if (proposal.getMyVote() == "NoWithVeto") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.noWithVeto
//                } else if (proposal.getMyVote() == "Abstain") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.abstain
//                }
//            }
//            let innerMsg = Google_Protobuf_Any.with {
//                $0.typeURL = "/cosmos.gov.v1beta1.MsgVote"
//                $0.value = try! voteMsg.serializedData()
//            }
//            innerMsgs.append(innerMsg)
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = innerMsgs
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz Delegate
//    static func genAuthzDelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                 _ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin,
//                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzDelegate = genAuthzDelegateMsg(grantee, granter, toValAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzDelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzDelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzDelegate = genAuthzDelegateMsg(grantee, granter, toValAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzDelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzDelegateMsg(_ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin) -> [Google_Protobuf_Any] {
//        let toCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount.denom
//            $0.amount = amount.amount
//        }
//        let delegateMsg = Cosmos_Staking_V1beta1_MsgDelegate.with {
//            $0.delegatorAddress = granter
//            $0.validatorAddress = toValAddress
//            $0.amount = toCoin
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.staking.v1beta1.MsgDelegate"
//            $0.value = try! delegateMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz UnDelegate
//    static func genAuthzUndelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                   _ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin,
//                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzUndelegate = genAuthzUndelegateMsg(grantee, granter, toValAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzUndelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzUndelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzUndelegate = genAuthzUndelegateMsg(grantee, granter, toValAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzUndelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzUndelegateMsg(_ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin) -> [Google_Protobuf_Any] {
//        let toCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount.denom
//            $0.amount = amount.amount
//        }
//        let delegateMsg = Cosmos_Staking_V1beta1_MsgUndelegate.with {
//            $0.delegatorAddress = granter
//            $0.validatorAddress = toValAddress
//            $0.amount = toCoin
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.staking.v1beta1.MsgUndelegate"
//            $0.value = try! delegateMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz ReDelegate
//    static func genAuthzRedelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                   _ grantee: String, _ granter: String, _ fromValAddress: String, _ toValAddress: String, _ amount: Coin,
//                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzRedelegate = genAuthzRedelegateMsg(grantee, granter, fromValAddress, toValAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzRedelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzRedelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ grantee: String, _ granter: String, _ fromValAddress: String, _ toValAddress: String, _ amount: Coin,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzRedelegate = genAuthzRedelegateMsg(grantee, granter, fromValAddress, toValAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzRedelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzRedelegateMsg(_ grantee: String, _ granter: String, _ fromValAddress: String, _ toValAddress: String, _ amount: Coin) -> [Google_Protobuf_Any] {
//        let toCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount.denom
//            $0.amount = amount.amount
//        }
//        let delegateMsg = Cosmos_Staking_V1beta1_MsgBeginRedelegate.with {
//            $0.delegatorAddress = granter
//            $0.validatorSrcAddress = fromValAddress
//            $0.validatorDstAddress = toValAddress
//            $0.amount = toCoin
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.staking.v1beta1.MsgBeginRedelegate"
//            $0.value = try! delegateMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz Send
//    static func genAuthzSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                             _ grantee: String, _ granter: String, _ toAddress: String, _ amount: Array<Coin>,
//                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzSend = genAuthzSendMsg(grantee, granter, toAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzSend, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                     _ grantee: String, _ granter: String, _ toAddress: String, _ amount: Array<Coin>,
//                                     _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzSend = genAuthzSendMsg(grantee, granter, toAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzSend, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzSendMsg(_ grantee: String, _ granter: String, _ toAddress: String, _ amount: Array<Coin>) -> [Google_Protobuf_Any] {
//        let sendCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount[0].denom
//            $0.amount = amount[0].amount
//        }
//        let sendMsg = Cosmos_Bank_V1beta1_MsgSend.with {
//            $0.fromAddress = granter
//            $0.toAddress = toAddress
//            $0.amount = [sendCoin]
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.bank.v1beta1.MsgSend"
//            $0.value = try! sendMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    //Tx for Liquidity Staking
//    static func genLiquidityStaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ creater: String, _ amount: String, _ hostDenom: String,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let staking = genLiquidityStaking(creater, amount, hostDenom)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, staking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateLiquidityStaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ creater: String, _ amount: String, _ hostDenom: String,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let staking = genLiquidityStaking(creater, amount, hostDenom)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, staking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genLiquidityStaking(_ creater: String, _ amount: String, _ hostDenom: String) -> [Google_Protobuf_Any] {
//        let staking = Stride_Stakeibc_MsgLiquidStake.with {
//            $0.creator = creater
//            $0.amount = amount
//            $0.hostDenom = hostDenom
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/stride.stakeibc.MsgLiquidStake"
//            $0.value = try! staking.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Liquidity Unstaking
//    static func genLiquidityUnstaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                      _ creater: String, _ amount: String, _ hostZone: String, _ receiver: String,
//                                      _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let unstaking = genLiquidityUnstaking(creater, amount, hostZone, receiver)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, unstaking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateLiquidityUnstaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                              _ creater: String, _ amount: String, _ hostZone: String, _ receiver: String,
//                                              _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let unstaking = genLiquidityUnstaking(creater, amount, hostZone, receiver)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, unstaking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genLiquidityUnstaking(_ creater: String, _ amount: String, _ hostZone: String, _ receiver: String) -> [Google_Protobuf_Any] {
//        let unStaking = Stride_Stakeibc_MsgRedeemStake.with {
//            $0.creator = creater
//            $0.amount = amount
//            $0.hostZone = hostZone
//            $0.receiver = receiver
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/stride.stakeibc.MsgRedeemStake"
//            $0.value = try! unStaking.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for persistence Liquidity Staking
//    static func genPersisLiquidityStaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ delegator_address: String, _ coin: Coin,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let staking = genPersisLiquidityStaking(delegator_address, coin)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, staking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulatePersisLiquidityStaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ delegator_address: String, _ coin: Coin,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let staking = genPersisLiquidityStaking(delegator_address, coin)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, staking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genPersisLiquidityStaking(_ delegator_address: String, _ coin: Coin) -> [Google_Protobuf_Any] {
//        let amount = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = coin.denom
//            $0.amount = coin.amount
//        }
//        let staking = Pstake_Lscosmos_V1beta1_MsgLiquidStake.with {
//            $0.delegatorAddress = delegator_address
//            $0.amount = amount
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/pstake.lscosmos.v1beta1.MsgLiquidStake"
//            $0.value = try! staking.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    static func genPersisLiquidityRedeem(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ delegator_address: String, _ coin: Coin,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let redeem = genPersisLiquidityRedeem(delegator_address, coin)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, redeem, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulatePersisLiquidityRedeem(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ delegator_address: String, _ coin: Coin,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let redeem = genPersisLiquidityRedeem(delegator_address, coin)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, redeem, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genPersisLiquidityRedeem(_ delegator_address: String, _ coin: Coin) -> [Google_Protobuf_Any] {
//        let amount = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = coin.denom
//            $0.amount = coin.amount
//        }
//        let reedem = Pstake_Lscosmos_V1beta1_MsgRedeem.with {
//            $0.delegatorAddress = delegator_address
//            $0.amount = amount
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/pstake.lscosmos.v1beta1.MsgRedeem"
//            $0.value = try! reedem.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    //Tx for Neutron
//    static func genNeutronVaultDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ contractAddress: String, _ amount: Array<Coin>,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let depositCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount[0].denom
//            $0.amount = amount[0].amount
//        }
//        let jsonMsg: JSON = ["bond" : JSON()]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!, [depositCoin])
//        return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulNeutronVaultDeposit(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ contractAddress: String, _ amount: Array<Coin>,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let depositCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount[0].denom
//            $0.amount = amount[0].amount
//        }
//        let jsonMsg: JSON = ["bond" : JSON()]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!, [depositCoin])
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    
//    static func genNeutronVaultWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ contractAddress: String, _ amount: Array<Coin>,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let jsonMsg: JSON = ["unbond" : ["amount" : amount[0].amount]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulNeutronVaultWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ contractAddress: String, _ amount: Array<Coin>,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let jsonMsg: JSON = ["unbond" : ["amount" : amount[0].amount]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    
//    static func genNeutronSingleVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ contractAddress: String,_ proposalId: Int64, _ opinion: String,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let jsonMsg: JSON = ["vote" : ["proposal_id" : proposalId, "vote" : opinion]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulNeutronSingleVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                      _ contractAddress: String,_ proposalId: Int64, _ opinion: String,
//                                      _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let jsonMsg: JSON = ["vote" : ["proposal_id" : proposalId, "vote" : opinion]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    
//    static func genNeutronMultiVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                   _ contractAddress: String,_ proposalId: Int64, _ opinion: Int,
//                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let jsonMsg: JSON = ["vote" : ["proposal_id" : proposalId, "vote" : ["option_id" : proposalId]]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulNeutronMultiVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                     _ contractAddress: String,_ proposalId: Int64, _ opinion: Int,
//                                     _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let jsonMsg: JSON = ["vote" : ["proposal_id" : proposalId, "vote" : ["option_id" : proposalId]]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    
//    static func genNeutronSwap(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                               _ neutronSwapPool: NeutronSwapPool, _ neutronInputPair: NeutronSwapPoolPair, _ neutronOutputPair: NeutronSwapPoolPair, _ inputAmount: String, _ beliefPrice: String,
//                               _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        if (neutronInputPair.type == "cw20") {
//            let innerMsg: JSON = ["swap" : ["belief_price" : beliefPrice]]
//            let innerMsgBase64 = try! innerMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let jsonMsg: JSON = ["send" : ["amount" : inputAmount, "contract" : neutronSwapPool.contract_address!, "msg" : innerMsgBase64]]
//            let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let contractMsg = genWasmMsg(auth, neutronInputPair.address!, Data(base64Encoded: jsonMsgBase64)!)
//            return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//            
//        } else {
//            let offer_asset: JSON = ["info" : WUtils.swapAssetInfo(neutronInputPair), "amount" : inputAmount]
//            let jsonMsg: JSON = ["swap" : ["offer_asset" : offer_asset, "belief_price" : beliefPrice]]
//            let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let fundCoin = Cosmos_Base_V1beta1_Coin.with {
//                $0.denom = neutronInputPair.denom!
//                $0.amount = inputAmount
//            }
//            let contractMsg = genWasmMsg(auth, neutronSwapPool.contract_address!, Data(base64Encoded: jsonMsgBase64)!, [fundCoin])
//            return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//        }
//    }
//    
//    static func simulNeutronSwap(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                 _ neutronSwapPool: NeutronSwapPool, _ neutronInputPair: NeutronSwapPoolPair, _ neutronOutputPair: NeutronSwapPoolPair, _ inputAmount: String, _ beliefPrice: String,
//                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        if (neutronInputPair.type == "cw20") {
//            let innerMsg: JSON = ["swap" : ["belief_price" : beliefPrice]]
//            let innerMsgBase64 = try! innerMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let jsonMsg: JSON = ["send" : ["amount" : inputAmount, "contract" : neutronSwapPool.contract_address!, "msg" : innerMsgBase64]]
//            let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let contractMsg = genWasmMsg(auth, neutronInputPair.address!, Data(base64Encoded: jsonMsgBase64)!)
//            return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//            
//        } else {
//            let offer_asset: JSON = ["info" : WUtils.swapAssetInfo(neutronInputPair), "amount" : inputAmount]
//            let jsonMsg: JSON = ["swap" : ["offer_asset" : offer_asset, "belief_price" : beliefPrice]]
//            let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let fundCoin = Cosmos_Base_V1beta1_Coin.with {
//                $0.denom = neutronInputPair.denom!
//                $0.amount = inputAmount
//            }
//            let contractMsg = genWasmMsg(auth, neutronSwapPool.contract_address!, Data(base64Encoded: jsonMsgBase64)!, [fundCoin])
//            return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//        }
//    }
//    
//    
//    
//    
//    static func genWasmMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ contractAddress: String, _ innerMsg: Data? = nil, _ innerFunds: [Cosmos_Base_V1beta1_Coin]? = nil) -> [Google_Protobuf_Any] {
//        let exeContract = Cosmwasm_Wasm_V1_MsgExecuteContract.with {
//            $0.sender = WUtils.onParseAuthGrpc(auth).0!
//            $0.contract = contractAddress
//            if let innerMsg = innerMsg {
//                $0.msg  = innerMsg
//            }
//            if let innerFunds = innerFunds {
//                $0.funds = innerFunds
//            }
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmwasm.wasm.v1.MsgExecuteContract"
//            $0.value = try! exeContract.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    
//    
//    static func getGrpcSignedTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ chainType: ChainType, _ msgAnys: Array<Google_Protobuf_Any>, _ privateKey: Data, _ publicKey: Data, _ fee: Fee, _ memo: String) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let txBody = getGrpcTxBody(msgAnys, memo)
//        let signerInfo = getGrpcSignerInfos(auth, pubkeyType, publicKey, chainType)
//        let authInfo = getGrpcAuthInfo(signerInfo, fee)
//        let rawTx = getGrpcRawTxs(auth, pubkeyType, txBody, authInfo, privateKey, chainType)
//        return Cosmos_Tx_V1beta1_BroadcastTxRequest.with {
//            $0.mode = Cosmos_Tx_V1beta1_BroadcastMode.async
//            $0.txBytes = try! rawTx.serializedData()
//        }
//    }
//    
//    static func getGrpcSignedTx2(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ chainId: String, _ msgAnys: Array<Google_Protobuf_Any>, _ privateKey: Data, _ publicKey: Data, _ fee: Fee, _ memo: String) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let txBody = getGrpcTxBody(msgAnys, memo)
//        let signerInfo = getGrpcSignerInfos(auth, pubkeyType, publicKey, nil)
//        let authInfo = getGrpcAuthInfo(signerInfo, fee)
//        let rawTx = getGrpcRawTxs2(auth, pubkeyType, txBody, authInfo, privateKey, chainId)
//        return Cosmos_Tx_V1beta1_BroadcastTxRequest.with {
//            $0.mode = Cosmos_Tx_V1beta1_BroadcastMode.async
//            $0.txBytes = try! rawTx.serializedData()
//        }
//    }
    
    static func getSignedTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ msgAnys: [Google_Protobuf_Any],
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let txBody = getTxBody(msgAnys, memo)
        let signerInfo = getSignerInfos(auth, baseChain)
        let authInfo = getAuthInfo(signerInfo, fee)
        let rawTx = getRawTxs(auth, txBody, authInfo, baseChain)
        return Cosmos_Tx_V1beta1_BroadcastTxRequest.with {
            $0.mode = Cosmos_Tx_V1beta1_BroadcastMode.async
            $0.txBytes = try! rawTx.serializedData()
        }
    }
    
    static func getSimulateTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ msgAnys: [Google_Protobuf_Any],
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let txBody = getTxBody(msgAnys, memo)
        let signerInfo = getSignerInfos(auth, baseChain)
        let authInfo = getAuthInfo(signerInfo, fee)
        let simulateTx = getSimulTxs(auth, txBody, authInfo, baseChain)
        return Cosmos_Tx_V1beta1_SimulateRequest.with {
            $0.tx = simulateTx
        }
    }
//
//    static func getGrpcSimulateTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ chainType: ChainType, _ msgAnys: Array<Google_Protobuf_Any>, _ privateKey: Data, _ publicKey: Data, _ fee: Fee, _ memo: String) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let txBody = getGrpcTxBody(msgAnys, memo)
//        let signerInfo = getGrpcSignerInfos(auth, pubkeyType, publicKey, chainType)
//        let authInfo = getGrpcAuthInfo(signerInfo, fee)
//        let simulateTx = getGrpcSimulTxs(auth, pubkeyType, txBody, authInfo, privateKey, chainType)
//        return Cosmos_Tx_V1beta1_SimulateRequest.with {
//            $0.tx = simulateTx
//        }
//    }
//    
    static func getTxBody(_ msgAnys: [Google_Protobuf_Any], _ memo: String) -> Cosmos_Tx_V1beta1_TxBody {
        return Cosmos_Tx_V1beta1_TxBody.with {
            $0.memo = memo
            $0.messages = msgAnys
        }
    }
    
    static func getSignerInfos(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SignerInfo {
        let single = Cosmos_Tx_V1beta1_ModeInfo.Single.with {
            $0.mode = Cosmos_Tx_Signing_V1beta1_SignMode.direct
        }
        let mode = Cosmos_Tx_V1beta1_ModeInfo.with {
            $0.single = single
        }

        var pubKey: Google_Protobuf_Any?
        if (baseChain.accountKeyType.pubkeyType == .INJECTIVE_Secp256k1) {
            let pub = Injective_Crypto_V1beta1_Ethsecp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/injective.crypto.v1beta1.ethsecp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
            
        } else if (baseChain.accountKeyType.pubkeyType == .ETH_Keccak256) {
            let pub = Ethermint_Crypto_V1_Ethsecp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/ethermint.crypto.v1.ethsecp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
        } else {
            let pub = Cosmos_Crypto_Secp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmos.crypto.secp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
        }
        
        return Cosmos_Tx_V1beta1_SignerInfo.with {
            $0.publicKey = pubKey!
            $0.modeInfo = mode
            $0.sequence = WUtils.onParseAuthGrpc(auth).2!
        }
    }
    
    static func getAuthInfo(_ signerInfo: Cosmos_Tx_V1beta1_SignerInfo, _ fee: Cosmos_Tx_V1beta1_Fee) -> Cosmos_Tx_V1beta1_AuthInfo {
        return Cosmos_Tx_V1beta1_AuthInfo.with {
            $0.fee = fee
            $0.signerInfos = [signerInfo]
        }
    }
    
    static func getRawTxs(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ txBody: Cosmos_Tx_V1beta1_TxBody,
                          _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_TxRaw {
        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.chainID = baseChain.chainId
            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
        }
        let sigbyte = getByteSingleSignatures(try! signDoc.serializedData(), baseChain)
        return Cosmos_Tx_V1beta1_TxRaw.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.signatures = [sigbyte]
        }
    }
    
    static func getSimulTxs(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ txBody: Cosmos_Tx_V1beta1_TxBody,
                            _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_Tx {
        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.chainID = baseChain.chainId
            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
        }
        let sigbyte = getByteSingleSignatures(try! signDoc.serializedData(), baseChain)
        return Cosmos_Tx_V1beta1_Tx.with {
            $0.authInfo = authInfo
            $0.body = txBody
            $0.signatures = [sigbyte]
        }
    }
    
    static func getByteSingleSignatures(_ toSignByte: Data, _ baseChain: BaseChain) -> Data {
        var hash: Data?
        if (baseChain.accountKeyType.pubkeyType == .INJECTIVE_Secp256k1 || 
            baseChain.accountKeyType.pubkeyType == .ETH_Keccak256) {
            hash = Crypto.sha3keccak256(data: toSignByte)
        } else {
            hash = toSignByte.sha256()
        }
        return try! ECDSA.compactsign(hash!, privateKey: baseChain.privateKey!)
    }
    
//
//    static func getGrpcAuthInfo(_ signerInfo: Cosmos_Tx_V1beta1_SignerInfo, _ fee: Fee) -> Cosmos_Tx_V1beta1_AuthInfo{
//        let feeCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = fee.amount[0].denom
//            $0.amount = fee.amount[0].amount
//        }
//        let txFee = Cosmos_Tx_V1beta1_Fee.with {
//            $0.amount = [feeCoin]
//            $0.gasLimit = UInt64(fee.gas)!
//        }
//        return Cosmos_Tx_V1beta1_AuthInfo.with {
//            $0.fee = txFee
//            $0.signerInfos = [signerInfo]
//        }
//    }
//    
//    
//    static func getGrpcRawTxs(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ txBody: Cosmos_Tx_V1beta1_TxBody, _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ privateKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_TxRaw {
//        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.chainID = BaseData.instance.getChainId(chainType)
//            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
//        }
//        let sigbyte = getGrpcByteSingleSignatures(pubkeyType, privateKey, try! signDoc.serializedData(), chainType)
//        return Cosmos_Tx_V1beta1_TxRaw.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.signatures = [sigbyte]
//        }
//    }
//    
//    static func getGrpcRawTxs2(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ txBody: Cosmos_Tx_V1beta1_TxBody, _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ privateKey: Data, _ chainId: String) -> Cosmos_Tx_V1beta1_TxRaw {
//        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.chainID = chainId
//            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
//        }
//        let sigbyte = getGrpcByteSingleSignatures(pubkeyType, privateKey, try! signDoc.serializedData(), nil)
//        return Cosmos_Tx_V1beta1_TxRaw.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.signatures = [sigbyte]
//        }
//    }
//    
//    static func getGrpcSimulTxs(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ txBody: Cosmos_Tx_V1beta1_TxBody, _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ privateKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_Tx {
//        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.chainID = BaseData.instance.getChainId(chainType)
//            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
//        }
//        let sigbyte = getGrpcByteSingleSignatures(pubkeyType, privateKey, try! signDoc.serializedData(), chainType)
//        return Cosmos_Tx_V1beta1_Tx.with {
//            $0.authInfo = authInfo
//            $0.body = txBody
//            $0.signatures = [sigbyte]
//        }
//    }
//    
//    static func getGrpcByteSingleSignatures(_ pubkeyType: Int64, _ privateKey: Data, _ toSignByte: Data, _ chainType: ChainType?) -> Data {
//        var hash: Data?
//        if (chainType == .INJECTIVE_MAIN || chainType == .EVMOS_MAIN || chainType == .CANTO_MAIN) {
//            hash = HDWalletKit.Crypto.sha3keccak256(data: toSignByte)
//        } else if (chainType == .XPLA_MAIN && pubkeyType == 1) {
//            hash = HDWalletKit.Crypto.sha3keccak256(data: toSignByte)
//        } else {
//            hash = toSignByte.sha256()
//        }
//        let signedData = try! ECDSA.compactsign(hash!, privateKey: privateKey)
//        return signedData
//    }
}


extension ECDSA {
    public static func compactsign(_ data: Data, privateKey: Data) throws -> Data {
        let ctx = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN))!
        defer { secp256k1_context_destroy(ctx) }
        let signature = UnsafeMutablePointer<secp256k1_ecdsa_signature>.allocate(capacity: 1)
        defer { signature.deallocate() }
        let status = data.withUnsafeBytes { (ptr: UnsafePointer<UInt8>) in
            privateKey.withUnsafeBytes { secp256k1_ecdsa_sign(ctx, signature, ptr, $0, nil, nil) }
        }
        guard status == 1 else { throw HDWalletKitError.failedToSign }
        let normalizedsig = UnsafeMutablePointer<secp256k1_ecdsa_signature>.allocate(capacity: 1)
        defer { normalizedsig.deallocate() }
        secp256k1_ecdsa_signature_normalize(ctx, normalizedsig, signature)
        let length: size_t = 64
        var compact = Data(count: length)
        guard compact.withUnsafeMutableBytes({ return secp256k1_ecdsa_signature_serialize_compact(ctx, $0, normalizedsig) }) == 1 else { throw HDWalletKitError.noEnoughSpace }
        compact.count = length
        return compact
    }
}
