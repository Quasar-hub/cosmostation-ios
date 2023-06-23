// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: osmosis/concentrated-liquidity/genesis.proto
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

/// FullTick contains tick index and pool id along with other tick model
/// information.
struct Osmosis_Concentratedliquidity_V1beta1_FullTick {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// pool id associated with the tick.
  var poolID: UInt64 = 0

  /// tick's index.
  var tickIndex: Int64 = 0

  /// tick's info.
  var info: Osmosis_Concentratedliquidity_V1beta1_TickInfo {
    get {return _info ?? Osmosis_Concentratedliquidity_V1beta1_TickInfo()}
    set {_info = newValue}
  }
  /// Returns true if `info` has been explicitly set.
  var hasInfo: Bool {return self._info != nil}
  /// Clears the value of `info`. Subsequent reads from it will return its default value.
  mutating func clearInfo() {self._info = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _info: Osmosis_Concentratedliquidity_V1beta1_TickInfo? = nil
}

/// PoolData represents a serialized pool along with its ticks
/// for genesis state.
struct Osmosis_Concentratedliquidity_V1beta1_PoolData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// pool struct
  var pool: SwiftProtobuf.Google_Protobuf_Any {
    get {return _pool ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_pool = newValue}
  }
  /// Returns true if `pool` has been explicitly set.
  var hasPool: Bool {return self._pool != nil}
  /// Clears the value of `pool`. Subsequent reads from it will return its default value.
  mutating func clearPool() {self._pool = nil}

  /// pool's ticks
  var ticks: [Osmosis_Concentratedliquidity_V1beta1_FullTick] = []

  var spreadRewardAccumulator: Osmosis_Concentratedliquidity_V1beta1_AccumObject {
    get {return _spreadRewardAccumulator ?? Osmosis_Concentratedliquidity_V1beta1_AccumObject()}
    set {_spreadRewardAccumulator = newValue}
  }
  /// Returns true if `spreadRewardAccumulator` has been explicitly set.
  var hasSpreadRewardAccumulator: Bool {return self._spreadRewardAccumulator != nil}
  /// Clears the value of `spreadRewardAccumulator`. Subsequent reads from it will return its default value.
  mutating func clearSpreadRewardAccumulator() {self._spreadRewardAccumulator = nil}

  var incentivesAccumulators: [Osmosis_Concentratedliquidity_V1beta1_AccumObject] = []

  /// incentive records to be set
  var incentiveRecords: [Osmosis_Concentratedliquidity_V1beta1_IncentiveRecord] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _pool: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _spreadRewardAccumulator: Osmosis_Concentratedliquidity_V1beta1_AccumObject? = nil
}

struct Osmosis_Concentratedliquidity_V1beta1_PositionData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var position: Osmosis_Concentratedliquidity_V1beta1_Position {
    get {return _position ?? Osmosis_Concentratedliquidity_V1beta1_Position()}
    set {_position = newValue}
  }
  /// Returns true if `position` has been explicitly set.
  var hasPosition: Bool {return self._position != nil}
  /// Clears the value of `position`. Subsequent reads from it will return its default value.
  mutating func clearPosition() {self._position = nil}

  var lockID: UInt64 = 0

  var spreadRewardAccumRecord: Osmosis_Accum_V1beta1_Record {
    get {return _spreadRewardAccumRecord ?? Osmosis_Accum_V1beta1_Record()}
    set {_spreadRewardAccumRecord = newValue}
  }
  /// Returns true if `spreadRewardAccumRecord` has been explicitly set.
  var hasSpreadRewardAccumRecord: Bool {return self._spreadRewardAccumRecord != nil}
  /// Clears the value of `spreadRewardAccumRecord`. Subsequent reads from it will return its default value.
  mutating func clearSpreadRewardAccumRecord() {self._spreadRewardAccumRecord = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _position: Osmosis_Concentratedliquidity_V1beta1_Position? = nil
  fileprivate var _spreadRewardAccumRecord: Osmosis_Accum_V1beta1_Record? = nil
}

