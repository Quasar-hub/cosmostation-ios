//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: osmosis/gamm/v2/query.proto
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


/// Usage: instantiate `Osmosis_Gamm_V2_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Osmosis_Gamm_V2_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol? { get }

  func spotPrice(
    _ request: Osmosis_Gamm_V2_QuerySpotPriceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Gamm_V2_QuerySpotPriceRequest, Osmosis_Gamm_V2_QuerySpotPriceResponse>
}

extension Osmosis_Gamm_V2_QueryClientProtocol {
  internal var serviceName: String {
    return "osmosis.gamm.v2.Query"
  }

  /// Deprecated: please use alternate in x/poolmanager
  ///
  /// - Parameters:
  ///   - request: Request to send to SpotPrice.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func spotPrice(
    _ request: Osmosis_Gamm_V2_QuerySpotPriceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Gamm_V2_QuerySpotPriceRequest, Osmosis_Gamm_V2_QuerySpotPriceResponse> {
    return self.makeUnaryCall(
      path: Osmosis_Gamm_V2_QueryClientMetadata.Methods.spotPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSpotPriceInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Osmosis_Gamm_V2_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Osmosis_Gamm_V2_QueryNIOClient")
internal final class Osmosis_Gamm_V2_QueryClient: Osmosis_Gamm_V2_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the osmosis.gamm.v2.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Osmosis_Gamm_V2_QueryNIOClient: Osmosis_Gamm_V2_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the osmosis.gamm.v2.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Osmosis_Gamm_V2_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol? { get }

  func makeSpotPriceCall(
    _ request: Osmosis_Gamm_V2_QuerySpotPriceRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Osmosis_Gamm_V2_QuerySpotPriceRequest, Osmosis_Gamm_V2_QuerySpotPriceResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Osmosis_Gamm_V2_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Osmosis_Gamm_V2_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeSpotPriceCall(
    _ request: Osmosis_Gamm_V2_QuerySpotPriceRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Osmosis_Gamm_V2_QuerySpotPriceRequest, Osmosis_Gamm_V2_QuerySpotPriceResponse> {
    return self.makeAsyncUnaryCall(
      path: Osmosis_Gamm_V2_QueryClientMetadata.Methods.spotPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSpotPriceInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Osmosis_Gamm_V2_QueryAsyncClientProtocol {
  internal func spotPrice(
    _ request: Osmosis_Gamm_V2_QuerySpotPriceRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Osmosis_Gamm_V2_QuerySpotPriceResponse {
    return try await self.performAsyncUnaryCall(
      path: Osmosis_Gamm_V2_QueryClientMetadata.Methods.spotPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSpotPriceInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Osmosis_Gamm_V2_QueryAsyncClient: Osmosis_Gamm_V2_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Osmosis_Gamm_V2_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'spotPrice'.
  func makeSpotPriceInterceptors() -> [ClientInterceptor<Osmosis_Gamm_V2_QuerySpotPriceRequest, Osmosis_Gamm_V2_QuerySpotPriceResponse>]
}

internal enum Osmosis_Gamm_V2_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "osmosis.gamm.v2.Query",
    methods: [
      Osmosis_Gamm_V2_QueryClientMetadata.Methods.spotPrice,
    ]
  )

  internal enum Methods {
    internal static let spotPrice = GRPCMethodDescriptor(
      name: "SpotPrice",
      path: "/osmosis.gamm.v2.Query/SpotPrice",
      type: GRPCCallType.unary
    )
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Osmosis_Gamm_V2_QueryProvider: CallHandlerProvider {
  var interceptors: Osmosis_Gamm_V2_QueryServerInterceptorFactoryProtocol? { get }

  /// Deprecated: please use alternate in x/poolmanager
  func spotPrice(request: Osmosis_Gamm_V2_QuerySpotPriceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Gamm_V2_QuerySpotPriceResponse>
}

extension Osmosis_Gamm_V2_QueryProvider {
  internal var serviceName: Substring {
    return Osmosis_Gamm_V2_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "SpotPrice":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Gamm_V2_QuerySpotPriceRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Gamm_V2_QuerySpotPriceResponse>(),
        interceptors: self.interceptors?.makeSpotPriceInterceptors() ?? [],
        userFunction: self.spotPrice(request:context:)
      )

    default:
      return nil
    }
  }
}

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Osmosis_Gamm_V2_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Osmosis_Gamm_V2_QueryServerInterceptorFactoryProtocol? { get }

  /// Deprecated: please use alternate in x/poolmanager
  @Sendable func spotPrice(
    request: Osmosis_Gamm_V2_QuerySpotPriceRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Osmosis_Gamm_V2_QuerySpotPriceResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Osmosis_Gamm_V2_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Osmosis_Gamm_V2_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Osmosis_Gamm_V2_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Osmosis_Gamm_V2_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "SpotPrice":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Gamm_V2_QuerySpotPriceRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Gamm_V2_QuerySpotPriceResponse>(),
        interceptors: self.interceptors?.makeSpotPriceInterceptors() ?? [],
        wrapping: self.spotPrice(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Osmosis_Gamm_V2_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'spotPrice'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSpotPriceInterceptors() -> [ServerInterceptor<Osmosis_Gamm_V2_QuerySpotPriceRequest, Osmosis_Gamm_V2_QuerySpotPriceResponse>]
}

internal enum Osmosis_Gamm_V2_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "osmosis.gamm.v2.Query",
    methods: [
      Osmosis_Gamm_V2_QueryServerMetadata.Methods.spotPrice,
    ]
  )

  internal enum Methods {
    internal static let spotPrice = GRPCMethodDescriptor(
      name: "SpotPrice",
      path: "/osmosis.gamm.v2.Query/SpotPrice",
      type: GRPCCallType.unary
    )
  }
}
