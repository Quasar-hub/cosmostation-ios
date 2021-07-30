// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: sifnode/dispensation/v1/types.proto
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

/// Distribution type enum
enum Sifnode_Dispensation_V1_DistributionType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// Unspecified distribution type
  case unspecified // = 0

  /// Airdrop distribution type
  case airdrop // = 1

  /// Validator Subsidy distribution type
  case validatorSubsidy // = 2

  /// Liquidity mining distribution type
  case liquidityMining // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .airdrop
    case 2: self = .validatorSubsidy
    case 3: self = .liquidityMining
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .airdrop: return 1
    case .validatorSubsidy: return 2
    case .liquidityMining: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Sifnode_Dispensation_V1_DistributionType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Sifnode_Dispensation_V1_DistributionType] = [
    .unspecified,
    .airdrop,
    .validatorSubsidy,
    .liquidityMining,
  ]
}

#endif  // swift(>=4.2)

/// Claim status enum
enum Sifnode_Dispensation_V1_DistributionStatus: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// Unspecified
  case unspecified // = 0

  /// Pending status
  case pending // = 1

  /// Completed status
  case completed // = 2

  /// Failed status
  case failed // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .pending
    case 2: self = .completed
    case 3: self = .failed
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .pending: return 1
    case .completed: return 2
    case .failed: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Sifnode_Dispensation_V1_DistributionStatus: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Sifnode_Dispensation_V1_DistributionStatus] = [
    .unspecified,
    .pending,
    .completed,
    .failed,
  ]
}

#endif  // swift(>=4.2)

struct Sifnode_Dispensation_V1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var distributionRecords: Sifnode_Dispensation_V1_DistributionRecords {
    get {return _distributionRecords ?? Sifnode_Dispensation_V1_DistributionRecords()}
    set {_distributionRecords = newValue}
  }
  /// Returns true if `distributionRecords` has been explicitly set.
  var hasDistributionRecords: Bool {return self._distributionRecords != nil}
  /// Clears the value of `distributionRecords`. Subsequent reads from it will return its default value.
  mutating func clearDistributionRecords() {self._distributionRecords = nil}

  var distributions: Sifnode_Dispensation_V1_Distributions {
    get {return _distributions ?? Sifnode_Dispensation_V1_Distributions()}
    set {_distributions = newValue}
  }
  /// Returns true if `distributions` has been explicitly set.
  var hasDistributions: Bool {return self._distributions != nil}
  /// Clears the value of `distributions`. Subsequent reads from it will return its default value.
  mutating func clearDistributions() {self._distributions = nil}

  var claims: Sifnode_Dispensation_V1_UserClaims {
    get {return _claims ?? Sifnode_Dispensation_V1_UserClaims()}
    set {_claims = newValue}
  }
  /// Returns true if `claims` has been explicitly set.
  var hasClaims: Bool {return self._claims != nil}
  /// Clears the value of `claims`. Subsequent reads from it will return its default value.
  mutating func clearClaims() {self._claims = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _distributionRecords: Sifnode_Dispensation_V1_DistributionRecords? = nil
  fileprivate var _distributions: Sifnode_Dispensation_V1_Distributions? = nil
  fileprivate var _claims: Sifnode_Dispensation_V1_UserClaims? = nil
}

