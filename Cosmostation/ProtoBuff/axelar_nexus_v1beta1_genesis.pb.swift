// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: axelar/nexus/v1beta1/genesis.proto
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

/// GenesisState represents the genesis state
struct Axelar_Nexus_V1beta1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var params: Axelar_Nexus_V1beta1_Params {
    get {return _params ?? Axelar_Nexus_V1beta1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var nonce: UInt64 = 0

  var chains: [Axelar_Nexus_Exported_V1beta1_Chain] = []

  var chainStates: [Axelar_Nexus_V1beta1_ChainState] = []

  var linkedAddresses: [Axelar_Nexus_V1beta1_LinkedAddresses] = []

  var transfers: [Axelar_Nexus_Exported_V1beta1_CrossChainTransfer] = []

  var fee: Axelar_Nexus_Exported_V1beta1_TransferFee {
    get {return _fee ?? Axelar_Nexus_Exported_V1beta1_TransferFee()}
    set {_fee = newValue}
  }
  /// Returns true if `fee` has been explicitly set.
  var hasFee: Bool {return self._fee != nil}
  /// Clears the value of `fee`. Subsequent reads from it will return its default value.
  mutating func clearFee() {self._fee = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Axelar_Nexus_V1beta1_Params? = nil
  fileprivate var _fee: Axelar_Nexus_Exported_V1beta1_TransferFee? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "axelar.nexus.v1beta1"

extension Axelar_Nexus_V1beta1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
    2: .same(proto: "nonce"),
    3: .same(proto: "chains"),
    4: .standard(proto: "chain_states"),
    5: .standard(proto: "linked_addresses"),
    6: .same(proto: "transfers"),
    7: .same(proto: "fee"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.nonce) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.chains) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.chainStates) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.linkedAddresses) }()
      case 6: try { try decoder.decodeRepeatedMessageField(value: &self.transfers) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._fee) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if self.nonce != 0 {
      try visitor.visitSingularUInt64Field(value: self.nonce, fieldNumber: 2)
    }
    if !self.chains.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.chains, fieldNumber: 3)
    }
    if !self.chainStates.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.chainStates, fieldNumber: 4)
    }
    if !self.linkedAddresses.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.linkedAddresses, fieldNumber: 5)
    }
    if !self.transfers.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.transfers, fieldNumber: 6)
    }
    if let v = self._fee {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Axelar_Nexus_V1beta1_GenesisState, rhs: Axelar_Nexus_V1beta1_GenesisState) -> Bool {
    if lhs._params != rhs._params {return false}
    if lhs.nonce != rhs.nonce {return false}
    if lhs.chains != rhs.chains {return false}
    if lhs.chainStates != rhs.chainStates {return false}
    if lhs.linkedAddresses != rhs.linkedAddresses {return false}
    if lhs.transfers != rhs.transfers {return false}
    if lhs._fee != rhs._fee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}