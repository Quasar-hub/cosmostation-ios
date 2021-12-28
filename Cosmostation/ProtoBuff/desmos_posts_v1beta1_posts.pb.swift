// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/posts/v1beta1/posts.proto
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

/// CommentsState contains all the possible comments states
enum Desmos_Posts_V1beta1_CommentsState: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// COMMENTS_STATE_UNSPECIFIED
  case unspecified // = 0

  /// COMMENT_STATE_ALLOWED tells that's possible to comment a post
  case allowed // = 1

  /// COMMENT_STATE_BLOCKED tells that's not possible to comment a post
  case blocked // = 2
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .allowed
    case 2: self = .blocked
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .allowed: return 1
    case .blocked: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Desmos_Posts_V1beta1_CommentsState: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Desmos_Posts_V1beta1_CommentsState] = [
    .unspecified,
    .allowed,
    .blocked,
  ]
}

#endif  // swift(>=4.2)

/// Post contains all the data of a Desmos post
struct Desmos_Posts_V1beta1_Post {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var postID: String {
    get {return _storage._postID}
    set {_uniqueStorage()._postID = newValue}
  }

  var parentID: String {
    get {return _storage._parentID}
    set {_uniqueStorage()._parentID = newValue}
  }

  var message: String {
    get {return _storage._message}
    set {_uniqueStorage()._message = newValue}
  }

  var created: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._created ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._created = newValue}
  }
  /// Returns true if `created` has been explicitly set.
  var hasCreated: Bool {return _storage._created != nil}
  /// Clears the value of `created`. Subsequent reads from it will return its default value.
  mutating func clearCreated() {_uniqueStorage()._created = nil}

  var lastEdited: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._lastEdited ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._lastEdited = newValue}
  }
  /// Returns true if `lastEdited` has been explicitly set.
  var hasLastEdited: Bool {return _storage._lastEdited != nil}
  /// Clears the value of `lastEdited`. Subsequent reads from it will return its default value.
  mutating func clearLastEdited() {_uniqueStorage()._lastEdited = nil}

  var commentsState: Desmos_Posts_V1beta1_CommentsState {
    get {return _storage._commentsState}
    set {_uniqueStorage()._commentsState = newValue}
  }

  var subspace: String {
    get {return _storage._subspace}
    set {_uniqueStorage()._subspace = newValue}
  }

  var additionalAttributes: [Desmos_Posts_V1beta1_Attribute] {
    get {return _storage._additionalAttributes}
    set {_uniqueStorage()._additionalAttributes = newValue}
  }

  var creator: String {
    get {return _storage._creator}
    set {_uniqueStorage()._creator = newValue}
  }

  var attachments: [Desmos_Posts_V1beta1_Attachment] {
    get {return _storage._attachments}
    set {_uniqueStorage()._attachments = newValue}
  }

  var poll: Desmos_Posts_V1beta1_Poll {
    get {return _storage._poll ?? Desmos_Posts_V1beta1_Poll()}
    set {_uniqueStorage()._poll = newValue}
  }
  /// Returns true if `poll` has been explicitly set.
  var hasPoll: Bool {return _storage._poll != nil}
  /// Clears the value of `poll`. Subsequent reads from it will return its default value.
  mutating func clearPoll() {_uniqueStorage()._poll = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Attachment contains the information representing any type of file provided
/// with a post. This file can be an image or a multimedia file (vocals, video,
/// documents, etc.).
struct Desmos_Posts_V1beta1_Attachment {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var uri: String = String()

  var mimeType: String = String()

  var tags: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Attribute represents a Posts' optional data entry and allows for
/// custom Amino and JSON serialization and deserialization.
struct Desmos_Posts_V1beta1_Attribute {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var key: String = String()

  var value: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.posts.v1beta1"

extension Desmos_Posts_V1beta1_CommentsState: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "COMMENTS_STATE_UNSPECIFIED"),
    1: .same(proto: "COMMENTS_STATE_ALLOWED"),
    2: .same(proto: "COMMENTS_STATE_BLOCKED"),
  ]
}

