// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ixo/payments/tx.proto
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

/// MsgSetPaymentContractAuthorisation defines a message for authorising or deauthorising a payment contract.
struct Payments_MsgSetPaymentContractAuthorisation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var paymentContractID: String = String()

  var payerDid: String = String()

  var authorised: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgSetPaymentContractAuthorisationResponse defines the Msg/SetPaymentContractAuthorisation response type.
struct Payments_MsgSetPaymentContractAuthorisationResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreatePaymentTemplate defines a message for creating a payment template.
struct Payments_MsgCreatePaymentTemplate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var creatorDid: String = String()

  var paymentTemplate: Payments_PaymentTemplate {
    get {return _paymentTemplate ?? Payments_PaymentTemplate()}
    set {_paymentTemplate = newValue}
  }
  /// Returns true if `paymentTemplate` has been explicitly set.
  var hasPaymentTemplate: Bool {return self._paymentTemplate != nil}
  /// Clears the value of `paymentTemplate`. Subsequent reads from it will return its default value.
  mutating func clearPaymentTemplate() {self._paymentTemplate = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _paymentTemplate: Payments_PaymentTemplate? = nil
}

/// MsgCreatePaymentTemplateResponse defines the Msg/CreatePaymentTemplate response type.
struct Payments_MsgCreatePaymentTemplateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreatePaymentContract defines a message for creating a payment contract.
struct Payments_MsgCreatePaymentContract {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var creatorDid: String = String()

  var paymentTemplateID: String = String()

  var paymentContractID: String = String()

  var payer: String = String()

  var recipients: [Payments_DistributionShare] = []

  var canDeauthorise: Bool = false

  var discountID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreatePaymentContractResponse defines the Msg/CreatePaymentContract response type.
struct Payments_MsgCreatePaymentContractResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreateSubscription defines a message for creating a subscription.
struct Payments_MsgCreateSubscription {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var creatorDid: String = String()

  var subscriptionID: String = String()

  var paymentContractID: String = String()

  var maxPeriods: String = String()

  var period: Google_Protobuf2_Any {
    get {return _period ?? Google_Protobuf2_Any()}
    set {_period = newValue}
  }
  /// Returns true if `period` has been explicitly set.
  var hasPeriod: Bool {return self._period != nil}
  /// Clears the value of `period`. Subsequent reads from it will return its default value.
  mutating func clearPeriod() {self._period = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _period: Google_Protobuf2_Any? = nil
}

/// MsgCreateSubscriptionResponse defines the Msg/CreateSubscription response type.
struct Payments_MsgCreateSubscriptionResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgGrantDiscount defines a message for granting a discount to a payer on a specific payment contract.
struct Payments_MsgGrantDiscount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var senderDid: String = String()

  var paymentContractID: String = String()

  var discountID: String = String()

  var recipient: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgGrantDiscountResponse defines the Msg/GrantDiscount response type.
struct Payments_MsgGrantDiscountResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgRevokeDiscount defines a message for revoking a discount previously granted to a payer.
struct Payments_MsgRevokeDiscount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var senderDid: String = String()

  var paymentContractID: String = String()

  var holder: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgRevokeDiscountResponse defines the Msg/RevokeDiscount response type.
struct Payments_MsgRevokeDiscountResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgEffectPayment defines a message for putting a specific payment contract into effect.
struct Payments_MsgEffectPayment {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var senderDid: String = String()

