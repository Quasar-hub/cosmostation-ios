//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cryptoorg/supply/v1/query.proto
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


/// Query defines the gRPC querier service.
///
/// Usage: instantiate `Chainmain_Supply_V1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Chainmain_Supply_V1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol? { get }

  func totalSupply(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse>

  func liquidSupply(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse>
}

extension Chainmain_Supply_V1_QueryClientProtocol {
  internal var serviceName: String {
    return "chainmain.supply.v1.Query"
  }

  /// TotalSupply queries the total supply of all coins.
  ///
  /// - Parameters:
  ///   - request: Request to send to TotalSupply.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func totalSupply(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse> {
    return self.makeUnaryCall(
      path: Chainmain_Supply_V1_QueryClientMetadata.Methods.totalSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? []
    )
  }

  /// LiquidSupply queries the liquid supply of all coins.
  ///
  /// - Parameters:
  ///   - request: Request to send to LiquidSupply.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func liquidSupply(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse> {
    return self.makeUnaryCall(
      path: Chainmain_Supply_V1_QueryClientMetadata.Methods.liquidSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidSupplyInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Chainmain_Supply_V1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Chainmain_Supply_V1_QueryNIOClient")
internal final class Chainmain_Supply_V1_QueryClient: Chainmain_Supply_V1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the chainmain.supply.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Chainmain_Supply_V1_QueryNIOClient: Chainmain_Supply_V1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the chainmain.supply.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Chainmain_Supply_V1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol? { get }

  func makeTotalSupplyCall(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse>

  func makeLiquidSupplyCall(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Chainmain_Supply_V1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Chainmain_Supply_V1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeTotalSupplyCall(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse> {
    return self.makeAsyncUnaryCall(
      path: Chainmain_Supply_V1_QueryClientMetadata.Methods.totalSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? []
    )
  }

  internal func makeLiquidSupplyCall(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse> {
    return self.makeAsyncUnaryCall(
      path: Chainmain_Supply_V1_QueryClientMetadata.Methods.liquidSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidSupplyInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Chainmain_Supply_V1_QueryAsyncClientProtocol {
  internal func totalSupply(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Chainmain_Supply_V1_SupplyResponse {
    return try await self.performAsyncUnaryCall(
      path: Chainmain_Supply_V1_QueryClientMetadata.Methods.totalSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? []
    )
  }

  internal func liquidSupply(
    _ request: Chainmain_Supply_V1_SupplyRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Chainmain_Supply_V1_SupplyResponse {
    return try await self.performAsyncUnaryCall(
      path: Chainmain_Supply_V1_QueryClientMetadata.Methods.liquidSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidSupplyInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Chainmain_Supply_V1_QueryAsyncClient: Chainmain_Supply_V1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Chainmain_Supply_V1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'totalSupply'.
  func makeTotalSupplyInterceptors() -> [ClientInterceptor<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse>]

  /// - Returns: Interceptors to use when invoking 'liquidSupply'.
  func makeLiquidSupplyInterceptors() -> [ClientInterceptor<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse>]
}

internal enum Chainmain_Supply_V1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "chainmain.supply.v1.Query",
    methods: [
      Chainmain_Supply_V1_QueryClientMetadata.Methods.totalSupply,
      Chainmain_Supply_V1_QueryClientMetadata.Methods.liquidSupply,
    ]
  )

  internal enum Methods {
    internal static let totalSupply = GRPCMethodDescriptor(
      name: "TotalSupply",
      path: "/chainmain.supply.v1.Query/TotalSupply",
      type: GRPCCallType.unary
    )

    internal static let liquidSupply = GRPCMethodDescriptor(
      name: "LiquidSupply",
      path: "/chainmain.supply.v1.Query/LiquidSupply",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Chainmain_Supply_V1_QueryProvider: CallHandlerProvider {
  var interceptors: Chainmain_Supply_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// TotalSupply queries the total supply of all coins.
  func totalSupply(request: Chainmain_Supply_V1_SupplyRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Chainmain_Supply_V1_SupplyResponse>

  /// LiquidSupply queries the liquid supply of all coins.
  func liquidSupply(request: Chainmain_Supply_V1_SupplyRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Chainmain_Supply_V1_SupplyResponse>
}

extension Chainmain_Supply_V1_QueryProvider {
  internal var serviceName: Substring {
    return Chainmain_Supply_V1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "TotalSupply":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Chainmain_Supply_V1_SupplyRequest>(),
        responseSerializer: ProtobufSerializer<Chainmain_Supply_V1_SupplyResponse>(),
        interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? [],
        userFunction: self.totalSupply(request:context:)
      )

    case "LiquidSupply":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Chainmain_Supply_V1_SupplyRequest>(),
        responseSerializer: ProtobufSerializer<Chainmain_Supply_V1_SupplyResponse>(),
        interceptors: self.interceptors?.makeLiquidSupplyInterceptors() ?? [],
        userFunction: self.liquidSupply(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Query defines the gRPC querier service.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Chainmain_Supply_V1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Chainmain_Supply_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// TotalSupply queries the total supply of all coins.
  @Sendable func totalSupply(
    request: Chainmain_Supply_V1_SupplyRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Chainmain_Supply_V1_SupplyResponse

  /// LiquidSupply queries the liquid supply of all coins.
  @Sendable func liquidSupply(
    request: Chainmain_Supply_V1_SupplyRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Chainmain_Supply_V1_SupplyResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Chainmain_Supply_V1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Chainmain_Supply_V1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Chainmain_Supply_V1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Chainmain_Supply_V1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "TotalSupply":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Chainmain_Supply_V1_SupplyRequest>(),
        responseSerializer: ProtobufSerializer<Chainmain_Supply_V1_SupplyResponse>(),
        interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? [],
        wrapping: self.totalSupply(request:context:)
      )

    case "LiquidSupply":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Chainmain_Supply_V1_SupplyRequest>(),
        responseSerializer: ProtobufSerializer<Chainmain_Supply_V1_SupplyResponse>(),
        interceptors: self.interceptors?.makeLiquidSupplyInterceptors() ?? [],
        wrapping: self.liquidSupply(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Chainmain_Supply_V1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'totalSupply'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeTotalSupplyInterceptors() -> [ServerInterceptor<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse>]

  /// - Returns: Interceptors to use when handling 'liquidSupply'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLiquidSupplyInterceptors() -> [ServerInterceptor<Chainmain_Supply_V1_SupplyRequest, Chainmain_Supply_V1_SupplyResponse>]
}

internal enum Chainmain_Supply_V1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "chainmain.supply.v1.Query",
    methods: [
      Chainmain_Supply_V1_QueryServerMetadata.Methods.totalSupply,
      Chainmain_Supply_V1_QueryServerMetadata.Methods.liquidSupply,
    ]
  )

  internal enum Methods {
    internal static let totalSupply = GRPCMethodDescriptor(
      name: "TotalSupply",
      path: "/chainmain.supply.v1.Query/TotalSupply",
      type: GRPCCallType.unary
    )

    internal static let liquidSupply = GRPCMethodDescriptor(
      name: "LiquidSupply",
      path: "/chainmain.supply.v1.Query/LiquidSupply",
      type: GRPCCallType.unary
    )
  }
}