extension Desmos_Posts_V1beta1_Post: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Post"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "post_id"),
    2: .standard(proto: "parent_id"),
    3: .same(proto: "message"),
    4: .same(proto: "created"),
    5: .standard(proto: "last_edited"),
    6: .standard(proto: "comments_state"),
    7: .same(proto: "subspace"),
    8: .standard(proto: "additional_attributes"),
    9: .same(proto: "creator"),
    10: .same(proto: "attachments"),
    11: .same(proto: "poll"),
  ]

  fileprivate class _StorageClass {
    var _postID: String = String()
    var _parentID: String = String()
    var _message: String = String()
    var _created: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _lastEdited: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _commentsState: Desmos_Posts_V1beta1_CommentsState = .unspecified
    var _subspace: String = String()
    var _additionalAttributes: [Desmos_Posts_V1beta1_Attribute] = []
    var _creator: String = String()
    var _attachments: [Desmos_Posts_V1beta1_Attachment] = []
    var _poll: Desmos_Posts_V1beta1_Poll? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _postID = source._postID
      _parentID = source._parentID
      _message = source._message
      _created = source._created
      _lastEdited = source._lastEdited
      _commentsState = source._commentsState
      _subspace = source._subspace
      _additionalAttributes = source._additionalAttributes
      _creator = source._creator
      _attachments = source._attachments
      _poll = source._poll
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
        case 1: try { try decoder.decodeSingularStringField(value: &_storage._postID) }()
        case 2: try { try decoder.decodeSingularStringField(value: &_storage._parentID) }()
        case 3: try { try decoder.decodeSingularStringField(value: &_storage._message) }()
        case 4: try { try decoder.decodeSingularMessageField(value: &_storage._created) }()
        case 5: try { try decoder.decodeSingularMessageField(value: &_storage._lastEdited) }()
        case 6: try { try decoder.decodeSingularEnumField(value: &_storage._commentsState) }()
        case 7: try { try decoder.decodeSingularStringField(value: &_storage._subspace) }()
        case 8: try { try decoder.decodeRepeatedMessageField(value: &_storage._additionalAttributes) }()
        case 9: try { try decoder.decodeSingularStringField(value: &_storage._creator) }()
        case 10: try { try decoder.decodeRepeatedMessageField(value: &_storage._attachments) }()
        case 11: try { try decoder.decodeSingularMessageField(value: &_storage._poll) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._postID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._postID, fieldNumber: 1)
      }
      if !_storage._parentID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._parentID, fieldNumber: 2)
      }
      if !_storage._message.isEmpty {
        try visitor.visitSingularStringField(value: _storage._message, fieldNumber: 3)
      }
      if let v = _storage._created {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._lastEdited {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if _storage._commentsState != .unspecified {
        try visitor.visitSingularEnumField(value: _storage._commentsState, fieldNumber: 6)
      }
      if !_storage._subspace.isEmpty {
        try visitor.visitSingularStringField(value: _storage._subspace, fieldNumber: 7)
      }
      if !_storage._additionalAttributes.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._additionalAttributes, fieldNumber: 8)
      }
      if !_storage._creator.isEmpty {
        try visitor.visitSingularStringField(value: _storage._creator, fieldNumber: 9)
      }
      if !_storage._attachments.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._attachments, fieldNumber: 10)
      }
      if let v = _storage._poll {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Posts_V1beta1_Post, rhs: Desmos_Posts_V1beta1_Post) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._postID != rhs_storage._postID {return false}
        if _storage._parentID != rhs_storage._parentID {return false}
        if _storage._message != rhs_storage._message {return false}
        if _storage._created != rhs_storage._created {return false}
        if _storage._lastEdited != rhs_storage._lastEdited {return false}
        if _storage._commentsState != rhs_storage._commentsState {return false}
        if _storage._subspace != rhs_storage._subspace {return false}
        if _storage._additionalAttributes != rhs_storage._additionalAttributes {return false}
        if _storage._creator != rhs_storage._creator {return false}
        if _storage._attachments != rhs_storage._attachments {return false}
        if _storage._poll != rhs_storage._poll {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Posts_V1beta1_Attachment: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Attachment"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uri"),
    2: .standard(proto: "mime_type"),
    3: .same(proto: "tags"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.uri) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.mimeType) }()
      case 3: try { try decoder.decodeRepeatedStringField(value: &self.tags) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.uri.isEmpty {
      try visitor.visitSingularStringField(value: self.uri, fieldNumber: 1)
    }
    if !self.mimeType.isEmpty {
      try visitor.visitSingularStringField(value: self.mimeType, fieldNumber: 2)
    }
    if !self.tags.isEmpty {
      try visitor.visitRepeatedStringField(value: self.tags, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Posts_V1beta1_Attachment, rhs: Desmos_Posts_V1beta1_Attachment) -> Bool {
    if lhs.uri != rhs.uri {return false}
    if lhs.mimeType != rhs.mimeType {return false}
    if lhs.tags != rhs.tags {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Posts_V1beta1_Attribute: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Attribute"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.key) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.value) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.key.isEmpty {
      try visitor.visitSingularStringField(value: self.key, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Posts_V1beta1_Attribute, rhs: Desmos_Posts_V1beta1_Attribute) -> Bool {
    if lhs.key != rhs.key {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}