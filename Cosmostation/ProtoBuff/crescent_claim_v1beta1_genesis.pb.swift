// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: crescent/claim/v1beta1/genesis.proto
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

/// GenesisState defines the claim module's genesis state.
struct Crescent_Claim_V1beta1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// airdrops specifies a list of airdrops
  var airdrops: [Crescent_Claim_V1beta1_Airdrop] = []

  /// claim_records specifies a list of claim records
  var claimRecords: [Crescent_Claim_V1beta1_ClaimRecord] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "crescent.claim.v1beta1"

extension Crescent_Claim_V1beta1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "airdrops"),
    2: .standard(proto: "claim_records"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.airdrops) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.claimRecords) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.airdrops.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.airdrops, fieldNumber: 1)
    }
    if !self.claimRecords.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.claimRecords, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Crescent_Claim_V1beta1_GenesisState, rhs: Crescent_Claim_V1beta1_GenesisState) -> Bool {
    if lhs.airdrops != rhs.airdrops {return false}
    if lhs.claimRecords != rhs.claimRecords {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}