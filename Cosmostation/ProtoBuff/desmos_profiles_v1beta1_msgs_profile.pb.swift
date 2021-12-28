// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/profiles/v1beta1/msgs_profile.proto
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

/// MsgSaveProfile represents a message to save a profile.
struct Desmos_Profiles_V1beta1_MsgSaveProfile {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var dtag: String = String()

  var nickname: String = String()

  var bio: String = String()

  var profilePicture: String = String()

  var coverPicture: String = String()

  var creator: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgSaveProfileResponse defines the Msg/SaveProfile response type.
struct Desmos_Profiles_V1beta1_MsgSaveProfileResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgDeleteProfile represents the message used to delete an existing profile.
struct Desmos_Profiles_V1beta1_MsgDeleteProfile {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var creator: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgDeleteProfileResponse defines the Msg/DeleteProfile response type.
struct Desmos_Profiles_V1beta1_MsgDeleteProfileResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.profiles.v1beta1"

extension Desmos_Profiles_V1beta1_MsgSaveProfile: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSaveProfile"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "dtag"),
    2: .same(proto: "nickname"),
    3: .same(proto: "bio"),
    4: .standard(proto: "profile_picture"),
    5: .standard(proto: "cover_picture"),
    6: .same(proto: "creator"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.dtag) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.nickname) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.bio) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.profilePicture) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.coverPicture) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.creator) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.dtag.isEmpty {
      try visitor.visitSingularStringField(value: self.dtag, fieldNumber: 1)
    }
    if !self.nickname.isEmpty {
      try visitor.visitSingularStringField(value: self.nickname, fieldNumber: 2)
    }
    if !self.bio.isEmpty {
      try visitor.visitSingularStringField(value: self.bio, fieldNumber: 3)
    }
    if !self.profilePicture.isEmpty {
      try visitor.visitSingularStringField(value: self.profilePicture, fieldNumber: 4)
    }
    if !self.coverPicture.isEmpty {
      try visitor.visitSingularStringField(value: self.coverPicture, fieldNumber: 5)
    }
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_MsgSaveProfile, rhs: Desmos_Profiles_V1beta1_MsgSaveProfile) -> Bool {
    if lhs.dtag != rhs.dtag {return false}
    if lhs.nickname != rhs.nickname {return false}
    if lhs.bio != rhs.bio {return false}
    if lhs.profilePicture != rhs.profilePicture {return false}
    if lhs.coverPicture != rhs.coverPicture {return false}
    if lhs.creator != rhs.creator {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V1beta1_MsgSaveProfileResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSaveProfileResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_MsgSaveProfileResponse, rhs: Desmos_Profiles_V1beta1_MsgSaveProfileResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V1beta1_MsgDeleteProfile: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgDeleteProfile"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "creator"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.creator) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_MsgDeleteProfile, rhs: Desmos_Profiles_V1beta1_MsgDeleteProfile) -> Bool {
    if lhs.creator != rhs.creator {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V1beta1_MsgDeleteProfileResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgDeleteProfileResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_MsgDeleteProfileResponse, rhs: Desmos_Profiles_V1beta1_MsgDeleteProfileResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}