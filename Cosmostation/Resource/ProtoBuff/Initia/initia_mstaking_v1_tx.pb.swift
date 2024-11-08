// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: initia/mstaking/v1/tx.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// MsgCreateValidator defines a SDK message for creating a new validator.
struct Initia_Mstaking_V1_MsgCreateValidator {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var description_p: Initia_Mstaking_V1_Description {
    get {return _description_p ?? Initia_Mstaking_V1_Description()}
    set {_description_p = newValue}
  }
  /// Returns true if `description_p` has been explicitly set.
  var hasDescription_p: Bool {return self._description_p != nil}
  /// Clears the value of `description_p`. Subsequent reads from it will return its default value.
  mutating func clearDescription_p() {self._description_p = nil}

  var commission: Initia_Mstaking_V1_CommissionRates {
    get {return _commission ?? Initia_Mstaking_V1_CommissionRates()}
    set {_commission = newValue}
  }
  /// Returns true if `commission` has been explicitly set.
  var hasCommission: Bool {return self._commission != nil}
  /// Clears the value of `commission`. Subsequent reads from it will return its default value.
  mutating func clearCommission() {self._commission = nil}

  var validatorAddress: String = String()

  var pubkey: SwiftProtobuf.Google_Protobuf_Any {
    get {return _pubkey ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_pubkey = newValue}
  }
  /// Returns true if `pubkey` has been explicitly set.
  var hasPubkey: Bool {return self._pubkey != nil}
  /// Clears the value of `pubkey`. Subsequent reads from it will return its default value.
  mutating func clearPubkey() {self._pubkey = nil}

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _description_p: Initia_Mstaking_V1_Description? = nil
  fileprivate var _commission: Initia_Mstaking_V1_CommissionRates? = nil
  fileprivate var _pubkey: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// MsgCreateValidatorResponse defines the Msg/CreateValidator response type.
struct Initia_Mstaking_V1_MsgCreateValidatorResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgEditValidator defines a SDK message for editing an existing validator.
struct Initia_Mstaking_V1_MsgEditValidator {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var description_p: Initia_Mstaking_V1_Description {
    get {return _description_p ?? Initia_Mstaking_V1_Description()}
    set {_description_p = newValue}
  }
  /// Returns true if `description_p` has been explicitly set.
  var hasDescription_p: Bool {return self._description_p != nil}
  /// Clears the value of `description_p`. Subsequent reads from it will return its default value.
  mutating func clearDescription_p() {self._description_p = nil}

  var validatorAddress: String = String()

  /// We pass a reference to the new commission rate and min self delegation as
  /// it's not mandatory to update. If not updated, the deserialized rate will be
  /// zero with no way to distinguish if an update was intended.
  /// REF: #2373
  var commissionRate: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _description_p: Initia_Mstaking_V1_Description? = nil
}

/// MsgEditValidatorResponse defines the Msg/EditValidator response type.
struct Initia_Mstaking_V1_MsgEditValidatorResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgDelegate defines a SDK message for performing a delegation of coins
/// from a delegator to a validator.
struct Initia_Mstaking_V1_MsgDelegate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var delegatorAddress: String = String()

  var validatorAddress: String = String()

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgDelegateResponse defines the Msg/Delegate response type.
struct Initia_Mstaking_V1_MsgDelegateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgBeginRedelegate defines a SDK message for performing a redelegation
/// of coins from a delegator and source validator to a destination validator.
struct Initia_Mstaking_V1_MsgBeginRedelegate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var delegatorAddress: String = String()

  var validatorSrcAddress: String = String()

