// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: iov/escrow/v1beta1/genesis.proto
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

/// GenesisState defines the Escrow module's genesis state
struct Starnamed_X_Escrow_V1beta1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var escrows: [Starnamed_X_Escrow_V1beta1_Escrow] = []

  var lastBlockTime: UInt64 = 0

  var nextEscrowID: UInt64 = 0

  var params: Starnamed_X_Escrow_V1beta1_Params {
    get {return _params ?? Starnamed_X_Escrow_V1beta1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Starnamed_X_Escrow_V1beta1_Params? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Starnamed_X_Escrow_V1beta1_GenesisState: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "starnamed.x.escrow.v1beta1"

extension Starnamed_X_Escrow_V1beta1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "escrows"),
    2: .standard(proto: "last_block_time"),
    3: .standard(proto: "next_escrow_id"),
    4: .same(proto: "params"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.escrows) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.lastBlockTime) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.nextEscrowID) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.escrows.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.escrows, fieldNumber: 1)
    }
    if self.lastBlockTime != 0 {
      try visitor.visitSingularUInt64Field(value: self.lastBlockTime, fieldNumber: 2)
    }
    if self.nextEscrowID != 0 {
      try visitor.visitSingularUInt64Field(value: self.nextEscrowID, fieldNumber: 3)
    }
    try { if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_GenesisState, rhs: Starnamed_X_Escrow_V1beta1_GenesisState) -> Bool {
    if lhs.escrows != rhs.escrows {return false}
    if lhs.lastBlockTime != rhs.lastBlockTime {return false}
    if lhs.nextEscrowID != rhs.nextEscrowID {return false}
    if lhs._params != rhs._params {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
