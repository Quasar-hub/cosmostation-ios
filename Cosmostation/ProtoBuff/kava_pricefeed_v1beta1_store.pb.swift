// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: kava/pricefeed/v1beta1/store.proto
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

/// Params defines the parameters for the pricefeed module.
struct Kava_Pricefeed_V1beta1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var markets: [Kava_Pricefeed_V1beta1_Market] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Market defines an asset in the pricefeed.
struct Kava_Pricefeed_V1beta1_Market {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var marketID: String = String()

  var baseAsset: String = String()

  var quoteAsset: String = String()

  var oracles: [Data] = []

  var active: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// PostedPrice defines a price for market posted by a specific oracle.
struct Kava_Pricefeed_V1beta1_PostedPrice {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var marketID: String = String()

  var oracleAddress: Data = Data()

  var price: String = String()

  var expiry: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _expiry ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_expiry = newValue}
  }
  /// Returns true if `expiry` has been explicitly set.
  var hasExpiry: Bool {return self._expiry != nil}
  /// Clears the value of `expiry`. Subsequent reads from it will return its default value.
  mutating func clearExpiry() {self._expiry = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _expiry: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// CurrentPrice defines a current price for a particular market in the pricefeed
/// module.
struct Kava_Pricefeed_V1beta1_CurrentPrice {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var marketID: String = String()

  var price: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "kava.pricefeed.v1beta1"

extension Kava_Pricefeed_V1beta1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Params"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "markets"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.markets) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.markets.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.markets, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Pricefeed_V1beta1_Params, rhs: Kava_Pricefeed_V1beta1_Params) -> Bool {
    if lhs.markets != rhs.markets {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Pricefeed_V1beta1_Market: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Market"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "market_id"),
    2: .standard(proto: "base_asset"),
    3: .standard(proto: "quote_asset"),
    4: .same(proto: "oracles"),
    5: .same(proto: "active"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.marketID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.baseAsset) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.quoteAsset) }()
      case 4: try { try decoder.decodeRepeatedBytesField(value: &self.oracles) }()
      case 5: try { try decoder.decodeSingularBoolField(value: &self.active) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.marketID.isEmpty {
      try visitor.visitSingularStringField(value: self.marketID, fieldNumber: 1)
    }
    if !self.baseAsset.isEmpty {
      try visitor.visitSingularStringField(value: self.baseAsset, fieldNumber: 2)
    }
    if !self.quoteAsset.isEmpty {
      try visitor.visitSingularStringField(value: self.quoteAsset, fieldNumber: 3)
    }
    if !self.oracles.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.oracles, fieldNumber: 4)
    }
    if self.active != false {
      try visitor.visitSingularBoolField(value: self.active, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Pricefeed_V1beta1_Market, rhs: Kava_Pricefeed_V1beta1_Market) -> Bool {
    if lhs.marketID != rhs.marketID {return false}
    if lhs.baseAsset != rhs.baseAsset {return false}
    if lhs.quoteAsset != rhs.quoteAsset {return false}
    if lhs.oracles != rhs.oracles {return false}
    if lhs.active != rhs.active {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Pricefeed_V1beta1_PostedPrice: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PostedPrice"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "market_id"),
    2: .standard(proto: "oracle_address"),
    3: .same(proto: "price"),
    4: .same(proto: "expiry"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.marketID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.oracleAddress) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.price) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._expiry) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.marketID.isEmpty {
      try visitor.visitSingularStringField(value: self.marketID, fieldNumber: 1)
    }
    if !self.oracleAddress.isEmpty {
      try visitor.visitSingularBytesField(value: self.oracleAddress, fieldNumber: 2)
    }
    if !self.price.isEmpty {
      try visitor.visitSingularStringField(value: self.price, fieldNumber: 3)
    }
    if let v = self._expiry {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Pricefeed_V1beta1_PostedPrice, rhs: Kava_Pricefeed_V1beta1_PostedPrice) -> Bool {
    if lhs.marketID != rhs.marketID {return false}
    if lhs.oracleAddress != rhs.oracleAddress {return false}
    if lhs.price != rhs.price {return false}
    if lhs._expiry != rhs._expiry {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Pricefeed_V1beta1_CurrentPrice: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CurrentPrice"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "market_id"),
    2: .same(proto: "price"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.marketID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.price) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.marketID.isEmpty {
      try visitor.visitSingularStringField(value: self.marketID, fieldNumber: 1)
    }
    if !self.price.isEmpty {
      try visitor.visitSingularStringField(value: self.price, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Pricefeed_V1beta1_CurrentPrice, rhs: Kava_Pricefeed_V1beta1_CurrentPrice) -> Bool {
    if lhs.marketID != rhs.marketID {return false}
    if lhs.price != rhs.price {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