struct Sifnode_Dispensation_V1_DistributionRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var distributionStatus: Sifnode_Dispensation_V1_DistributionStatus = .unspecified

  var distributionType: Sifnode_Dispensation_V1_DistributionType = .unspecified

  var distributionName: String = String()

  var recipientAddress: String = String()

  var coins: [Cosmos_Base_V1beta1_Coin] = []

  var distributionStartHeight: Int64 = 0

  var distributionCompletedHeight: Int64 = 0

  var authorizedRunner: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Sifnode_Dispensation_V1_DistributionRecords {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var distributionRecords: [Sifnode_Dispensation_V1_DistributionRecord] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Sifnode_Dispensation_V1_Distributions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var distributions: [Sifnode_Dispensation_V1_Distribution] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Sifnode_Dispensation_V1_Distribution {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var distributionType: Sifnode_Dispensation_V1_DistributionType = .unspecified

  var distributionName: String = String()

  var runner: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Sifnode_Dispensation_V1_UserClaim {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var userAddress: String = String()

  var userClaimType: Sifnode_Dispensation_V1_DistributionType = .unspecified

  var userClaimTime: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Sifnode_Dispensation_V1_UserClaims {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var userClaims: [Sifnode_Dispensation_V1_UserClaim] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "sifnode.dispensation.v1"

extension Sifnode_Dispensation_V1_DistributionType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DISTRIBUTION_TYPE_UNSPECIFIED"),
    1: .same(proto: "DISTRIBUTION_TYPE_AIRDROP"),
    2: .same(proto: "DISTRIBUTION_TYPE_VALIDATOR_SUBSIDY"),
    3: .same(proto: "DISTRIBUTION_TYPE_LIQUIDITY_MINING"),
  ]
}

extension Sifnode_Dispensation_V1_DistributionStatus: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DISTRIBUTION_STATUS_UNSPECIFIED"),
    1: .same(proto: "DISTRIBUTION_STATUS_PENDING"),
    2: .same(proto: "DISTRIBUTION_STATUS_COMPLETED"),
    3: .same(proto: "DISTRIBUTION_STATUS_FAILED"),
  ]
}