  var paymentContractID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgEffectPaymentResponse defines the Msg/EffectPayment response type.
struct Payments_MsgEffectPaymentResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "payments"

extension Payments_MsgSetPaymentContractAuthorisation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSetPaymentContractAuthorisation"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "payment_contract_id"),
    2: .standard(proto: "payer_did"),
    3: .same(proto: "authorised"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.paymentContractID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.payerDid) }()
      case 3: try { try decoder.decodeSingularBoolField(value: &self.authorised) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.paymentContractID.isEmpty {
      try visitor.visitSingularStringField(value: self.paymentContractID, fieldNumber: 1)
    }
    if !self.payerDid.isEmpty {
      try visitor.visitSingularStringField(value: self.payerDid, fieldNumber: 2)
    }
    if self.authorised != false {
      try visitor.visitSingularBoolField(value: self.authorised, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgSetPaymentContractAuthorisation, rhs: Payments_MsgSetPaymentContractAuthorisation) -> Bool {
    if lhs.paymentContractID != rhs.paymentContractID {return false}
    if lhs.payerDid != rhs.payerDid {return false}
    if lhs.authorised != rhs.authorised {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgSetPaymentContractAuthorisationResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSetPaymentContractAuthorisationResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgSetPaymentContractAuthorisationResponse, rhs: Payments_MsgSetPaymentContractAuthorisationResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgCreatePaymentTemplate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePaymentTemplate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "creator_did"),
    2: .standard(proto: "payment_template"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.creatorDid) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._paymentTemplate) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.creatorDid.isEmpty {
      try visitor.visitSingularStringField(value: self.creatorDid, fieldNumber: 1)
    }
    if let v = self._paymentTemplate {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgCreatePaymentTemplate, rhs: Payments_MsgCreatePaymentTemplate) -> Bool {
    if lhs.creatorDid != rhs.creatorDid {return false}
    if lhs._paymentTemplate != rhs._paymentTemplate {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgCreatePaymentTemplateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePaymentTemplateResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgCreatePaymentTemplateResponse, rhs: Payments_MsgCreatePaymentTemplateResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgCreatePaymentContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePaymentContract"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "creator_did"),
    2: .standard(proto: "payment_template_id"),
    3: .standard(proto: "payment_contract_id"),
    4: .same(proto: "payer"),
    5: .same(proto: "recipients"),
    6: .standard(proto: "can_deauthorise"),
    7: .standard(proto: "discount_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.creatorDid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.paymentTemplateID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.paymentContractID) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.payer) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.recipients) }()
      case 6: try { try decoder.decodeSingularBoolField(value: &self.canDeauthorise) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.discountID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.creatorDid.isEmpty {
      try visitor.visitSingularStringField(value: self.creatorDid, fieldNumber: 1)
    }
    if !self.paymentTemplateID.isEmpty {
      try visitor.visitSingularStringField(value: self.paymentTemplateID, fieldNumber: 2)
    }
    if !self.paymentContractID.isEmpty {
      try visitor.visitSingularStringField(value: self.paymentContractID, fieldNumber: 3)
    }
    if !self.payer.isEmpty {
      try visitor.visitSingularStringField(value: self.payer, fieldNumber: 4)
    }
    if !self.recipients.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.recipients, fieldNumber: 5)
    }
    if self.canDeauthorise != false {
      try visitor.visitSingularBoolField(value: self.canDeauthorise, fieldNumber: 6)
    }
    if !self.discountID.isEmpty {
      try visitor.visitSingularStringField(value: self.discountID, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgCreatePaymentContract, rhs: Payments_MsgCreatePaymentContract) -> Bool {
    if lhs.creatorDid != rhs.creatorDid {return false}
    if lhs.paymentTemplateID != rhs.paymentTemplateID {return false}
    if lhs.paymentContractID != rhs.paymentContractID {return false}
    if lhs.payer != rhs.payer {return false}
    if lhs.recipients != rhs.recipients {return false}
    if lhs.canDeauthorise != rhs.canDeauthorise {return false}
    if lhs.discountID != rhs.discountID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgCreatePaymentContractResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePaymentContractResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgCreatePaymentContractResponse, rhs: Payments_MsgCreatePaymentContractResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgCreateSubscription: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateSubscription"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "creator_did"),
    2: .standard(proto: "subscription_id"),
    3: .standard(proto: "payment_contract_id"),
    4: .standard(proto: "max_periods"),
    5: .same(proto: "period"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.creatorDid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.subscriptionID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.paymentContractID) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.maxPeriods) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._period) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.creatorDid.isEmpty {
      try visitor.visitSingularStringField(value: self.creatorDid, fieldNumber: 1)
    }
    if !self.subscriptionID.isEmpty {
      try visitor.visitSingularStringField(value: self.subscriptionID, fieldNumber: 2)
    }
    if !self.paymentContractID.isEmpty {
      try visitor.visitSingularStringField(value: self.paymentContractID, fieldNumber: 3)
    }
    if !self.maxPeriods.isEmpty {
      try visitor.visitSingularStringField(value: self.maxPeriods, fieldNumber: 4)
    }
    if let v = self._period {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgCreateSubscription, rhs: Payments_MsgCreateSubscription) -> Bool {
    if lhs.creatorDid != rhs.creatorDid {return false}
    if lhs.subscriptionID != rhs.subscriptionID {return false}
    if lhs.paymentContractID != rhs.paymentContractID {return false}
    if lhs.maxPeriods != rhs.maxPeriods {return false}
    if lhs._period != rhs._period {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgCreateSubscriptionResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateSubscriptionResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgCreateSubscriptionResponse, rhs: Payments_MsgCreateSubscriptionResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgGrantDiscount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgGrantDiscount"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sender_did"),
    2: .standard(proto: "payment_contract_id"),
    3: .standard(proto: "discount_id"),
    4: .same(proto: "recipient"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.senderDid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.paymentContractID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.discountID) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.recipient) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.senderDid.isEmpty {
      try visitor.visitSingularStringField(value: self.senderDid, fieldNumber: 1)
    }
    if !self.paymentContractID.isEmpty {
      try visitor.visitSingularStringField(value: self.paymentContractID, fieldNumber: 2)
    }
    if !self.discountID.isEmpty {
      try visitor.visitSingularStringField(value: self.discountID, fieldNumber: 3)
    }
    if !self.recipient.isEmpty {
      try visitor.visitSingularStringField(value: self.recipient, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgGrantDiscount, rhs: Payments_MsgGrantDiscount) -> Bool {
    if lhs.senderDid != rhs.senderDid {return false}
    if lhs.paymentContractID != rhs.paymentContractID {return false}
    if lhs.discountID != rhs.discountID {return false}
    if lhs.recipient != rhs.recipient {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgGrantDiscountResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgGrantDiscountResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgGrantDiscountResponse, rhs: Payments_MsgGrantDiscountResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgRevokeDiscount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRevokeDiscount"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sender_did"),
    2: .standard(proto: "payment_contract_id"),
    3: .same(proto: "holder"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.senderDid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.paymentContractID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.holder) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.senderDid.isEmpty {
      try visitor.visitSingularStringField(value: self.senderDid, fieldNumber: 1)
    }
    if !self.paymentContractID.isEmpty {
      try visitor.visitSingularStringField(value: self.paymentContractID, fieldNumber: 2)
    }
    if !self.holder.isEmpty {
      try visitor.visitSingularStringField(value: self.holder, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgRevokeDiscount, rhs: Payments_MsgRevokeDiscount) -> Bool {
    if lhs.senderDid != rhs.senderDid {return false}
    if lhs.paymentContractID != rhs.paymentContractID {return false}
    if lhs.holder != rhs.holder {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgRevokeDiscountResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRevokeDiscountResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgRevokeDiscountResponse, rhs: Payments_MsgRevokeDiscountResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgEffectPayment: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgEffectPayment"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sender_did"),
    2: .standard(proto: "payment_contract_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.senderDid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.paymentContractID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.senderDid.isEmpty {
      try visitor.visitSingularStringField(value: self.senderDid, fieldNumber: 1)
    }
    if !self.paymentContractID.isEmpty {
      try visitor.visitSingularStringField(value: self.paymentContractID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgEffectPayment, rhs: Payments_MsgEffectPayment) -> Bool {
    if lhs.senderDid != rhs.senderDid {return false}
    if lhs.paymentContractID != rhs.paymentContractID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Payments_MsgEffectPaymentResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgEffectPaymentResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Payments_MsgEffectPaymentResponse, rhs: Payments_MsgEffectPaymentResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
