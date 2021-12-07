// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: injective/peggy/v1/attestation.proto
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

/// ClaimType is the cosmos type of an event from the counterpart chain that can
/// be handled
enum Injective_Peggy_V1_ClaimType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case unknown // = 0
  case deposit // = 1
  case withdraw // = 2
  case erc20Deployed // = 3
  case valsetUpdated // = 4
  case UNRECOGNIZED(Int)

  init() {
    self = .unknown
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unknown
    case 1: self = .deposit
    case 2: self = .withdraw
    case 3: self = .erc20Deployed
    case 4: self = .valsetUpdated
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unknown: return 0
    case .deposit: return 1
    case .withdraw: return 2
    case .erc20Deployed: return 3
    case .valsetUpdated: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Injective_Peggy_V1_ClaimType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Injective_Peggy_V1_ClaimType] = [
    .unknown,
    .deposit,
    .withdraw,
    .erc20Deployed,
    .valsetUpdated,
  ]
}

#endif  // swift(>=4.2)

/// Attestation is an aggregate of `claims` that eventually becomes `observed` by
/// all orchestrators
/// EVENT_NONCE:
/// EventNonce a nonce provided by the peggy contract that is unique per event fired
/// These event nonces must be relayed in order. This is a correctness issue,
/// if relaying out of order transaction replay attacks become possible
/// OBSERVED:
/// Observed indicates that >67% of validators have attested to the event,
/// and that the event should be executed by the peggy state machine
///
/// The actual content of the claims is passed in with the transaction making the claim
/// and then passed through the call stack alongside the attestation while it is processed
/// the key in which the attestation is stored is keyed on the exact details of the claim
/// but there is no reason to store those exact details becuause the next message sender
/// will kindly provide you with them.
struct Injective_Peggy_V1_Attestation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var observed: Bool = false

  var votes: [String] = []

  var height: UInt64 = 0

  var claim: Google_Protobuf2_Any {
    get {return _claim ?? Google_Protobuf2_Any()}
    set {_claim = newValue}
  }
  /// Returns true if `claim` has been explicitly set.
  var hasClaim: Bool {return self._claim != nil}
  /// Clears the value of `claim`. Subsequent reads from it will return its default value.
  mutating func clearClaim() {self._claim = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _claim: Google_Protobuf2_Any? = nil
}

/// ERC20Token unique identifier for an Ethereum ERC20 token.
/// CONTRACT:
/// The contract address on ETH of the token, this could be a Cosmos
/// originated token, if so it will be the ERC20 address of the representation
/// (note: developers should look up the token symbol using the address on ETH to display for UI)
struct Injective_Peggy_V1_ERC20Token {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var contract: String = String()

  var amount: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "injective.peggy.v1"

extension Injective_Peggy_V1_ClaimType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "CLAIM_TYPE_UNKNOWN"),
    1: .same(proto: "CLAIM_TYPE_DEPOSIT"),
    2: .same(proto: "CLAIM_TYPE_WITHDRAW"),
    3: .same(proto: "CLAIM_TYPE_ERC20_DEPLOYED"),
    4: .same(proto: "CLAIM_TYPE_VALSET_UPDATED"),
  ]
}

extension Injective_Peggy_V1_Attestation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Attestation"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "observed"),
    2: .same(proto: "votes"),
    3: .same(proto: "height"),
    4: .same(proto: "claim"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.observed) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.votes) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.height) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._claim) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.observed != false {
      try visitor.visitSingularBoolField(value: self.observed, fieldNumber: 1)
    }
    if !self.votes.isEmpty {
      try visitor.visitRepeatedStringField(value: self.votes, fieldNumber: 2)
    }
    if self.height != 0 {
      try visitor.visitSingularUInt64Field(value: self.height, fieldNumber: 3)
    }
    if let v = self._claim {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Peggy_V1_Attestation, rhs: Injective_Peggy_V1_Attestation) -> Bool {
    if lhs.observed != rhs.observed {return false}
    if lhs.votes != rhs.votes {return false}
    if lhs.height != rhs.height {return false}
    if lhs._claim != rhs._claim {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Peggy_V1_ERC20Token: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ERC20Token"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "contract"),
    2: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.contract) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.contract.isEmpty {
      try visitor.visitSingularStringField(value: self.contract, fieldNumber: 1)
    }
    if !self.amount.isEmpty {
      try visitor.visitSingularStringField(value: self.amount, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Peggy_V1_ERC20Token, rhs: Injective_Peggy_V1_ERC20Token) -> Bool {
    if lhs.contract != rhs.contract {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
