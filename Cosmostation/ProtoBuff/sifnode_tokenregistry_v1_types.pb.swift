// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: sifnode/tokenregistry/v1/types.proto
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

enum Sifnode_Tokenregistry_V1_Permission: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case unspecified // = 0
  case clp // = 1
  case ibcexport // = 2
  case ibcimport // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .clp
    case 2: self = .ibcexport
    case 3: self = .ibcimport
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .clp: return 1
    case .ibcexport: return 2
    case .ibcimport: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Sifnode_Tokenregistry_V1_Permission: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Sifnode_Tokenregistry_V1_Permission] = [
    .unspecified,
    .clp,
    .ibcexport,
    .ibcimport,
  ]
}

#endif  // swift(>=4.2)

enum Sifnode_Tokenregistry_V1_AdminType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case clpdex // = 0
  case pmtprewards // = 1
  case tokenregistry // = 2
  case ethbridge // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .clpdex
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .clpdex
    case 1: self = .pmtprewards
    case 2: self = .tokenregistry
    case 3: self = .ethbridge
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .clpdex: return 0
    case .pmtprewards: return 1
    case .tokenregistry: return 2
    case .ethbridge: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Sifnode_Tokenregistry_V1_AdminType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Sifnode_Tokenregistry_V1_AdminType] = [
    .clpdex,
    .pmtprewards,
    .tokenregistry,
    .ethbridge,
  ]
}

#endif  // swift(>=4.2)

struct Sifnode_Tokenregistry_V1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var adminAccounts: Sifnode_Tokenregistry_V1_AdminAccounts {
    get {return _adminAccounts ?? Sifnode_Tokenregistry_V1_AdminAccounts()}
    set {_adminAccounts = newValue}
  }
  /// Returns true if `adminAccounts` has been explicitly set.
  var hasAdminAccounts: Bool {return self._adminAccounts != nil}
  /// Clears the value of `adminAccounts`. Subsequent reads from it will return its default value.
  mutating func clearAdminAccounts() {self._adminAccounts = nil}

  var registry: Sifnode_Tokenregistry_V1_Registry {
    get {return _registry ?? Sifnode_Tokenregistry_V1_Registry()}
    set {_registry = newValue}
  }
  /// Returns true if `registry` has been explicitly set.
  var hasRegistry: Bool {return self._registry != nil}
  /// Clears the value of `registry`. Subsequent reads from it will return its default value.
  mutating func clearRegistry() {self._registry = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _adminAccounts: Sifnode_Tokenregistry_V1_AdminAccounts? = nil
  fileprivate var _registry: Sifnode_Tokenregistry_V1_Registry? = nil
}

struct Sifnode_Tokenregistry_V1_Registry {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var entries: [Sifnode_Tokenregistry_V1_RegistryEntry] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Sifnode_Tokenregistry_V1_RegistryEntry {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var decimals: Int64 = 0

  var denom: String = String()

  var baseDenom: String = String()

  var path: String = String()

  var ibcChannelID: String = String()

  var ibcCounterpartyChannelID: String = String()

  var displayName: String = String()

  var displaySymbol: String = String()

  var network: String = String()

  var address: String = String()

  var externalSymbol: String = String()

  var transferLimit: String = String()

  var permissions: [Sifnode_Tokenregistry_V1_Permission] = []

  /// The name of denomination unit of this token that is the smallest unit
  /// stored. IBC imports of this RegistryEntry convert and store funds as
  /// unit_denom. Several different denom units of a token may be imported into
  /// this same unit denom, they should all be stored under the same unit_denom
  /// if they are the same token. When exporting a RegistryEntry where unit_denom
  /// != denom, then unit_denom can, in future, be used to indicate the source of
  /// funds for a denom unit that does not actually exist on chain, enabling
  /// other chains to overcome the uint64 limit on the packet level and import
  /// large amounts of high precision tokens easily. ie. microrowan -> rowan i.e
  /// rowan -> rowan
  var unitDenom: String = String()

