// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ibc/applications/transfer/v1/authz.proto
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

/// Allocation defines the spend limit for a particular port and channel
struct Ibc_Applications_Transfer_V1_Allocation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// the port on which the packet will be sent
  var sourcePort: String = String()

  /// the channel by which the packet will be sent
  var sourceChannel: String = String()

  /// spend limitation on the channel
  var spendLimit: [Cosmos_Base_V1beta1_Coin] = []

  /// allow list of receivers, an empty allow list permits any receiver address
  var allowList: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// TransferAuthorization allows the grantee to spend up to spend_limit coins from
/// the granter's account for ibc transfer on a specific channel
struct Ibc_Applications_Transfer_V1_TransferAuthorization {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// port and channel amounts
  var allocations: [Ibc_Applications_Transfer_V1_Allocation] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Ibc_Applications_Transfer_V1_Allocation: @unchecked Sendable {}
extension Ibc_Applications_Transfer_V1_TransferAuthorization: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "ibc.applications.transfer.v1"

extension Ibc_Applications_Transfer_V1_Allocation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Allocation"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "source_port"),
    2: .standard(proto: "source_channel"),
    3: .standard(proto: "spend_limit"),
    4: .standard(proto: "allow_list"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sourcePort) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.sourceChannel) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.spendLimit) }()
      case 4: try { try decoder.decodeRepeatedStringField(value: &self.allowList) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sourcePort.isEmpty {
      try visitor.visitSingularStringField(value: self.sourcePort, fieldNumber: 1)
    }
    if !self.sourceChannel.isEmpty {
      try visitor.visitSingularStringField(value: self.sourceChannel, fieldNumber: 2)
    }
    if !self.spendLimit.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.spendLimit, fieldNumber: 3)
    }
    if !self.allowList.isEmpty {
      try visitor.visitRepeatedStringField(value: self.allowList, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Ibc_Applications_Transfer_V1_Allocation, rhs: Ibc_Applications_Transfer_V1_Allocation) -> Bool {
    if lhs.sourcePort != rhs.sourcePort {return false}
    if lhs.sourceChannel != rhs.sourceChannel {return false}
    if lhs.spendLimit != rhs.spendLimit {return false}
    if lhs.allowList != rhs.allowList {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Applications_Transfer_V1_TransferAuthorization: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TransferAuthorization"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "allocations"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.allocations) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.allocations.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.allocations, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Ibc_Applications_Transfer_V1_TransferAuthorization, rhs: Ibc_Applications_Transfer_V1_TransferAuthorization) -> Bool {
    if lhs.allocations != rhs.allocations {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}