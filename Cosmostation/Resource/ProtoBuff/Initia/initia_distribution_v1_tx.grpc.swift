//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: initia/distribution/v1/tx.proto
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


/// Msg defines the distribution Msg service.
///
/// Usage: instantiate `Initia_Distribution_V1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Initia_Distribution_V1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol? { get }

  func updateParams(
    _ request: Initia_Distribution_V1_MsgUpdateParams,
    callOptions: CallOptions?
  ) -> UnaryCall<Initia_Distribution_V1_MsgUpdateParams, Initia_Distribution_V1_MsgUpdateParamsResponse>

  func depositValidatorRewardsPool(
    _ request: Initia_Distribution_V1_MsgDepositValidatorRewardsPool,
    callOptions: CallOptions?
  ) -> UnaryCall<Initia_Distribution_V1_MsgDepositValidatorRewardsPool, Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse>
}

extension Initia_Distribution_V1_MsgClientProtocol {
  internal var serviceName: String {
    return "initia.distribution.v1.Msg"
  }

  /// UpdateParams defines a governance operation for updating the x/distribution
  /// module parameters. The authority is defined in the keeper.
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateParams.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateParams(
    _ request: Initia_Distribution_V1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Initia_Distribution_V1_MsgUpdateParams, Initia_Distribution_V1_MsgUpdateParamsResponse> {
    return self.makeUnaryCall(
      path: Initia_Distribution_V1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }

  /// DepositValidatorRewardsPool defines a method to provide additional rewards
  /// to delegators to a specific validator.
  ///
  /// - Parameters:
  ///   - request: Request to send to DepositValidatorRewardsPool.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func depositValidatorRewardsPool(
    _ request: Initia_Distribution_V1_MsgDepositValidatorRewardsPool,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Initia_Distribution_V1_MsgDepositValidatorRewardsPool, Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse> {
    return self.makeUnaryCall(
      path: Initia_Distribution_V1_MsgClientMetadata.Methods.depositValidatorRewardsPool.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDepositValidatorRewardsPoolInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Initia_Distribution_V1_MsgClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Initia_Distribution_V1_MsgNIOClient")
internal final class Initia_Distribution_V1_MsgClient: Initia_Distribution_V1_MsgClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the initia.distribution.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Initia_Distribution_V1_MsgNIOClient: Initia_Distribution_V1_MsgClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the initia.distribution.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the distribution Msg service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Initia_Distribution_V1_MsgAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol? { get }

  func makeUpdateParamsCall(
    _ request: Initia_Distribution_V1_MsgUpdateParams,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Initia_Distribution_V1_MsgUpdateParams, Initia_Distribution_V1_MsgUpdateParamsResponse>

  func makeDepositValidatorRewardsPoolCall(
    _ request: Initia_Distribution_V1_MsgDepositValidatorRewardsPool,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Initia_Distribution_V1_MsgDepositValidatorRewardsPool, Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Initia_Distribution_V1_MsgAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Initia_Distribution_V1_MsgClientMetadata.serviceDescriptor
  }

  internal var interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeUpdateParamsCall(
    _ request: Initia_Distribution_V1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Initia_Distribution_V1_MsgUpdateParams, Initia_Distribution_V1_MsgUpdateParamsResponse> {
    return self.makeAsyncUnaryCall(
      path: Initia_Distribution_V1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }

  internal func makeDepositValidatorRewardsPoolCall(
    _ request: Initia_Distribution_V1_MsgDepositValidatorRewardsPool,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Initia_Distribution_V1_MsgDepositValidatorRewardsPool, Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse> {
    return self.makeAsyncUnaryCall(
      path: Initia_Distribution_V1_MsgClientMetadata.Methods.depositValidatorRewardsPool.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDepositValidatorRewardsPoolInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Initia_Distribution_V1_MsgAsyncClientProtocol {
  internal func updateParams(
    _ request: Initia_Distribution_V1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) async throws -> Initia_Distribution_V1_MsgUpdateParamsResponse {
    return try await self.performAsyncUnaryCall(
      path: Initia_Distribution_V1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }

  internal func depositValidatorRewardsPool(
    _ request: Initia_Distribution_V1_MsgDepositValidatorRewardsPool,
    callOptions: CallOptions? = nil
  ) async throws -> Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse {
    return try await self.performAsyncUnaryCall(
      path: Initia_Distribution_V1_MsgClientMetadata.Methods.depositValidatorRewardsPool.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDepositValidatorRewardsPoolInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Initia_Distribution_V1_MsgAsyncClient: Initia_Distribution_V1_MsgAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Initia_Distribution_V1_MsgClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'updateParams'.
  func makeUpdateParamsInterceptors() -> [ClientInterceptor<Initia_Distribution_V1_MsgUpdateParams, Initia_Distribution_V1_MsgUpdateParamsResponse>]

  /// - Returns: Interceptors to use when invoking 'depositValidatorRewardsPool'.
  func makeDepositValidatorRewardsPoolInterceptors() -> [ClientInterceptor<Initia_Distribution_V1_MsgDepositValidatorRewardsPool, Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse>]
}

internal enum Initia_Distribution_V1_MsgClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "initia.distribution.v1.Msg",
    methods: [
      Initia_Distribution_V1_MsgClientMetadata.Methods.updateParams,
      Initia_Distribution_V1_MsgClientMetadata.Methods.depositValidatorRewardsPool,
    ]
  )

  internal enum Methods {
    internal static let updateParams = GRPCMethodDescriptor(
      name: "UpdateParams",
      path: "/initia.distribution.v1.Msg/UpdateParams",
      type: GRPCCallType.unary
    )

    internal static let depositValidatorRewardsPool = GRPCMethodDescriptor(
      name: "DepositValidatorRewardsPool",
      path: "/initia.distribution.v1.Msg/DepositValidatorRewardsPool",
      type: GRPCCallType.unary
    )
  }
}

/// Msg defines the distribution Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Initia_Distribution_V1_MsgProvider: CallHandlerProvider {
  var interceptors: Initia_Distribution_V1_MsgServerInterceptorFactoryProtocol? { get }

  /// UpdateParams defines a governance operation for updating the x/distribution
  /// module parameters. The authority is defined in the keeper.
  func updateParams(request: Initia_Distribution_V1_MsgUpdateParams, context: StatusOnlyCallContext) -> EventLoopFuture<Initia_Distribution_V1_MsgUpdateParamsResponse>

  /// DepositValidatorRewardsPool defines a method to provide additional rewards
  /// to delegators to a specific validator.
  func depositValidatorRewardsPool(request: Initia_Distribution_V1_MsgDepositValidatorRewardsPool, context: StatusOnlyCallContext) -> EventLoopFuture<Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse>
}

extension Initia_Distribution_V1_MsgProvider {
  internal var serviceName: Substring {
    return Initia_Distribution_V1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "UpdateParams":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Initia_Distribution_V1_MsgUpdateParams>(),
        responseSerializer: ProtobufSerializer<Initia_Distribution_V1_MsgUpdateParamsResponse>(),
        interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? [],
        userFunction: self.updateParams(request:context:)
      )

    case "DepositValidatorRewardsPool":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Initia_Distribution_V1_MsgDepositValidatorRewardsPool>(),
        responseSerializer: ProtobufSerializer<Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse>(),
        interceptors: self.interceptors?.makeDepositValidatorRewardsPoolInterceptors() ?? [],
        userFunction: self.depositValidatorRewardsPool(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Msg defines the distribution Msg service.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Initia_Distribution_V1_MsgAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Initia_Distribution_V1_MsgServerInterceptorFactoryProtocol? { get }

  /// UpdateParams defines a governance operation for updating the x/distribution
  /// module parameters. The authority is defined in the keeper.
  @Sendable func updateParams(
    request: Initia_Distribution_V1_MsgUpdateParams,
    context: GRPCAsyncServerCallContext
  ) async throws -> Initia_Distribution_V1_MsgUpdateParamsResponse

  /// DepositValidatorRewardsPool defines a method to provide additional rewards
  /// to delegators to a specific validator.
  @Sendable func depositValidatorRewardsPool(
    request: Initia_Distribution_V1_MsgDepositValidatorRewardsPool,
    context: GRPCAsyncServerCallContext
  ) async throws -> Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Initia_Distribution_V1_MsgAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Initia_Distribution_V1_MsgServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Initia_Distribution_V1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Initia_Distribution_V1_MsgServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "UpdateParams":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Initia_Distribution_V1_MsgUpdateParams>(),
        responseSerializer: ProtobufSerializer<Initia_Distribution_V1_MsgUpdateParamsResponse>(),
        interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? [],
        wrapping: self.updateParams(request:context:)
      )

    case "DepositValidatorRewardsPool":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Initia_Distribution_V1_MsgDepositValidatorRewardsPool>(),
        responseSerializer: ProtobufSerializer<Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse>(),
        interceptors: self.interceptors?.makeDepositValidatorRewardsPoolInterceptors() ?? [],
        wrapping: self.depositValidatorRewardsPool(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Initia_Distribution_V1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'updateParams'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateParamsInterceptors() -> [ServerInterceptor<Initia_Distribution_V1_MsgUpdateParams, Initia_Distribution_V1_MsgUpdateParamsResponse>]

  /// - Returns: Interceptors to use when handling 'depositValidatorRewardsPool'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDepositValidatorRewardsPoolInterceptors() -> [ServerInterceptor<Initia_Distribution_V1_MsgDepositValidatorRewardsPool, Initia_Distribution_V1_MsgDepositValidatorRewardsPoolResponse>]
}

internal enum Initia_Distribution_V1_MsgServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "initia.distribution.v1.Msg",
    methods: [
      Initia_Distribution_V1_MsgServerMetadata.Methods.updateParams,
      Initia_Distribution_V1_MsgServerMetadata.Methods.depositValidatorRewardsPool,
    ]
  )

  internal enum Methods {
    internal static let updateParams = GRPCMethodDescriptor(
      name: "UpdateParams",
      path: "/initia.distribution.v1.Msg/UpdateParams",
      type: GRPCCallType.unary
    )

    internal static let depositValidatorRewardsPool = GRPCMethodDescriptor(
      name: "DepositValidatorRewardsPool",
      path: "/initia.distribution.v1.Msg/DepositValidatorRewardsPool",
      type: GRPCCallType.unary
    )
  }
}
