//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: gaia/globalfee/v1beta1/query.proto
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
/// Usage: instantiate `Gaia_Globalfee_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Gaia_Globalfee_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func params(
    _ request: Gaia_Globalfee_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Gaia_Globalfee_V1beta1_QueryParamsRequest, Gaia_Globalfee_V1beta1_QueryParamsResponse>
}

extension Gaia_Globalfee_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "gaia.globalfee.v1beta1.Query"
  }

  /// Unary call to Params
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Gaia_Globalfee_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Gaia_Globalfee_V1beta1_QueryParamsRequest, Gaia_Globalfee_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: Gaia_Globalfee_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Gaia_Globalfee_V1beta1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Gaia_Globalfee_V1beta1_QueryNIOClient")
internal final class Gaia_Globalfee_V1beta1_QueryClient: Gaia_Globalfee_V1beta1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the gaia.globalfee.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Gaia_Globalfee_V1beta1_QueryNIOClient: Gaia_Globalfee_V1beta1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the gaia.globalfee.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Gaia_Globalfee_V1beta1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func makeParamsCall(
    _ request: Gaia_Globalfee_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Gaia_Globalfee_V1beta1_QueryParamsRequest, Gaia_Globalfee_V1beta1_QueryParamsResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Gaia_Globalfee_V1beta1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Gaia_Globalfee_V1beta1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeParamsCall(
    _ request: Gaia_Globalfee_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Gaia_Globalfee_V1beta1_QueryParamsRequest, Gaia_Globalfee_V1beta1_QueryParamsResponse> {
    return self.makeAsyncUnaryCall(
      path: Gaia_Globalfee_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Gaia_Globalfee_V1beta1_QueryAsyncClientProtocol {
  internal func params(
    _ request: Gaia_Globalfee_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Gaia_Globalfee_V1beta1_QueryParamsResponse {
    return try await self.performAsyncUnaryCall(
      path: Gaia_Globalfee_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Gaia_Globalfee_V1beta1_QueryAsyncClient: Gaia_Globalfee_V1beta1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Gaia_Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Gaia_Globalfee_V1beta1_QueryParamsRequest, Gaia_Globalfee_V1beta1_QueryParamsResponse>]
}

internal enum Gaia_Globalfee_V1beta1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "gaia.globalfee.v1beta1.Query",
    methods: [
      Gaia_Globalfee_V1beta1_QueryClientMetadata.Methods.params,
    ]
  )

  internal enum Methods {
    internal static let params = GRPCMethodDescriptor(
      name: "Params",
      path: "/gaia.globalfee.v1beta1.Query/Params",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Gaia_Globalfee_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Gaia_Globalfee_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  func params(request: Gaia_Globalfee_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Gaia_Globalfee_V1beta1_QueryParamsResponse>
}

extension Gaia_Globalfee_V1beta1_QueryProvider {
  internal var serviceName: Substring {
    return Gaia_Globalfee_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Params":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Gaia_Globalfee_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Gaia_Globalfee_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
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
internal protocol Gaia_Globalfee_V1beta1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Gaia_Globalfee_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  @Sendable func params(
    request: Gaia_Globalfee_V1beta1_QueryParamsRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Gaia_Globalfee_V1beta1_QueryParamsResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Gaia_Globalfee_V1beta1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Gaia_Globalfee_V1beta1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Gaia_Globalfee_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Gaia_Globalfee_V1beta1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Params":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Gaia_Globalfee_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Gaia_Globalfee_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        wrapping: self.params(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Gaia_Globalfee_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Gaia_Globalfee_V1beta1_QueryParamsRequest, Gaia_Globalfee_V1beta1_QueryParamsResponse>]
}

internal enum Gaia_Globalfee_V1beta1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "gaia.globalfee.v1beta1.Query",
    methods: [
      Gaia_Globalfee_V1beta1_QueryServerMetadata.Methods.params,
    ]
  )

  internal enum Methods {
    internal static let params = GRPCMethodDescriptor(
      name: "Params",
      path: "/gaia.globalfee.v1beta1.Query/Params",
      type: GRPCCallType.unary
    )
  }
}
