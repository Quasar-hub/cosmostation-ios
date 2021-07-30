// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: sifnode/clp/v1/genesis.proto
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

/// GenesisState - all clp state that must be provided at genesis
/// TODO: Add parameters to Genesis state ,such as minimum liquidity required to
/// create a pool
struct Sifnode_Clp_V1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var params: Sifnode_Clp_V1_Params {
    get {return _params ?? Sifnode_Clp_V1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var addressWhitelist: [String] = []

  var poolList: [Sifnode_Clp_V1_Pool] = []

  var liquidityProviders: [Sifnode_Clp_V1_LiquidityProvider] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Sifnode_Clp_V1_Params? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "sifnode.clp.v1"

extension Sifnode_Clp_V1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
    2: .standard(proto: "address_whitelist"),
    3: .standard(proto: "pool_list"),
    4: .standard(proto: "liquidity_providers"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularMessageField(value: &self._params)
      case 2: try decoder.decodeRepeatedStringField(value: &self.addressWhitelist)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.poolList)
      case 4: try decoder.decodeRepeatedMessageField(value: &self.liquidityProviders)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.addressWhitelist.isEmpty {
      try visitor.visitRepeatedStringField(value: self.addressWhitelist, fieldNumber: 2)
    }
    if !self.poolList.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.poolList, fieldNumber: 3)
    }
    if !self.liquidityProviders.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.liquidityProviders, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Sifnode_Clp_V1_GenesisState, rhs: Sifnode_Clp_V1_GenesisState) -> Bool {
    if lhs._params != rhs._params {return false}
    if lhs.addressWhitelist != rhs.addressWhitelist {return false}
    if lhs.poolList != rhs.poolList {return false}
    if lhs.liquidityProviders != rhs.liquidityProviders {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