extension Sifnode_Dispensation_V1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "distribution_records"),
    2: .same(proto: "distributions"),
    3: .same(proto: "claims"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularMessageField(value: &self._distributionRecords)
      case 2: try decoder.decodeSingularMessageField(value: &self._distributions)
      case 3: try decoder.decodeSingularMessageField(value: &self._claims)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._distributionRecords {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._distributions {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if let v = self._claims {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Dispensation_V1_GenesisState, rhs: Sifnode_Dispensation_V1_GenesisState) -> Bool {
    if lhs._distributionRecords != rhs._distributionRecords {return false}
    if lhs._distributions != rhs._distributions {return false}
    if lhs._claims != rhs._claims {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Dispensation_V1_DistributionRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DistributionRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "distribution_status"),
    2: .standard(proto: "distribution_type"),
    3: .standard(proto: "distribution_name"),
    4: .standard(proto: "recipient_address"),
    5: .same(proto: "coins"),
    6: .standard(proto: "distribution_start_height"),
    7: .standard(proto: "distribution_completed_height"),
    8: .standard(proto: "authorized_runner"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.distributionStatus)
      case 2: try decoder.decodeSingularEnumField(value: &self.distributionType)
      case 3: try decoder.decodeSingularStringField(value: &self.distributionName)
      case 4: try decoder.decodeSingularStringField(value: &self.recipientAddress)
      case 5: try decoder.decodeRepeatedMessageField(value: &self.coins)
      case 6: try decoder.decodeSingularInt64Field(value: &self.distributionStartHeight)
      case 7: try decoder.decodeSingularInt64Field(value: &self.distributionCompletedHeight)
      case 8: try decoder.decodeSingularStringField(value: &self.authorizedRunner)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.distributionStatus != .unspecified {
      try visitor.visitSingularEnumField(value: self.distributionStatus, fieldNumber: 1)
    }
    if self.distributionType != .unspecified {
      try visitor.visitSingularEnumField(value: self.distributionType, fieldNumber: 2)
    }
    if !self.distributionName.isEmpty {
      try visitor.visitSingularStringField(value: self.distributionName, fieldNumber: 3)
    }
    if !self.recipientAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.recipientAddress, fieldNumber: 4)
    }
    if !self.coins.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.coins, fieldNumber: 5)
    }
    if self.distributionStartHeight != 0 {
      try visitor.visitSingularInt64Field(value: self.distributionStartHeight, fieldNumber: 6)
    }
    if self.distributionCompletedHeight != 0 {
      try visitor.visitSingularInt64Field(value: self.distributionCompletedHeight, fieldNumber: 7)
    }
    if !self.authorizedRunner.isEmpty {
      try visitor.visitSingularStringField(value: self.authorizedRunner, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Dispensation_V1_DistributionRecord, rhs: Sifnode_Dispensation_V1_DistributionRecord) -> Bool {
    if lhs.distributionStatus != rhs.distributionStatus {return false}
    if lhs.distributionType != rhs.distributionType {return false}
    if lhs.distributionName != rhs.distributionName {return false}
    if lhs.recipientAddress != rhs.recipientAddress {return false}
    if lhs.coins != rhs.coins {return false}
    if lhs.distributionStartHeight != rhs.distributionStartHeight {return false}
    if lhs.distributionCompletedHeight != rhs.distributionCompletedHeight {return false}
    if lhs.authorizedRunner != rhs.authorizedRunner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Dispensation_V1_DistributionRecords: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DistributionRecords"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "distribution_records"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.distributionRecords)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.distributionRecords.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.distributionRecords, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Dispensation_V1_DistributionRecords, rhs: Sifnode_Dispensation_V1_DistributionRecords) -> Bool {
    if lhs.distributionRecords != rhs.distributionRecords {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Dispensation_V1_Distributions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Distributions"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "distributions"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.distributions)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.distributions.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.distributions, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Dispensation_V1_Distributions, rhs: Sifnode_Dispensation_V1_Distributions) -> Bool {
    if lhs.distributions != rhs.distributions {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Dispensation_V1_Distribution: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Distribution"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "distribution_type"),
    2: .standard(proto: "distribution_name"),
    3: .same(proto: "runner"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.distributionType)
      case 2: try decoder.decodeSingularStringField(value: &self.distributionName)
      case 3: try decoder.decodeSingularStringField(value: &self.runner)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.distributionType != .unspecified {
      try visitor.visitSingularEnumField(value: self.distributionType, fieldNumber: 1)
    }
    if !self.distributionName.isEmpty {
      try visitor.visitSingularStringField(value: self.distributionName, fieldNumber: 2)
    }
    if !self.runner.isEmpty {
      try visitor.visitSingularStringField(value: self.runner, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Dispensation_V1_Distribution, rhs: Sifnode_Dispensation_V1_Distribution) -> Bool {
    if lhs.distributionType != rhs.distributionType {return false}
    if lhs.distributionName != rhs.distributionName {return false}
    if lhs.runner != rhs.runner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Dispensation_V1_UserClaim: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserClaim"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_address"),
    2: .standard(proto: "user_claim_type"),
    3: .standard(proto: "user_claim_time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.userAddress)
      case 2: try decoder.decodeSingularEnumField(value: &self.userClaimType)
      case 3: try decoder.decodeSingularStringField(value: &self.userClaimTime)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.userAddress, fieldNumber: 1)
    }
    if self.userClaimType != .unspecified {
      try visitor.visitSingularEnumField(value: self.userClaimType, fieldNumber: 2)
    }
    if !self.userClaimTime.isEmpty {
      try visitor.visitSingularStringField(value: self.userClaimTime, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Dispensation_V1_UserClaim, rhs: Sifnode_Dispensation_V1_UserClaim) -> Bool {
    if lhs.userAddress != rhs.userAddress {return false}
    if lhs.userClaimType != rhs.userClaimType {return false}
    if lhs.userClaimTime != rhs.userClaimTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Dispensation_V1_UserClaims: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserClaims"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_claims"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.userClaims)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userClaims.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.userClaims, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Dispensation_V1_UserClaims, rhs: Sifnode_Dispensation_V1_UserClaims) -> Bool {
    if lhs.userClaims != rhs.userClaims {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}