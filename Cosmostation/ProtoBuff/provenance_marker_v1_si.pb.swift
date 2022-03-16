// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: provenance/marker/v1/si.proto
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

/// SIPrefix represents an International System of Units (SI) Prefix.
enum Provenance_Marker_V1_SIPrefix: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// 10^0    (none)
  case none // = 0

  /// 10^1    deka   da
  case deka // = 1

  /// 10^2    hecto   h
  case hecto // = 2

  /// 10^3    kilo    k
  case kilo // = 3

  /// 10^6    mega    M
  case mega // = 6

  /// 10^9    giga    G
  case giga // = 9

  /// 10^12   tera    T
  case tera // = 12

  /// 10^15   peta    P
  case peta // = 15

  /// 10^18   exa     E
  case exa // = 18

  /// 10^21   zetta   Z
  case zetta // = 21

  /// 10^24   yotta   Y
  case yotta // = 24

  /// 10^-1   deci    d
  case deci // = -1

  /// 10^-2   centi   c
  case centi // = -2

  /// 10^-3   milli   m
  case milli // = -3

  /// 10^-6   micro   µ
  case micro // = -6

  /// 10^-9   nano    n
  case nano // = -9

  /// 10^-12  pico    p
  case pico // = -12

  /// 10^-15  femto   f
  case femto // = -15

  /// 10^-18  atto    a
  case atto // = -18

  /// 10^-21  zepto   z
  case zepto // = -21

  /// 10^-24  yocto   y
  case yocto // = -24
  case UNRECOGNIZED(Int)

  init() {
    self = .none
  }

  init?(rawValue: Int) {
    switch rawValue {
    case -24: self = .yocto
    case -21: self = .zepto
    case -18: self = .atto
    case -15: self = .femto
    case -12: self = .pico
    case -9: self = .nano
    case -6: self = .micro
    case -3: self = .milli
    case -2: self = .centi
    case -1: self = .deci
    case 0: self = .none
    case 1: self = .deka
    case 2: self = .hecto
    case 3: self = .kilo
    case 6: self = .mega
    case 9: self = .giga
    case 12: self = .tera
    case 15: self = .peta
    case 18: self = .exa
    case 21: self = .zetta
    case 24: self = .yotta
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .yocto: return -24
    case .zepto: return -21
    case .atto: return -18
    case .femto: return -15
    case .pico: return -12
    case .nano: return -9
    case .micro: return -6
    case .milli: return -3
    case .centi: return -2
    case .deci: return -1
    case .none: return 0
    case .deka: return 1
    case .hecto: return 2
    case .kilo: return 3
    case .mega: return 6
    case .giga: return 9
    case .tera: return 12
    case .peta: return 15
    case .exa: return 18
    case .zetta: return 21
    case .yotta: return 24
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Provenance_Marker_V1_SIPrefix: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Provenance_Marker_V1_SIPrefix] = [
    .none,
    .deka,
    .hecto,
    .kilo,
    .mega,
    .giga,
    .tera,
    .peta,
    .exa,
    .zetta,
    .yotta,
    .deci,
    .centi,
    .milli,
    .micro,
    .nano,
    .pico,
    .femto,
    .atto,
    .zepto,
    .yocto,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Provenance_Marker_V1_SIPrefix: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    -24: .same(proto: "SI_PREFIX_YOCTO"),
    -21: .same(proto: "SI_PREFIX_ZEPTO"),
    -18: .same(proto: "SI_PREFIX_ATTO"),
    -15: .same(proto: "SI_PREFIX_FEMTO"),
    -12: .same(proto: "SI_PREFIX_PICO"),
    -9: .same(proto: "SI_PREFIX_NANO"),
    -6: .same(proto: "SI_PREFIX_MICRO"),
    -3: .same(proto: "SI_PREFIX_MILLI"),
    -2: .same(proto: "SI_PREFIX_CENTI"),
    -1: .same(proto: "SI_PREFIX_DECI"),
    0: .same(proto: "SI_PREFIX_NONE"),
    1: .same(proto: "SI_PREFIX_DEKA"),
    2: .same(proto: "SI_PREFIX_HECTO"),
    3: .same(proto: "SI_PREFIX_KILO"),
    6: .same(proto: "SI_PREFIX_MEGA"),
    9: .same(proto: "SI_PREFIX_GIGA"),
    12: .same(proto: "SI_PREFIX_TERA"),
    15: .same(proto: "SI_PREFIX_PETA"),
    18: .same(proto: "SI_PREFIX_EXA"),
    21: .same(proto: "SI_PREFIX_ZETTA"),
    24: .same(proto: "SI_PREFIX_YOTTA"),
  ]
}