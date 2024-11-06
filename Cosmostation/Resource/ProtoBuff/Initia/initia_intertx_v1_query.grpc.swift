//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: initia/intertx/v1/query.proto
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
/// Usage: instantiate `Initia_Intertx_V1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Initia_Intertx_V1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol? { get }

  func interchainAccount(
    _ request: Initia_Intertx_V1_QueryInterchainAccountRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Initia_Intertx_V1_QueryInterchainAccountRequest, Initia_Intertx_V1_QueryInterchainAccountResponse>
}

extension Initia_Intertx_V1_QueryClientProtocol {
  internal var serviceName: String {
    return "initia.intertx.v1.Query"
  }

  /// QueryInterchainAccount returns the interchain account for given owner address on a given connection pair
  ///
  /// - Parameters:
  ///   - request: Request to send to InterchainAccount.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func interchainAccount(
    _ request: Initia_Intertx_V1_QueryInterchainAccountRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Initia_Intertx_V1_QueryInterchainAccountRequest, Initia_Intertx_V1_QueryInterchainAccountResponse> {
    return self.makeUnaryCall(
      path: Initia_Intertx_V1_QueryClientMetadata.Methods.interchainAccount.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeInterchainAccountInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Initia_Intertx_V1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Initia_Intertx_V1_QueryNIOClient")
internal final class Initia_Intertx_V1_QueryClient: Initia_Intertx_V1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the initia.intertx.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Initia_Intertx_V1_QueryNIOClient: Initia_Intertx_V1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the initia.intertx.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Initia_Intertx_V1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol? { get }

  func makeInterchainAccountCall(
    _ request: Initia_Intertx_V1_QueryInterchainAccountRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Initia_Intertx_V1_QueryInterchainAccountRequest, Initia_Intertx_V1_QueryInterchainAccountResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Initia_Intertx_V1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Initia_Intertx_V1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeInterchainAccountCall(
    _ request: Initia_Intertx_V1_QueryInterchainAccountRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Initia_Intertx_V1_QueryInterchainAccountRequest, Initia_Intertx_V1_QueryInterchainAccountResponse> {
    return self.makeAsyncUnaryCall(
      path: Initia_Intertx_V1_QueryClientMetadata.Methods.interchainAccount.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeInterchainAccountInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Initia_Intertx_V1_QueryAsyncClientProtocol {
  internal func interchainAccount(
    _ request: Initia_Intertx_V1_QueryInterchainAccountRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Initia_Intertx_V1_QueryInterchainAccountResponse {
    return try await self.performAsyncUnaryCall(
      path: Initia_Intertx_V1_QueryClientMetadata.Methods.interchainAccount.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeInterchainAccountInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Initia_Intertx_V1_QueryAsyncClient: Initia_Intertx_V1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Initia_Intertx_V1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'interchainAccount'.
  func makeInterchainAccountInterceptors() -> [ClientInterceptor<Initia_Intertx_V1_QueryInterchainAccountRequest, Initia_Intertx_V1_QueryInterchainAccountResponse>]
}

internal enum Initia_Intertx_V1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "initia.intertx.v1.Query",
    methods: [
      Initia_Intertx_V1_QueryClientMetadata.Methods.interchainAccount,
    ]
  )

  internal enum Methods {
    internal static let interchainAccount = GRPCMethodDescriptor(
      name: "InterchainAccount",
      path: "/initia.intertx.v1.Query/InterchainAccount",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Initia_Intertx_V1_QueryProvider: CallHandlerProvider {
  var interceptors: Initia_Intertx_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// QueryInterchainAccount returns the interchain account for given owner address on a given connection pair
  func interchainAccount(request: Initia_Intertx_V1_QueryInterchainAccountRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Initia_Intertx_V1_QueryInterchainAccountResponse>
}

extension Initia_Intertx_V1_QueryProvider {
  internal var serviceName: Substring {
    return Initia_Intertx_V1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "InterchainAccount":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Initia_Intertx_V1_QueryInterchainAccountRequest>(),
        responseSerializer: ProtobufSerializer<Initia_Intertx_V1_QueryInterchainAccountResponse>(),
        interceptors: self.interceptors?.makeInterchainAccountInterceptors() ?? [],
        userFunction: self.interchainAccount(request:context:)
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
internal protocol Initia_Intertx_V1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Initia_Intertx_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// QueryInterchainAccount returns the interchain account for given owner address on a given connection pair
  @Sendable func interchainAccount(
    request: Initia_Intertx_V1_QueryInterchainAccountRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Initia_Intertx_V1_QueryInterchainAccountResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Initia_Intertx_V1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Initia_Intertx_V1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Initia_Intertx_V1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Initia_Intertx_V1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "InterchainAccount":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Initia_Intertx_V1_QueryInterchainAccountRequest>(),
        responseSerializer: ProtobufSerializer<Initia_Intertx_V1_QueryInterchainAccountResponse>(),
        interceptors: self.interceptors?.makeInterchainAccountInterceptors() ?? [],
        wrapping: self.interchainAccount(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Initia_Intertx_V1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'interchainAccount'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeInterchainAccountInterceptors() -> [ServerInterceptor<Initia_Intertx_V1_QueryInterchainAccountRequest, Initia_Intertx_V1_QueryInterchainAccountResponse>]
}

internal enum Initia_Intertx_V1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "initia.intertx.v1.Query",
    methods: [
      Initia_Intertx_V1_QueryServerMetadata.Methods.interchainAccount,
    ]
  )

  internal enum Methods {
    internal static let interchainAccount = GRPCMethodDescriptor(
      name: "InterchainAccount",
      path: "/initia.intertx.v1.Query/InterchainAccount",
      type: GRPCCallType.unary
    )
  }
}