  var validatorDstAddress: String = String()

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgBeginRedelegateResponse defines the Msg/BeginRedelegate response type.
struct Initia_Mstaking_V1_MsgBeginRedelegateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var completionTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _completionTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_completionTime = newValue}
  }
  /// Returns true if `completionTime` has been explicitly set.
  var hasCompletionTime: Bool {return self._completionTime != nil}
  /// Clears the value of `completionTime`. Subsequent reads from it will return its default value.
  mutating func clearCompletionTime() {self._completionTime = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _completionTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// MsgUndelegate defines a SDK message for performing an undelegation from a
/// delegate and a validator.
struct Initia_Mstaking_V1_MsgUndelegate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var delegatorAddress: String = String()

  var validatorAddress: String = String()

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgUndelegateResponse defines the Msg/Undelegate response type.
struct Initia_Mstaking_V1_MsgUndelegateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var completionTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _completionTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_completionTime = newValue}
  }
  /// Returns true if `completionTime` has been explicitly set.
  var hasCompletionTime: Bool {return self._completionTime != nil}
  /// Clears the value of `completionTime`. Subsequent reads from it will return its default value.
  mutating func clearCompletionTime() {self._completionTime = nil}

  /// amount returns the amount of undelegated coins
  ///
  /// Since: cosmos-sdk 0.50
  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _completionTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// MsgCancelUnbondingDelegation defines the SDK message for performing a cancel unbonding delegation for delegator
struct Initia_Mstaking_V1_MsgCancelUnbondingDelegation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var delegatorAddress: String = String()

  var validatorAddress: String = String()

  /// amount is always less than or equal to unbonding delegation entry balance
  var amount: [Cosmos_Base_V1beta1_Coin] = []

  /// creation_height is the height which the unbonding took place.
  var creationHeight: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCancelUnbondingDelegationResponse
