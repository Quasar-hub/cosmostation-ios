//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/slashing/v1beta1/tx.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Msg defines the slashing Msg service.
///
/// Usage: instantiate `Cosmos_Slashing_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Cosmos_Slashing_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func unjail(
    _ request: Cosmos_Slashing_V1beta1_MsgUnjail,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Slashing_V1beta1_MsgUnjail, Cosmos_Slashing_V1beta1_MsgUnjailResponse>

  func updateParams(
    _ request: Cosmos_Slashing_V1beta1_MsgUpdateParams,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Slashing_V1beta1_MsgUpdateParams, Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse>
}

extension Cosmos_Slashing_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "cosmos.slashing.v1beta1.Msg"
  }

  /// Unjail defines a method for unjailing a jailed validator, thus returning
  /// them into the bonded validator set, so they can begin receiving provisions
  /// and rewards again.
  ///
  /// - Parameters:
  ///   - request: Request to send to Unjail.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func unjail(
    _ request: Cosmos_Slashing_V1beta1_MsgUnjail,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Slashing_V1beta1_MsgUnjail, Cosmos_Slashing_V1beta1_MsgUnjailResponse> {
    return self.makeUnaryCall(
      path: Cosmos_Slashing_V1beta1_MsgClientMetadata.Methods.unjail.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUnjailInterceptors() ?? []
    )
  }

  /// UpdateParams defines a governance operation for updating the x/slashing module
  /// parameters. The authority defaults to the x/gov module account.
  ///
  /// Since: cosmos-sdk 0.47
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateParams.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateParams(
    _ request: Cosmos_Slashing_V1beta1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Slashing_V1beta1_MsgUpdateParams, Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse> {
    return self.makeUnaryCall(
      path: Cosmos_Slashing_V1beta1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Cosmos_Slashing_V1beta1_MsgClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Cosmos_Slashing_V1beta1_MsgNIOClient")
internal final class Cosmos_Slashing_V1beta1_MsgClient: Cosmos_Slashing_V1beta1_MsgClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the cosmos.slashing.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Cosmos_Slashing_V1beta1_MsgNIOClient: Cosmos_Slashing_V1beta1_MsgClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the cosmos.slashing.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the slashing Msg service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Cosmos_Slashing_V1beta1_MsgAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func makeUnjailCall(
    _ request: Cosmos_Slashing_V1beta1_MsgUnjail,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Cosmos_Slashing_V1beta1_MsgUnjail, Cosmos_Slashing_V1beta1_MsgUnjailResponse>

  func makeUpdateParamsCall(
    _ request: Cosmos_Slashing_V1beta1_MsgUpdateParams,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Cosmos_Slashing_V1beta1_MsgUpdateParams, Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Cosmos_Slashing_V1beta1_MsgAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Cosmos_Slashing_V1beta1_MsgClientMetadata.serviceDescriptor
  }

  internal var interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeUnjailCall(
    _ request: Cosmos_Slashing_V1beta1_MsgUnjail,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Cosmos_Slashing_V1beta1_MsgUnjail, Cosmos_Slashing_V1beta1_MsgUnjailResponse> {
    return self.makeAsyncUnaryCall(
      path: Cosmos_Slashing_V1beta1_MsgClientMetadata.Methods.unjail.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUnjailInterceptors() ?? []
    )
  }

  internal func makeUpdateParamsCall(
    _ request: Cosmos_Slashing_V1beta1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Cosmos_Slashing_V1beta1_MsgUpdateParams, Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse> {
    return self.makeAsyncUnaryCall(
      path: Cosmos_Slashing_V1beta1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Cosmos_Slashing_V1beta1_MsgAsyncClientProtocol {
  internal func unjail(
    _ request: Cosmos_Slashing_V1beta1_MsgUnjail,
    callOptions: CallOptions? = nil
  ) async throws -> Cosmos_Slashing_V1beta1_MsgUnjailResponse {
    return try await self.performAsyncUnaryCall(
      path: Cosmos_Slashing_V1beta1_MsgClientMetadata.Methods.unjail.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUnjailInterceptors() ?? []
    )
  }

  internal func updateParams(
    _ request: Cosmos_Slashing_V1beta1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) async throws -> Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse {
    return try await self.performAsyncUnaryCall(
      path: Cosmos_Slashing_V1beta1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Cosmos_Slashing_V1beta1_MsgAsyncClient: Cosmos_Slashing_V1beta1_MsgAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Cosmos_Slashing_V1beta1_MsgClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'unjail'.
  func makeUnjailInterceptors() -> [ClientInterceptor<Cosmos_Slashing_V1beta1_MsgUnjail, Cosmos_Slashing_V1beta1_MsgUnjailResponse>]

  /// - Returns: Interceptors to use when invoking 'updateParams'.
  func makeUpdateParamsInterceptors() -> [ClientInterceptor<Cosmos_Slashing_V1beta1_MsgUpdateParams, Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse>]
}

internal enum Cosmos_Slashing_V1beta1_MsgClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "cosmos.slashing.v1beta1.Msg",
    methods: [
      Cosmos_Slashing_V1beta1_MsgClientMetadata.Methods.unjail,
      Cosmos_Slashing_V1beta1_MsgClientMetadata.Methods.updateParams,
    ]
  )

  internal enum Methods {
    internal static let unjail = GRPCMethodDescriptor(
      name: "Unjail",
      path: "/cosmos.slashing.v1beta1.Msg/Unjail",
      type: GRPCCallType.unary
    )

    internal static let updateParams = GRPCMethodDescriptor(
      name: "UpdateParams",
      path: "/cosmos.slashing.v1beta1.Msg/UpdateParams",
      type: GRPCCallType.unary
    )
  }
}

/// Msg defines the slashing Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Cosmos_Slashing_V1beta1_MsgProvider: CallHandlerProvider {
  var interceptors: Cosmos_Slashing_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// Unjail defines a method for unjailing a jailed validator, thus returning
  /// them into the bonded validator set, so they can begin receiving provisions
  /// and rewards again.
  func unjail(request: Cosmos_Slashing_V1beta1_MsgUnjail, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Slashing_V1beta1_MsgUnjailResponse>

  /// UpdateParams defines a governance operation for updating the x/slashing module
  /// parameters. The authority defaults to the x/gov module account.
  ///
  /// Since: cosmos-sdk 0.47
  func updateParams(request: Cosmos_Slashing_V1beta1_MsgUpdateParams, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse>
}

extension Cosmos_Slashing_V1beta1_MsgProvider {
  internal var serviceName: Substring {
    return Cosmos_Slashing_V1beta1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Unjail":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Cosmos_Slashing_V1beta1_MsgUnjail>(),
        responseSerializer: ProtobufSerializer<Cosmos_Slashing_V1beta1_MsgUnjailResponse>(),
        interceptors: self.interceptors?.makeUnjailInterceptors() ?? [],
        userFunction: self.unjail(request:context:)
      )

    case "UpdateParams":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Cosmos_Slashing_V1beta1_MsgUpdateParams>(),
        responseSerializer: ProtobufSerializer<Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse>(),
        interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? [],
        userFunction: self.updateParams(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Msg defines the slashing Msg service.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Cosmos_Slashing_V1beta1_MsgAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Cosmos_Slashing_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// Unjail defines a method for unjailing a jailed validator, thus returning
  /// them into the bonded validator set, so they can begin receiving provisions
  /// and rewards again.
  @Sendable func unjail(
    request: Cosmos_Slashing_V1beta1_MsgUnjail,
    context: GRPCAsyncServerCallContext
  ) async throws -> Cosmos_Slashing_V1beta1_MsgUnjailResponse

  /// UpdateParams defines a governance operation for updating the x/slashing module
  /// parameters. The authority defaults to the x/gov module account.
  ///
  /// Since: cosmos-sdk 0.47
  @Sendable func updateParams(
    request: Cosmos_Slashing_V1beta1_MsgUpdateParams,
    context: GRPCAsyncServerCallContext
  ) async throws -> Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Cosmos_Slashing_V1beta1_MsgAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Cosmos_Slashing_V1beta1_MsgServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Cosmos_Slashing_V1beta1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Cosmos_Slashing_V1beta1_MsgServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Unjail":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Cosmos_Slashing_V1beta1_MsgUnjail>(),
        responseSerializer: ProtobufSerializer<Cosmos_Slashing_V1beta1_MsgUnjailResponse>(),
        interceptors: self.interceptors?.makeUnjailInterceptors() ?? [],
        wrapping: self.unjail(request:context:)
      )

    case "UpdateParams":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Cosmos_Slashing_V1beta1_MsgUpdateParams>(),
        responseSerializer: ProtobufSerializer<Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse>(),
        interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? [],
        wrapping: self.updateParams(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Cosmos_Slashing_V1beta1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'unjail'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUnjailInterceptors() -> [ServerInterceptor<Cosmos_Slashing_V1beta1_MsgUnjail, Cosmos_Slashing_V1beta1_MsgUnjailResponse>]

  /// - Returns: Interceptors to use when handling 'updateParams'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateParamsInterceptors() -> [ServerInterceptor<Cosmos_Slashing_V1beta1_MsgUpdateParams, Cosmos_Slashing_V1beta1_MsgUpdateParamsResponse>]
}

internal enum Cosmos_Slashing_V1beta1_MsgServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "cosmos.slashing.v1beta1.Msg",
    methods: [
      Cosmos_Slashing_V1beta1_MsgServerMetadata.Methods.unjail,
      Cosmos_Slashing_V1beta1_MsgServerMetadata.Methods.updateParams,
    ]
  )

  internal enum Methods {
    internal static let unjail = GRPCMethodDescriptor(
      name: "Unjail",
      path: "/cosmos.slashing.v1beta1.Msg/Unjail",
      type: GRPCCallType.unary
    )

    internal static let updateParams = GRPCMethodDescriptor(
      name: "UpdateParams",
      path: "/cosmos.slashing.v1beta1.Msg/UpdateParams",
      type: GRPCCallType.unary
    )
  }
}