  /// The name of denomination unit of this token that should appear on
  /// counterparty chain when this unit is exported. If empty, the denom is
  /// exported as is. Generally this will only be used to map a high precision
  /// (unit_denom) to a lower precision, to overcome the current uint64 limit on
  /// the packet level. i.e rowan -> microrowan i.e microrowan -> microrowan
  var ibcCounterpartyDenom: String = String()

  var ibcCounterpartyChainID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Sifnode_Tokenregistry_V1_AdminAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var adminType: Sifnode_Tokenregistry_V1_AdminType = .clpdex

  var adminAddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Sifnode_Tokenregistry_V1_AdminAccounts {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var adminAccounts: [Sifnode_Tokenregistry_V1_AdminAccount] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "sifnode.tokenregistry.v1"

extension Sifnode_Tokenregistry_V1_Permission: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNSPECIFIED"),
    1: .same(proto: "CLP"),
    2: .same(proto: "IBCEXPORT"),
    3: .same(proto: "IBCIMPORT"),
  ]
}

extension Sifnode_Tokenregistry_V1_AdminType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "CLPDEX"),
    1: .same(proto: "PMTPREWARDS"),
    2: .same(proto: "TOKENREGISTRY"),
    3: .same(proto: "ETHBRIDGE"),
  ]
}

