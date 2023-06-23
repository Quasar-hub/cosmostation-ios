// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: injective/ocr/v1beta1/query.proto
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

struct Injective_Ocr_V1beta1_QueryParamsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_QueryParamsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var params: Injective_Ocr_V1beta1_Params {
    get {return _params ?? Injective_Ocr_V1beta1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Injective_Ocr_V1beta1_Params? = nil
}

struct Injective_Ocr_V1beta1_QueryFeedConfigRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var feedID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_QueryFeedConfigResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var feedConfigInfo: Injective_Ocr_V1beta1_FeedConfigInfo {
    get {return _storage._feedConfigInfo ?? Injective_Ocr_V1beta1_FeedConfigInfo()}
    set {_uniqueStorage()._feedConfigInfo = newValue}
  }
  /// Returns true if `feedConfigInfo` has been explicitly set.
  var hasFeedConfigInfo: Bool {return _storage._feedConfigInfo != nil}
  /// Clears the value of `feedConfigInfo`. Subsequent reads from it will return its default value.
  mutating func clearFeedConfigInfo() {_uniqueStorage()._feedConfigInfo = nil}

  var feedConfig: Injective_Ocr_V1beta1_FeedConfig {
    get {return _storage._feedConfig ?? Injective_Ocr_V1beta1_FeedConfig()}
    set {_uniqueStorage()._feedConfig = newValue}
  }
  /// Returns true if `feedConfig` has been explicitly set.
  var hasFeedConfig: Bool {return _storage._feedConfig != nil}
  /// Clears the value of `feedConfig`. Subsequent reads from it will return its default value.
  mutating func clearFeedConfig() {_uniqueStorage()._feedConfig = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var feedID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var feedConfigInfo: Injective_Ocr_V1beta1_FeedConfigInfo {
    get {return _feedConfigInfo ?? Injective_Ocr_V1beta1_FeedConfigInfo()}
    set {_feedConfigInfo = newValue}
  }
  /// Returns true if `feedConfigInfo` has been explicitly set.
  var hasFeedConfigInfo: Bool {return self._feedConfigInfo != nil}
  /// Clears the value of `feedConfigInfo`. Subsequent reads from it will return its default value.
  mutating func clearFeedConfigInfo() {self._feedConfigInfo = nil}

  var epochAndRound: Injective_Ocr_V1beta1_EpochAndRound {
    get {return _epochAndRound ?? Injective_Ocr_V1beta1_EpochAndRound()}
    set {_epochAndRound = newValue}
  }
  /// Returns true if `epochAndRound` has been explicitly set.
  var hasEpochAndRound: Bool {return self._epochAndRound != nil}
  /// Clears the value of `epochAndRound`. Subsequent reads from it will return its default value.
  mutating func clearEpochAndRound() {self._epochAndRound = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _feedConfigInfo: Injective_Ocr_V1beta1_FeedConfigInfo? = nil
  fileprivate var _epochAndRound: Injective_Ocr_V1beta1_EpochAndRound? = nil
}

struct Injective_Ocr_V1beta1_QueryLatestRoundRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var feedID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_QueryLatestRoundResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var latestRoundID: UInt64 = 0

  var data: Injective_Ocr_V1beta1_Transmission {
    get {return _data ?? Injective_Ocr_V1beta1_Transmission()}
    set {_data = newValue}
  }
  /// Returns true if `data` has been explicitly set.
  var hasData: Bool {return self._data != nil}
  /// Clears the value of `data`. Subsequent reads from it will return its default value.
  mutating func clearData() {self._data = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _data: Injective_Ocr_V1beta1_Transmission? = nil
}

struct Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var feedID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var configDigest: Data = Data()

  var epochAndRound: Injective_Ocr_V1beta1_EpochAndRound {
    get {return _epochAndRound ?? Injective_Ocr_V1beta1_EpochAndRound()}
    set {_epochAndRound = newValue}
  }
  /// Returns true if `epochAndRound` has been explicitly set.
  var hasEpochAndRound: Bool {return self._epochAndRound != nil}
  /// Clears the value of `epochAndRound`. Subsequent reads from it will return its default value.
  mutating func clearEpochAndRound() {self._epochAndRound = nil}

  var data: Injective_Ocr_V1beta1_Transmission {
    get {return _data ?? Injective_Ocr_V1beta1_Transmission()}
    set {_data = newValue}
  }
  /// Returns true if `data` has been explicitly set.
  var hasData: Bool {return self._data != nil}
  /// Clears the value of `data`. Subsequent reads from it will return its default value.
  mutating func clearData() {self._data = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _epochAndRound: Injective_Ocr_V1beta1_EpochAndRound? = nil
  fileprivate var _data: Injective_Ocr_V1beta1_Transmission? = nil
}

struct Injective_Ocr_V1beta1_QueryOwedAmountRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var transmitter: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_QueryOwedAmountResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var amount: Cosmos_Base_V1beta1_Coin {
    get {return _amount ?? Cosmos_Base_V1beta1_Coin()}
    set {_amount = newValue}
  }
  /// Returns true if `amount` has been explicitly set.
  var hasAmount: Bool {return self._amount != nil}
  /// Clears the value of `amount`. Subsequent reads from it will return its default value.
  mutating func clearAmount() {self._amount = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _amount: Cosmos_Base_V1beta1_Coin? = nil
}

struct Injective_Ocr_V1beta1_QueryModuleStateRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_QueryModuleStateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var state: Injective_Ocr_V1beta1_GenesisState {
    get {return _state ?? Injective_Ocr_V1beta1_GenesisState()}
    set {_state = newValue}
  }
  /// Returns true if `state` has been explicitly set.
  var hasState: Bool {return self._state != nil}
  /// Clears the value of `state`. Subsequent reads from it will return its default value.
  mutating func clearState() {self._state = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _state: Injective_Ocr_V1beta1_GenesisState? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Injective_Ocr_V1beta1_QueryParamsRequest: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryParamsResponse: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryFeedConfigRequest: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryFeedConfigResponse: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryLatestRoundRequest: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryLatestRoundResponse: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryOwedAmountRequest: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryOwedAmountResponse: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryModuleStateRequest: @unchecked Sendable {}
extension Injective_Ocr_V1beta1_QueryModuleStateResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "injective.ocr.v1beta1"

extension Injective_Ocr_V1beta1_QueryParamsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryParamsRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryParamsRequest, rhs: Injective_Ocr_V1beta1_QueryParamsRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryParamsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryParamsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryParamsResponse, rhs: Injective_Ocr_V1beta1_QueryParamsResponse) -> Bool {
    if lhs._params != rhs._params {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryFeedConfigRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryFeedConfigRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "feed_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryFeedConfigRequest, rhs: Injective_Ocr_V1beta1_QueryFeedConfigRequest) -> Bool {
    if lhs.feedID != rhs.feedID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryFeedConfigResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryFeedConfigResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "feed_config_info"),
    2: .standard(proto: "feed_config"),
  ]

  fileprivate class _StorageClass {
    var _feedConfigInfo: Injective_Ocr_V1beta1_FeedConfigInfo? = nil
    var _feedConfig: Injective_Ocr_V1beta1_FeedConfig? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _feedConfigInfo = source._feedConfigInfo
      _feedConfig = source._feedConfig
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularMessageField(value: &_storage._feedConfigInfo) }()
        case 2: try { try decoder.decodeSingularMessageField(value: &_storage._feedConfig) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      try { if let v = _storage._feedConfigInfo {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      } }()
      try { if let v = _storage._feedConfig {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      } }()
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryFeedConfigResponse, rhs: Injective_Ocr_V1beta1_QueryFeedConfigResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._feedConfigInfo != rhs_storage._feedConfigInfo {return false}
        if _storage._feedConfig != rhs_storage._feedConfig {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryFeedConfigInfoRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "feed_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest, rhs: Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest) -> Bool {
    if lhs.feedID != rhs.feedID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryFeedConfigInfoResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "feed_config_info"),
    2: .standard(proto: "epoch_and_round"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._feedConfigInfo) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._epochAndRound) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._feedConfigInfo {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._epochAndRound {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse, rhs: Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse) -> Bool {
    if lhs._feedConfigInfo != rhs._feedConfigInfo {return false}
    if lhs._epochAndRound != rhs._epochAndRound {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryLatestRoundRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryLatestRoundRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "feed_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryLatestRoundRequest, rhs: Injective_Ocr_V1beta1_QueryLatestRoundRequest) -> Bool {
    if lhs.feedID != rhs.feedID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryLatestRoundResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryLatestRoundResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "latest_round_id"),
    2: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.latestRoundID) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._data) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.latestRoundID != 0 {
      try visitor.visitSingularUInt64Field(value: self.latestRoundID, fieldNumber: 1)
    }
    try { if let v = self._data {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryLatestRoundResponse, rhs: Injective_Ocr_V1beta1_QueryLatestRoundResponse) -> Bool {
    if lhs.latestRoundID != rhs.latestRoundID {return false}
    if lhs._data != rhs._data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryLatestTransmissionDetailsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "feed_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest, rhs: Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest) -> Bool {
    if lhs.feedID != rhs.feedID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryLatestTransmissionDetailsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "config_digest"),
    2: .standard(proto: "epoch_and_round"),
    3: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.configDigest) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._epochAndRound) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._data) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.configDigest.isEmpty {
      try visitor.visitSingularBytesField(value: self.configDigest, fieldNumber: 1)
    }
    try { if let v = self._epochAndRound {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._data {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse, rhs: Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse) -> Bool {
    if lhs.configDigest != rhs.configDigest {return false}
    if lhs._epochAndRound != rhs._epochAndRound {return false}
    if lhs._data != rhs._data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryOwedAmountRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryOwedAmountRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "transmitter"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.transmitter) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.transmitter.isEmpty {
      try visitor.visitSingularStringField(value: self.transmitter, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryOwedAmountRequest, rhs: Injective_Ocr_V1beta1_QueryOwedAmountRequest) -> Bool {
    if lhs.transmitter != rhs.transmitter {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryOwedAmountResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryOwedAmountResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._amount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryOwedAmountResponse, rhs: Injective_Ocr_V1beta1_QueryOwedAmountResponse) -> Bool {
    if lhs._amount != rhs._amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryModuleStateRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryModuleStateRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryModuleStateRequest, rhs: Injective_Ocr_V1beta1_QueryModuleStateRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_QueryModuleStateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryModuleStateResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "state"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._state) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._state {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_QueryModuleStateResponse, rhs: Injective_Ocr_V1beta1_QueryModuleStateResponse) -> Bool {
    if lhs._state != rhs._state {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
