//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: irismod/random/tx.proto
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


/// Msg defines the oracle Msg service
///
/// Usage: instantiate `Irismod_Random_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Irismod_Random_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? { get }

  func requestRandom(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse>
}

extension Irismod_Random_MsgClientProtocol {
  internal var serviceName: String {
    return "irismod.random.Msg"
  }

  /// RequestRandom defines a method for requesting a new random number
  ///
  /// - Parameters:
  ///   - request: Request to send to RequestRandom.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func requestRandom(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse> {
    return self.makeUnaryCall(
      path: Irismod_Random_MsgClientMetadata.Methods.requestRandom.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestRandomInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Irismod_Random_MsgClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Irismod_Random_MsgNIOClient")
internal final class Irismod_Random_MsgClient: Irismod_Random_MsgClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the irismod.random.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Irismod_Random_MsgNIOClient: Irismod_Random_MsgClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the irismod.random.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the oracle Msg service
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Irismod_Random_MsgAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? { get }

  func makeRequestRandomCall(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Irismod_Random_MsgAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Irismod_Random_MsgClientMetadata.serviceDescriptor
  }

  internal var interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeRequestRandomCall(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse> {
    return self.makeAsyncUnaryCall(
      path: Irismod_Random_MsgClientMetadata.Methods.requestRandom.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestRandomInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Irismod_Random_MsgAsyncClientProtocol {
  internal func requestRandom(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions? = nil
  ) async throws -> Irismod_Random_MsgRequestRandomResponse {
    return try await self.performAsyncUnaryCall(
      path: Irismod_Random_MsgClientMetadata.Methods.requestRandom.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestRandomInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Irismod_Random_MsgAsyncClient: Irismod_Random_MsgAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Irismod_Random_MsgClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'requestRandom'.
  func makeRequestRandomInterceptors() -> [ClientInterceptor<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse>]
}

internal enum Irismod_Random_MsgClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "irismod.random.Msg",
    methods: [
      Irismod_Random_MsgClientMetadata.Methods.requestRandom,
    ]
  )

  internal enum Methods {
    internal static let requestRandom = GRPCMethodDescriptor(
      name: "RequestRandom",
      path: "/irismod.random.Msg/RequestRandom",
      type: GRPCCallType.unary
    )
  }
}

/// Msg defines the oracle Msg service
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Irismod_Random_MsgProvider: CallHandlerProvider {
  var interceptors: Irismod_Random_MsgServerInterceptorFactoryProtocol? { get }

  /// RequestRandom defines a method for requesting a new random number
  func requestRandom(request: Irismod_Random_MsgRequestRandom, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Random_MsgRequestRandomResponse>
}

extension Irismod_Random_MsgProvider {
  internal var serviceName: Substring {
    return Irismod_Random_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "RequestRandom":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Random_MsgRequestRandom>(),
        responseSerializer: ProtobufSerializer<Irismod_Random_MsgRequestRandomResponse>(),
        interceptors: self.interceptors?.makeRequestRandomInterceptors() ?? [],
        userFunction: self.requestRandom(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Msg defines the oracle Msg service
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Irismod_Random_MsgAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Irismod_Random_MsgServerInterceptorFactoryProtocol? { get }

  /// RequestRandom defines a method for requesting a new random number
  @Sendable func requestRandom(
    request: Irismod_Random_MsgRequestRandom,
    context: GRPCAsyncServerCallContext
  ) async throws -> Irismod_Random_MsgRequestRandomResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Irismod_Random_MsgAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Irismod_Random_MsgServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Irismod_Random_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Irismod_Random_MsgServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "RequestRandom":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Random_MsgRequestRandom>(),
        responseSerializer: ProtobufSerializer<Irismod_Random_MsgRequestRandomResponse>(),
        interceptors: self.interceptors?.makeRequestRandomInterceptors() ?? [],
        wrapping: self.requestRandom(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Irismod_Random_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'requestRandom'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRequestRandomInterceptors() -> [ServerInterceptor<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse>]
}

internal enum Irismod_Random_MsgServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "irismod.random.Msg",
    methods: [
      Irismod_Random_MsgServerMetadata.Methods.requestRandom,
    ]
  )

  internal enum Methods {
    internal static let requestRandom = GRPCMethodDescriptor(
      name: "RequestRandom",
      path: "/irismod.random.Msg/RequestRandom",
      type: GRPCCallType.unary
    )
  }
}