/// GenesisState defines the concentrated liquidity module's genesis state.
struct Osmosis_Concentratedliquidity_V1beta1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// params are all the parameters of the module
  var params: Osmosis_Concentratedliquidity_Params {
    get {return _params ?? Osmosis_Concentratedliquidity_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  /// pool data containining serialized pool struct and ticks.
  var poolData: [Osmosis_Concentratedliquidity_V1beta1_PoolData] = []

  var positionData: [Osmosis_Concentratedliquidity_V1beta1_PositionData] = []

  var nextPositionID: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Osmosis_Concentratedliquidity_Params? = nil
}

/// In original struct of Accum object, store.KVStore is stored together.
/// For handling genesis, we do not need to include store.KVStore since we use
/// CL module's KVStore.
struct Osmosis_Concentratedliquidity_V1beta1_AccumObject {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Accumulator's name (pulled from AccumulatorContent)
  var name: String = String()

  var accumContent: Osmosis_Accum_V1beta1_AccumulatorContent {
    get {return _accumContent ?? Osmosis_Accum_V1beta1_AccumulatorContent()}
    set {_accumContent = newValue}
  }
  /// Returns true if `accumContent` has been explicitly set.
  var hasAccumContent: Bool {return self._accumContent != nil}
  /// Clears the value of `accumContent`. Subsequent reads from it will return its default value.
  mutating func clearAccumContent() {self._accumContent = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _accumContent: Osmosis_Accum_V1beta1_AccumulatorContent? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Osmosis_Concentratedliquidity_V1beta1_FullTick: @unchecked Sendable {}
extension Osmosis_Concentratedliquidity_V1beta1_PoolData: @unchecked Sendable {}
extension Osmosis_Concentratedliquidity_V1beta1_PositionData: @unchecked Sendable {}
extension Osmosis_Concentratedliquidity_V1beta1_GenesisState: @unchecked Sendable {}
extension Osmosis_Concentratedliquidity_V1beta1_AccumObject: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "osmosis.concentratedliquidity.v1beta1"

extension Osmosis_Concentratedliquidity_V1beta1_FullTick: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FullTick"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "pool_id"),
    2: .standard(proto: "tick_index"),
    3: .same(proto: "info"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.poolID) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.tickIndex) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._info) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.poolID != 0 {
      try visitor.visitSingularUInt64Field(value: self.poolID, fieldNumber: 1)
    }
    if self.tickIndex != 0 {
      try visitor.visitSingularInt64Field(value: self.tickIndex, fieldNumber: 2)
    }
    try { if let v = self._info {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Osmosis_Concentratedliquidity_V1beta1_FullTick, rhs: Osmosis_Concentratedliquidity_V1beta1_FullTick) -> Bool {
    if lhs.poolID != rhs.poolID {return false}
    if lhs.tickIndex != rhs.tickIndex {return false}
    if lhs._info != rhs._info {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Osmosis_Concentratedliquidity_V1beta1_PoolData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PoolData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "pool"),
    2: .same(proto: "ticks"),
    3: .standard(proto: "spread_reward_accumulator"),
    4: .standard(proto: "incentives_accumulators"),
    5: .standard(proto: "incentive_records"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._pool) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.ticks) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._spreadRewardAccumulator) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.incentivesAccumulators) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.incentiveRecords) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._pool {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.ticks.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.ticks, fieldNumber: 2)
    }
    try { if let v = self._spreadRewardAccumulator {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    if !self.incentivesAccumulators.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.incentivesAccumulators, fieldNumber: 4)
    }
    if !self.incentiveRecords.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.incentiveRecords, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Osmosis_Concentratedliquidity_V1beta1_PoolData, rhs: Osmosis_Concentratedliquidity_V1beta1_PoolData) -> Bool {
    if lhs._pool != rhs._pool {return false}
    if lhs.ticks != rhs.ticks {return false}
    if lhs._spreadRewardAccumulator != rhs._spreadRewardAccumulator {return false}
    if lhs.incentivesAccumulators != rhs.incentivesAccumulators {return false}
    if lhs.incentiveRecords != rhs.incentiveRecords {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Osmosis_Concentratedliquidity_V1beta1_PositionData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PositionData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "position"),
    2: .standard(proto: "lock_id"),
    3: .standard(proto: "spread_reward_accum_record"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._position) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.lockID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._spreadRewardAccumRecord) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._position {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if self.lockID != 0 {
      try visitor.visitSingularUInt64Field(value: self.lockID, fieldNumber: 2)
    }
    try { if let v = self._spreadRewardAccumRecord {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Osmosis_Concentratedliquidity_V1beta1_PositionData, rhs: Osmosis_Concentratedliquidity_V1beta1_PositionData) -> Bool {
    if lhs._position != rhs._position {return false}
    if lhs.lockID != rhs.lockID {return false}
    if lhs._spreadRewardAccumRecord != rhs._spreadRewardAccumRecord {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Osmosis_Concentratedliquidity_V1beta1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
    2: .standard(proto: "pool_data"),
    3: .standard(proto: "position_data"),
    4: .standard(proto: "next_position_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.poolData) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.positionData) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.nextPositionID) }()
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
    if !self.poolData.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.poolData, fieldNumber: 2)
    }
    if !self.positionData.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.positionData, fieldNumber: 3)
    }
    if self.nextPositionID != 0 {
      try visitor.visitSingularUInt64Field(value: self.nextPositionID, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Osmosis_Concentratedliquidity_V1beta1_GenesisState, rhs: Osmosis_Concentratedliquidity_V1beta1_GenesisState) -> Bool {
    if lhs._params != rhs._params {return false}
    if lhs.poolData != rhs.poolData {return false}
    if lhs.positionData != rhs.positionData {return false}
    if lhs.nextPositionID != rhs.nextPositionID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Osmosis_Concentratedliquidity_V1beta1_AccumObject: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AccumObject"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .standard(proto: "accum_content"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._accumContent) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    try { if let v = self._accumContent {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Osmosis_Concentratedliquidity_V1beta1_AccumObject, rhs: Osmosis_Concentratedliquidity_V1beta1_AccumObject) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs._accumContent != rhs._accumContent {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