struct Initia_Mstaking_V1_MsgCancelUnbondingDelegationResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
struct Initia_Mstaking_V1_MsgUpdateParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  var authority: String = String()

  /// params defines the x/staking parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  var params: Initia_Mstaking_V1_Params {
    get {return _params ?? Initia_Mstaking_V1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Initia_Mstaking_V1_Params? = nil
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
struct Initia_Mstaking_V1_MsgUpdateParamsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Initia_Mstaking_V1_MsgCreateValidator: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgCreateValidatorResponse: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgEditValidator: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgEditValidatorResponse: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgDelegate: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgDelegateResponse: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgBeginRedelegate: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgBeginRedelegateResponse: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgUndelegate: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgUndelegateResponse: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgCancelUnbondingDelegation: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgCancelUnbondingDelegationResponse: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgUpdateParams: @unchecked Sendable {}
extension Initia_Mstaking_V1_MsgUpdateParamsResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "initia.mstaking.v1"

extension Initia_Mstaking_V1_MsgCreateValidator: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateValidator"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "description"),
    2: .same(proto: "commission"),
    3: .standard(proto: "validator_address"),
    4: .same(proto: "pubkey"),
    5: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._description_p) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._commission) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.validatorAddress) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._pubkey) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._description_p {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._commission {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 3)
    }
    try { if let v = self._pubkey {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgCreateValidator, rhs: Initia_Mstaking_V1_MsgCreateValidator) -> Bool {
    if lhs._description_p != rhs._description_p {return false}
    if lhs._commission != rhs._commission {return false}
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs._pubkey != rhs._pubkey {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgCreateValidatorResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateValidatorResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgCreateValidatorResponse, rhs: Initia_Mstaking_V1_MsgCreateValidatorResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgEditValidator: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgEditValidator"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "description"),
    2: .standard(proto: "validator_address"),
    3: .standard(proto: "commission_rate"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._description_p) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.validatorAddress) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.commissionRate) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._description_p {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 2)
    }
    if !self.commissionRate.isEmpty {
      try visitor.visitSingularStringField(value: self.commissionRate, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgEditValidator, rhs: Initia_Mstaking_V1_MsgEditValidator) -> Bool {
    if lhs._description_p != rhs._description_p {return false}
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs.commissionRate != rhs.commissionRate {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgEditValidatorResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgEditValidatorResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgEditValidatorResponse, rhs: Initia_Mstaking_V1_MsgEditValidatorResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgDelegate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgDelegate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "delegator_address"),
    2: .standard(proto: "validator_address"),
    3: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.delegatorAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.validatorAddress) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.delegatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.delegatorAddress, fieldNumber: 1)
    }
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 2)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgDelegate, rhs: Initia_Mstaking_V1_MsgDelegate) -> Bool {
    if lhs.delegatorAddress != rhs.delegatorAddress {return false}
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgDelegateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgDelegateResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgDelegateResponse, rhs: Initia_Mstaking_V1_MsgDelegateResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgBeginRedelegate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgBeginRedelegate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "delegator_address"),
    2: .standard(proto: "validator_src_address"),
    3: .standard(proto: "validator_dst_address"),
    4: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.delegatorAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.validatorSrcAddress) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.validatorDstAddress) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.delegatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.delegatorAddress, fieldNumber: 1)
    }
    if !self.validatorSrcAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorSrcAddress, fieldNumber: 2)
    }
    if !self.validatorDstAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorDstAddress, fieldNumber: 3)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgBeginRedelegate, rhs: Initia_Mstaking_V1_MsgBeginRedelegate) -> Bool {
    if lhs.delegatorAddress != rhs.delegatorAddress {return false}
    if lhs.validatorSrcAddress != rhs.validatorSrcAddress {return false}
    if lhs.validatorDstAddress != rhs.validatorDstAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgBeginRedelegateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgBeginRedelegateResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "completion_time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._completionTime) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._completionTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgBeginRedelegateResponse, rhs: Initia_Mstaking_V1_MsgBeginRedelegateResponse) -> Bool {
    if lhs._completionTime != rhs._completionTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgUndelegate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUndelegate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "delegator_address"),
    2: .standard(proto: "validator_address"),
    3: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.delegatorAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.validatorAddress) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.delegatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.delegatorAddress, fieldNumber: 1)
    }
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 2)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgUndelegate, rhs: Initia_Mstaking_V1_MsgUndelegate) -> Bool {
    if lhs.delegatorAddress != rhs.delegatorAddress {return false}
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgUndelegateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUndelegateResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "completion_time"),
    2: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._completionTime) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._completionTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgUndelegateResponse, rhs: Initia_Mstaking_V1_MsgUndelegateResponse) -> Bool {
    if lhs._completionTime != rhs._completionTime {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgCancelUnbondingDelegation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCancelUnbondingDelegation"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "delegator_address"),
    2: .standard(proto: "validator_address"),
    3: .same(proto: "amount"),
    4: .standard(proto: "creation_height"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.delegatorAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.validatorAddress) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      case 4: try { try decoder.decodeSingularInt64Field(value: &self.creationHeight) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.delegatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.delegatorAddress, fieldNumber: 1)
    }
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 2)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 3)
    }
    if self.creationHeight != 0 {
      try visitor.visitSingularInt64Field(value: self.creationHeight, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgCancelUnbondingDelegation, rhs: Initia_Mstaking_V1_MsgCancelUnbondingDelegation) -> Bool {
    if lhs.delegatorAddress != rhs.delegatorAddress {return false}
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.creationHeight != rhs.creationHeight {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgCancelUnbondingDelegationResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCancelUnbondingDelegationResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgCancelUnbondingDelegationResponse, rhs: Initia_Mstaking_V1_MsgCancelUnbondingDelegationResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgUpdateParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "authority"),
    2: .same(proto: "params"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.authority) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.authority.isEmpty {
      try visitor.visitSingularStringField(value: self.authority, fieldNumber: 1)
    }
    try { if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgUpdateParams, rhs: Initia_Mstaking_V1_MsgUpdateParams) -> Bool {
    if lhs.authority != rhs.authority {return false}
    if lhs._params != rhs._params {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Initia_Mstaking_V1_MsgUpdateParamsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateParamsResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Initia_Mstaking_V1_MsgUpdateParamsResponse, rhs: Initia_Mstaking_V1_MsgUpdateParamsResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