extension Sifnode_Tokenregistry_V1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "admin_accounts"),
    2: .same(proto: "registry"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._adminAccounts) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._registry) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._adminAccounts {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._registry {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Tokenregistry_V1_GenesisState, rhs: Sifnode_Tokenregistry_V1_GenesisState) -> Bool {
    if lhs._adminAccounts != rhs._adminAccounts {return false}
    if lhs._registry != rhs._registry {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Tokenregistry_V1_Registry: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Registry"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "entries"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.entries) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.entries.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.entries, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Tokenregistry_V1_Registry, rhs: Sifnode_Tokenregistry_V1_Registry) -> Bool {
    if lhs.entries != rhs.entries {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Tokenregistry_V1_RegistryEntry: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RegistryEntry"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .same(proto: "decimals"),
    3: .same(proto: "denom"),
    4: .standard(proto: "base_denom"),
    5: .same(proto: "path"),
    6: .standard(proto: "ibc_channel_id"),
    7: .standard(proto: "ibc_counterparty_channel_id"),
    8: .standard(proto: "display_name"),
    9: .standard(proto: "display_symbol"),
    10: .same(proto: "network"),
    11: .same(proto: "address"),
    12: .standard(proto: "external_symbol"),
    13: .standard(proto: "transfer_limit"),
    15: .same(proto: "permissions"),
    16: .standard(proto: "unit_denom"),
    17: .standard(proto: "ibc_counterparty_denom"),
    18: .standard(proto: "ibc_counterparty_chain_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.decimals) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.denom) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.baseDenom) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.path) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.ibcChannelID) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.ibcCounterpartyChannelID) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.displayName) }()
      case 9: try { try decoder.decodeSingularStringField(value: &self.displaySymbol) }()
      case 10: try { try decoder.decodeSingularStringField(value: &self.network) }()
      case 11: try { try decoder.decodeSingularStringField(value: &self.address) }()
      case 12: try { try decoder.decodeSingularStringField(value: &self.externalSymbol) }()
      case 13: try { try decoder.decodeSingularStringField(value: &self.transferLimit) }()
      case 15: try { try decoder.decodeRepeatedEnumField(value: &self.permissions) }()
      case 16: try { try decoder.decodeSingularStringField(value: &self.unitDenom) }()
      case 17: try { try decoder.decodeSingularStringField(value: &self.ibcCounterpartyDenom) }()
      case 18: try { try decoder.decodeSingularStringField(value: &self.ibcCounterpartyChainID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.decimals != 0 {
      try visitor.visitSingularInt64Field(value: self.decimals, fieldNumber: 2)
    }
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 3)
    }
    if !self.baseDenom.isEmpty {
      try visitor.visitSingularStringField(value: self.baseDenom, fieldNumber: 4)
    }
    if !self.path.isEmpty {
      try visitor.visitSingularStringField(value: self.path, fieldNumber: 5)
    }
    if !self.ibcChannelID.isEmpty {
      try visitor.visitSingularStringField(value: self.ibcChannelID, fieldNumber: 6)
    }
    if !self.ibcCounterpartyChannelID.isEmpty {
      try visitor.visitSingularStringField(value: self.ibcCounterpartyChannelID, fieldNumber: 7)
    }
    if !self.displayName.isEmpty {
      try visitor.visitSingularStringField(value: self.displayName, fieldNumber: 8)
    }
    if !self.displaySymbol.isEmpty {
      try visitor.visitSingularStringField(value: self.displaySymbol, fieldNumber: 9)
    }
    if !self.network.isEmpty {
      try visitor.visitSingularStringField(value: self.network, fieldNumber: 10)
    }
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 11)
    }
    if !self.externalSymbol.isEmpty {
      try visitor.visitSingularStringField(value: self.externalSymbol, fieldNumber: 12)
    }
    if !self.transferLimit.isEmpty {
      try visitor.visitSingularStringField(value: self.transferLimit, fieldNumber: 13)
    }
    if !self.permissions.isEmpty {
      try visitor.visitPackedEnumField(value: self.permissions, fieldNumber: 15)
    }
    if !self.unitDenom.isEmpty {
      try visitor.visitSingularStringField(value: self.unitDenom, fieldNumber: 16)
    }
    if !self.ibcCounterpartyDenom.isEmpty {
      try visitor.visitSingularStringField(value: self.ibcCounterpartyDenom, fieldNumber: 17)
    }
    if !self.ibcCounterpartyChainID.isEmpty {
      try visitor.visitSingularStringField(value: self.ibcCounterpartyChainID, fieldNumber: 18)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Tokenregistry_V1_RegistryEntry, rhs: Sifnode_Tokenregistry_V1_RegistryEntry) -> Bool {
    if lhs.decimals != rhs.decimals {return false}
    if lhs.denom != rhs.denom {return false}
    if lhs.baseDenom != rhs.baseDenom {return false}
    if lhs.path != rhs.path {return false}
    if lhs.ibcChannelID != rhs.ibcChannelID {return false}
    if lhs.ibcCounterpartyChannelID != rhs.ibcCounterpartyChannelID {return false}
    if lhs.displayName != rhs.displayName {return false}
    if lhs.displaySymbol != rhs.displaySymbol {return false}
    if lhs.network != rhs.network {return false}
    if lhs.address != rhs.address {return false}
    if lhs.externalSymbol != rhs.externalSymbol {return false}
    if lhs.transferLimit != rhs.transferLimit {return false}
    if lhs.permissions != rhs.permissions {return false}
    if lhs.unitDenom != rhs.unitDenom {return false}
    if lhs.ibcCounterpartyDenom != rhs.ibcCounterpartyDenom {return false}
    if lhs.ibcCounterpartyChainID != rhs.ibcCounterpartyChainID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Tokenregistry_V1_AdminAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AdminAccount"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "admin_type"),
    2: .standard(proto: "admin_address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.adminType) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.adminAddress) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.adminType != .clpdex {
      try visitor.visitSingularEnumField(value: self.adminType, fieldNumber: 1)
    }
    if !self.adminAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.adminAddress, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Tokenregistry_V1_AdminAccount, rhs: Sifnode_Tokenregistry_V1_AdminAccount) -> Bool {
    if lhs.adminType != rhs.adminType {return false}
    if lhs.adminAddress != rhs.adminAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Sifnode_Tokenregistry_V1_AdminAccounts: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AdminAccounts"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "admin_accounts"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.adminAccounts) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.adminAccounts.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.adminAccounts, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Tokenregistry_V1_AdminAccounts, rhs: Sifnode_Tokenregistry_V1_AdminAccounts) -> Bool {
    if lhs.adminAccounts != rhs.adminAccounts {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
