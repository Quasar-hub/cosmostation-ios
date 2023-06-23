//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: osmosis/txfees/v1beta1/query.proto
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


/// Usage: instantiate `Osmosis_Txfees_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Osmosis_Txfees_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func feeTokens(
    _ request: Osmosis_Txfees_V1beta1_QueryFeeTokensRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Txfees_V1beta1_QueryFeeTokensRequest, Osmosis_Txfees_V1beta1_QueryFeeTokensResponse>

  func denomSpotPrice(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest, Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse>

  func denomPoolId(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest, Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse>

  func baseDenom(
    _ request: Osmosis_Txfees_V1beta1_QueryBaseDenomRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Txfees_V1beta1_QueryBaseDenomRequest, Osmosis_Txfees_V1beta1_QueryBaseDenomResponse>
}

extension Osmosis_Txfees_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "osmosis.txfees.v1beta1.Query"
  }

  /// FeeTokens returns a list of all the whitelisted fee tokens and their
  /// corresponding pools. It does not include the BaseDenom, which has its own
  /// query endpoint
  ///
  /// - Parameters:
  ///   - request: Request to send to FeeTokens.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func feeTokens(
    _ request: Osmosis_Txfees_V1beta1_QueryFeeTokensRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Txfees_V1beta1_QueryFeeTokensRequest, Osmosis_Txfees_V1beta1_QueryFeeTokensResponse> {
    return self.makeUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.feeTokens.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeeTokensInterceptors() ?? []
    )
  }

  /// DenomSpotPrice returns all spot prices by each registered token denom.
  ///
  /// - Parameters:
  ///   - request: Request to send to DenomSpotPrice.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func denomSpotPrice(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest, Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse> {
    return self.makeUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.denomSpotPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDenomSpotPriceInterceptors() ?? []
    )
  }

  /// Returns the poolID for a specified denom input.
  ///
  /// - Parameters:
  ///   - request: Request to send to DenomPoolId.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func denomPoolId(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest, Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse> {
    return self.makeUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.denomPoolId.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDenomPoolIdInterceptors() ?? []
    )
  }

  /// Returns a list of all base denom tokens and their corresponding pools.
  ///
  /// - Parameters:
  ///   - request: Request to send to BaseDenom.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func baseDenom(
    _ request: Osmosis_Txfees_V1beta1_QueryBaseDenomRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Txfees_V1beta1_QueryBaseDenomRequest, Osmosis_Txfees_V1beta1_QueryBaseDenomResponse> {
    return self.makeUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.baseDenom.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeBaseDenomInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Osmosis_Txfees_V1beta1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Osmosis_Txfees_V1beta1_QueryNIOClient")
internal final class Osmosis_Txfees_V1beta1_QueryClient: Osmosis_Txfees_V1beta1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the osmosis.txfees.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Osmosis_Txfees_V1beta1_QueryNIOClient: Osmosis_Txfees_V1beta1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the osmosis.txfees.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Osmosis_Txfees_V1beta1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func makeFeeTokensCall(
    _ request: Osmosis_Txfees_V1beta1_QueryFeeTokensRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Osmosis_Txfees_V1beta1_QueryFeeTokensRequest, Osmosis_Txfees_V1beta1_QueryFeeTokensResponse>

  func makeDenomSpotPriceCall(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest, Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse>

  func makeDenomPoolIDCall(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest, Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse>

  func makeBaseDenomCall(
    _ request: Osmosis_Txfees_V1beta1_QueryBaseDenomRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Osmosis_Txfees_V1beta1_QueryBaseDenomRequest, Osmosis_Txfees_V1beta1_QueryBaseDenomResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Osmosis_Txfees_V1beta1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Osmosis_Txfees_V1beta1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeFeeTokensCall(
    _ request: Osmosis_Txfees_V1beta1_QueryFeeTokensRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Osmosis_Txfees_V1beta1_QueryFeeTokensRequest, Osmosis_Txfees_V1beta1_QueryFeeTokensResponse> {
    return self.makeAsyncUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.feeTokens.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeeTokensInterceptors() ?? []
    )
  }

  internal func makeDenomSpotPriceCall(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest, Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse> {
    return self.makeAsyncUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.denomSpotPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDenomSpotPriceInterceptors() ?? []
    )
  }

  internal func makeDenomPoolIDCall(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest, Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse> {
    return self.makeAsyncUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.denomPoolId.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDenomPoolIdInterceptors() ?? []
    )
  }

  internal func makeBaseDenomCall(
    _ request: Osmosis_Txfees_V1beta1_QueryBaseDenomRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Osmosis_Txfees_V1beta1_QueryBaseDenomRequest, Osmosis_Txfees_V1beta1_QueryBaseDenomResponse> {
    return self.makeAsyncUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.baseDenom.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeBaseDenomInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Osmosis_Txfees_V1beta1_QueryAsyncClientProtocol {
  internal func feeTokens(
    _ request: Osmosis_Txfees_V1beta1_QueryFeeTokensRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Osmosis_Txfees_V1beta1_QueryFeeTokensResponse {
    return try await self.performAsyncUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.feeTokens.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeeTokensInterceptors() ?? []
    )
  }

  internal func denomSpotPrice(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse {
    return try await self.performAsyncUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.denomSpotPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDenomSpotPriceInterceptors() ?? []
    )
  }

  internal func denomPoolId(
    _ request: Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse {
    return try await self.performAsyncUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.denomPoolId.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDenomPoolIdInterceptors() ?? []
    )
  }

  internal func baseDenom(
    _ request: Osmosis_Txfees_V1beta1_QueryBaseDenomRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Osmosis_Txfees_V1beta1_QueryBaseDenomResponse {
    return try await self.performAsyncUnaryCall(
      path: Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.baseDenom.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeBaseDenomInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Osmosis_Txfees_V1beta1_QueryAsyncClient: Osmosis_Txfees_V1beta1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Osmosis_Txfees_V1beta1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'feeTokens'.
  func makeFeeTokensInterceptors() -> [ClientInterceptor<Osmosis_Txfees_V1beta1_QueryFeeTokensRequest, Osmosis_Txfees_V1beta1_QueryFeeTokensResponse>]

  /// - Returns: Interceptors to use when invoking 'denomSpotPrice'.
  func makeDenomSpotPriceInterceptors() -> [ClientInterceptor<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest, Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse>]

  /// - Returns: Interceptors to use when invoking 'denomPoolId'.
  func makeDenomPoolIdInterceptors() -> [ClientInterceptor<Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest, Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse>]

  /// - Returns: Interceptors to use when invoking 'baseDenom'.
  func makeBaseDenomInterceptors() -> [ClientInterceptor<Osmosis_Txfees_V1beta1_QueryBaseDenomRequest, Osmosis_Txfees_V1beta1_QueryBaseDenomResponse>]
}

internal enum Osmosis_Txfees_V1beta1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "osmosis.txfees.v1beta1.Query",
    methods: [
      Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.feeTokens,
      Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.denomSpotPrice,
      Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.denomPoolId,
      Osmosis_Txfees_V1beta1_QueryClientMetadata.Methods.baseDenom,
    ]
  )

  internal enum Methods {
    internal static let feeTokens = GRPCMethodDescriptor(
      name: "FeeTokens",
      path: "/osmosis.txfees.v1beta1.Query/FeeTokens",
      type: GRPCCallType.unary
    )

    internal static let denomSpotPrice = GRPCMethodDescriptor(
      name: "DenomSpotPrice",
      path: "/osmosis.txfees.v1beta1.Query/DenomSpotPrice",
      type: GRPCCallType.unary
    )

    internal static let denomPoolId = GRPCMethodDescriptor(
      name: "DenomPoolId",
      path: "/osmosis.txfees.v1beta1.Query/DenomPoolId",
      type: GRPCCallType.unary
    )

    internal static let baseDenom = GRPCMethodDescriptor(
      name: "BaseDenom",
      path: "/osmosis.txfees.v1beta1.Query/BaseDenom",
      type: GRPCCallType.unary
    )
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Osmosis_Txfees_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Osmosis_Txfees_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// FeeTokens returns a list of all the whitelisted fee tokens and their
  /// corresponding pools. It does not include the BaseDenom, which has its own
  /// query endpoint
  func feeTokens(request: Osmosis_Txfees_V1beta1_QueryFeeTokensRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Txfees_V1beta1_QueryFeeTokensResponse>

  /// DenomSpotPrice returns all spot prices by each registered token denom.
  func denomSpotPrice(request: Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse>

  /// Returns the poolID for a specified denom input.
  func denomPoolId(request: Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse>

  /// Returns a list of all base denom tokens and their corresponding pools.
  func baseDenom(request: Osmosis_Txfees_V1beta1_QueryBaseDenomRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Txfees_V1beta1_QueryBaseDenomResponse>
}

extension Osmosis_Txfees_V1beta1_QueryProvider {
  internal var serviceName: Substring {
    return Osmosis_Txfees_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "FeeTokens":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Txfees_V1beta1_QueryFeeTokensRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Txfees_V1beta1_QueryFeeTokensResponse>(),
        interceptors: self.interceptors?.makeFeeTokensInterceptors() ?? [],
        userFunction: self.feeTokens(request:context:)
      )

    case "DenomSpotPrice":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse>(),
        interceptors: self.interceptors?.makeDenomSpotPriceInterceptors() ?? [],
        userFunction: self.denomSpotPrice(request:context:)
      )

    case "DenomPoolId":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse>(),
        interceptors: self.interceptors?.makeDenomPoolIdInterceptors() ?? [],
        userFunction: self.denomPoolId(request:context:)
      )

    case "BaseDenom":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Txfees_V1beta1_QueryBaseDenomRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Txfees_V1beta1_QueryBaseDenomResponse>(),
        interceptors: self.interceptors?.makeBaseDenomInterceptors() ?? [],
        userFunction: self.baseDenom(request:context:)
      )

    default:
      return nil
    }
  }
}

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Osmosis_Txfees_V1beta1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Osmosis_Txfees_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// FeeTokens returns a list of all the whitelisted fee tokens and their
  /// corresponding pools. It does not include the BaseDenom, which has its own
  /// query endpoint
  @Sendable func feeTokens(
    request: Osmosis_Txfees_V1beta1_QueryFeeTokensRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Osmosis_Txfees_V1beta1_QueryFeeTokensResponse

  /// DenomSpotPrice returns all spot prices by each registered token denom.
  @Sendable func denomSpotPrice(
    request: Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse

  /// Returns the poolID for a specified denom input.
  @Sendable func denomPoolId(
    request: Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse

  /// Returns a list of all base denom tokens and their corresponding pools.
  @Sendable func baseDenom(
    request: Osmosis_Txfees_V1beta1_QueryBaseDenomRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Osmosis_Txfees_V1beta1_QueryBaseDenomResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Osmosis_Txfees_V1beta1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Osmosis_Txfees_V1beta1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Osmosis_Txfees_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Osmosis_Txfees_V1beta1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "FeeTokens":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Txfees_V1beta1_QueryFeeTokensRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Txfees_V1beta1_QueryFeeTokensResponse>(),
        interceptors: self.interceptors?.makeFeeTokensInterceptors() ?? [],
        wrapping: self.feeTokens(request:context:)
      )

    case "DenomSpotPrice":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse>(),
        interceptors: self.interceptors?.makeDenomSpotPriceInterceptors() ?? [],
        wrapping: self.denomSpotPrice(request:context:)
      )

    case "DenomPoolId":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse>(),
        interceptors: self.interceptors?.makeDenomPoolIdInterceptors() ?? [],
        wrapping: self.denomPoolId(request:context:)
      )

    case "BaseDenom":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Txfees_V1beta1_QueryBaseDenomRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Txfees_V1beta1_QueryBaseDenomResponse>(),
        interceptors: self.interceptors?.makeBaseDenomInterceptors() ?? [],
        wrapping: self.baseDenom(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Osmosis_Txfees_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'feeTokens'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFeeTokensInterceptors() -> [ServerInterceptor<Osmosis_Txfees_V1beta1_QueryFeeTokensRequest, Osmosis_Txfees_V1beta1_QueryFeeTokensResponse>]

  /// - Returns: Interceptors to use when handling 'denomSpotPrice'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDenomSpotPriceInterceptors() -> [ServerInterceptor<Osmosis_Txfees_V1beta1_QueryDenomSpotPriceRequest, Osmosis_Txfees_V1beta1_QueryDenomSpotPriceResponse>]

  /// - Returns: Interceptors to use when handling 'denomPoolId'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDenomPoolIdInterceptors() -> [ServerInterceptor<Osmosis_Txfees_V1beta1_QueryDenomPoolIdRequest, Osmosis_Txfees_V1beta1_QueryDenomPoolIdResponse>]

  /// - Returns: Interceptors to use when handling 'baseDenom'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeBaseDenomInterceptors() -> [ServerInterceptor<Osmosis_Txfees_V1beta1_QueryBaseDenomRequest, Osmosis_Txfees_V1beta1_QueryBaseDenomResponse>]
}

internal enum Osmosis_Txfees_V1beta1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "osmosis.txfees.v1beta1.Query",
    methods: [
      Osmosis_Txfees_V1beta1_QueryServerMetadata.Methods.feeTokens,
      Osmosis_Txfees_V1beta1_QueryServerMetadata.Methods.denomSpotPrice,
      Osmosis_Txfees_V1beta1_QueryServerMetadata.Methods.denomPoolId,
      Osmosis_Txfees_V1beta1_QueryServerMetadata.Methods.baseDenom,
    ]
  )

  internal enum Methods {
    internal static let feeTokens = GRPCMethodDescriptor(
      name: "FeeTokens",
      path: "/osmosis.txfees.v1beta1.Query/FeeTokens",
      type: GRPCCallType.unary
    )

    internal static let denomSpotPrice = GRPCMethodDescriptor(
      name: "DenomSpotPrice",
      path: "/osmosis.txfees.v1beta1.Query/DenomSpotPrice",
      type: GRPCCallType.unary
    )

    internal static let denomPoolId = GRPCMethodDescriptor(
      name: "DenomPoolId",
      path: "/osmosis.txfees.v1beta1.Query/DenomPoolId",
      type: GRPCCallType.unary
    )

    internal static let baseDenom = GRPCMethodDescriptor(
      name: "BaseDenom",
      path: "/osmosis.txfees.v1beta1.Query/BaseDenom",
      type: GRPCCallType.unary
    )
  }
}
