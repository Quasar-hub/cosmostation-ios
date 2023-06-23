//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: kava/pricefeed/v1beta1/tx.proto
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


/// Msg defines the pricefeed Msg service.
///
/// Usage: instantiate `Kava_Pricefeed_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Kava_Pricefeed_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func postPrice(
    _ request: Kava_Pricefeed_V1beta1_MsgPostPrice,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Pricefeed_V1beta1_MsgPostPrice, Kava_Pricefeed_V1beta1_MsgPostPriceResponse>
}

extension Kava_Pricefeed_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "kava.pricefeed.v1beta1.Msg"
  }

  /// PostPrice defines a method for creating a new post price
  ///
  /// - Parameters:
  ///   - request: Request to send to PostPrice.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func postPrice(
    _ request: Kava_Pricefeed_V1beta1_MsgPostPrice,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Pricefeed_V1beta1_MsgPostPrice, Kava_Pricefeed_V1beta1_MsgPostPriceResponse> {
    return self.makeUnaryCall(
      path: Kava_Pricefeed_V1beta1_MsgClientMetadata.Methods.postPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePostPriceInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Kava_Pricefeed_V1beta1_MsgClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Kava_Pricefeed_V1beta1_MsgNIOClient")
internal final class Kava_Pricefeed_V1beta1_MsgClient: Kava_Pricefeed_V1beta1_MsgClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the kava.pricefeed.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Kava_Pricefeed_V1beta1_MsgNIOClient: Kava_Pricefeed_V1beta1_MsgClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the kava.pricefeed.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the pricefeed Msg service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Kava_Pricefeed_V1beta1_MsgAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func makePostPriceCall(
    _ request: Kava_Pricefeed_V1beta1_MsgPostPrice,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Kava_Pricefeed_V1beta1_MsgPostPrice, Kava_Pricefeed_V1beta1_MsgPostPriceResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Pricefeed_V1beta1_MsgAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Kava_Pricefeed_V1beta1_MsgClientMetadata.serviceDescriptor
  }

  internal var interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makePostPriceCall(
    _ request: Kava_Pricefeed_V1beta1_MsgPostPrice,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Kava_Pricefeed_V1beta1_MsgPostPrice, Kava_Pricefeed_V1beta1_MsgPostPriceResponse> {
    return self.makeAsyncUnaryCall(
      path: Kava_Pricefeed_V1beta1_MsgClientMetadata.Methods.postPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePostPriceInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Pricefeed_V1beta1_MsgAsyncClientProtocol {
  internal func postPrice(
    _ request: Kava_Pricefeed_V1beta1_MsgPostPrice,
    callOptions: CallOptions? = nil
  ) async throws -> Kava_Pricefeed_V1beta1_MsgPostPriceResponse {
    return try await self.performAsyncUnaryCall(
      path: Kava_Pricefeed_V1beta1_MsgClientMetadata.Methods.postPrice.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePostPriceInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Kava_Pricefeed_V1beta1_MsgAsyncClient: Kava_Pricefeed_V1beta1_MsgAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Kava_Pricefeed_V1beta1_MsgClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'postPrice'.
  func makePostPriceInterceptors() -> [ClientInterceptor<Kava_Pricefeed_V1beta1_MsgPostPrice, Kava_Pricefeed_V1beta1_MsgPostPriceResponse>]
}

internal enum Kava_Pricefeed_V1beta1_MsgClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "kava.pricefeed.v1beta1.Msg",
    methods: [
      Kava_Pricefeed_V1beta1_MsgClientMetadata.Methods.postPrice,
    ]
  )

  internal enum Methods {
    internal static let postPrice = GRPCMethodDescriptor(
      name: "PostPrice",
      path: "/kava.pricefeed.v1beta1.Msg/PostPrice",
      type: GRPCCallType.unary
    )
  }
}

/// Msg defines the pricefeed Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Kava_Pricefeed_V1beta1_MsgProvider: CallHandlerProvider {
  var interceptors: Kava_Pricefeed_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// PostPrice defines a method for creating a new post price
  func postPrice(request: Kava_Pricefeed_V1beta1_MsgPostPrice, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Pricefeed_V1beta1_MsgPostPriceResponse>
}

extension Kava_Pricefeed_V1beta1_MsgProvider {
  internal var serviceName: Substring {
    return Kava_Pricefeed_V1beta1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "PostPrice":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Pricefeed_V1beta1_MsgPostPrice>(),
        responseSerializer: ProtobufSerializer<Kava_Pricefeed_V1beta1_MsgPostPriceResponse>(),
        interceptors: self.interceptors?.makePostPriceInterceptors() ?? [],
        userFunction: self.postPrice(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Msg defines the pricefeed Msg service.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Kava_Pricefeed_V1beta1_MsgAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Kava_Pricefeed_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// PostPrice defines a method for creating a new post price
  @Sendable func postPrice(
    request: Kava_Pricefeed_V1beta1_MsgPostPrice,
    context: GRPCAsyncServerCallContext
  ) async throws -> Kava_Pricefeed_V1beta1_MsgPostPriceResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Pricefeed_V1beta1_MsgAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Kava_Pricefeed_V1beta1_MsgServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Kava_Pricefeed_V1beta1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Kava_Pricefeed_V1beta1_MsgServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "PostPrice":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Pricefeed_V1beta1_MsgPostPrice>(),
        responseSerializer: ProtobufSerializer<Kava_Pricefeed_V1beta1_MsgPostPriceResponse>(),
        interceptors: self.interceptors?.makePostPriceInterceptors() ?? [],
        wrapping: self.postPrice(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Kava_Pricefeed_V1beta1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'postPrice'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePostPriceInterceptors() -> [ServerInterceptor<Kava_Pricefeed_V1beta1_MsgPostPrice, Kava_Pricefeed_V1beta1_MsgPostPriceResponse>]
}

internal enum Kava_Pricefeed_V1beta1_MsgServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "kava.pricefeed.v1beta1.Msg",
    methods: [
      Kava_Pricefeed_V1beta1_MsgServerMetadata.Methods.postPrice,
    ]
  )

  internal enum Methods {
    internal static let postPrice = GRPCMethodDescriptor(
      name: "PostPrice",
      path: "/kava.pricefeed.v1beta1.Msg/PostPrice",
      type: GRPCCallType.unary
    )
  }
}
