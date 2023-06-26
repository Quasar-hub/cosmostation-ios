//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: irismod/record/query.proto
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


/// Query defines the gRPC querier service for record module
///
/// Usage: instantiate `Irismod_Record_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Irismod_Record_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol? { get }

  func record(
    _ request: Irismod_Record_QueryRecordRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Record_QueryRecordRequest, Irismod_Record_QueryRecordResponse>
}

extension Irismod_Record_QueryClientProtocol {
  internal var serviceName: String {
    return "irismod.record.Query"
  }

  /// Record queries the record by the given record ID
  ///
  /// - Parameters:
  ///   - request: Request to send to Record.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func record(
    _ request: Irismod_Record_QueryRecordRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Record_QueryRecordRequest, Irismod_Record_QueryRecordResponse> {
    return self.makeUnaryCall(
      path: Irismod_Record_QueryClientMetadata.Methods.record.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRecordInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Irismod_Record_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Irismod_Record_QueryNIOClient")
internal final class Irismod_Record_QueryClient: Irismod_Record_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the irismod.record.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Irismod_Record_QueryNIOClient: Irismod_Record_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the irismod.record.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service for record module
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Irismod_Record_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol? { get }

  func makeRecordCall(
    _ request: Irismod_Record_QueryRecordRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Irismod_Record_QueryRecordRequest, Irismod_Record_QueryRecordResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Irismod_Record_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Irismod_Record_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeRecordCall(
    _ request: Irismod_Record_QueryRecordRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Irismod_Record_QueryRecordRequest, Irismod_Record_QueryRecordResponse> {
    return self.makeAsyncUnaryCall(
      path: Irismod_Record_QueryClientMetadata.Methods.record.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRecordInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Irismod_Record_QueryAsyncClientProtocol {
  internal func record(
    _ request: Irismod_Record_QueryRecordRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Irismod_Record_QueryRecordResponse {
    return try await self.performAsyncUnaryCall(
      path: Irismod_Record_QueryClientMetadata.Methods.record.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRecordInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Irismod_Record_QueryAsyncClient: Irismod_Record_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Record_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Irismod_Record_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'record'.
  func makeRecordInterceptors() -> [ClientInterceptor<Irismod_Record_QueryRecordRequest, Irismod_Record_QueryRecordResponse>]
}

internal enum Irismod_Record_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "irismod.record.Query",
    methods: [
      Irismod_Record_QueryClientMetadata.Methods.record,
    ]
  )

  internal enum Methods {
    internal static let record = GRPCMethodDescriptor(
      name: "Record",
      path: "/irismod.record.Query/Record",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service for record module
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Irismod_Record_QueryProvider: CallHandlerProvider {
  var interceptors: Irismod_Record_QueryServerInterceptorFactoryProtocol? { get }

  /// Record queries the record by the given record ID
  func record(request: Irismod_Record_QueryRecordRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Record_QueryRecordResponse>
}

extension Irismod_Record_QueryProvider {
  internal var serviceName: Substring {
    return Irismod_Record_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Record":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Record_QueryRecordRequest>(),
        responseSerializer: ProtobufSerializer<Irismod_Record_QueryRecordResponse>(),
        interceptors: self.interceptors?.makeRecordInterceptors() ?? [],
        userFunction: self.record(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Query defines the gRPC querier service for record module
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Irismod_Record_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Irismod_Record_QueryServerInterceptorFactoryProtocol? { get }

  /// Record queries the record by the given record ID
  @Sendable func record(
    request: Irismod_Record_QueryRecordRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Irismod_Record_QueryRecordResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Irismod_Record_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Irismod_Record_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Irismod_Record_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Irismod_Record_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Record":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Record_QueryRecordRequest>(),
        responseSerializer: ProtobufSerializer<Irismod_Record_QueryRecordResponse>(),
        interceptors: self.interceptors?.makeRecordInterceptors() ?? [],
        wrapping: self.record(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Irismod_Record_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'record'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRecordInterceptors() -> [ServerInterceptor<Irismod_Record_QueryRecordRequest, Irismod_Record_QueryRecordResponse>]
}

internal enum Irismod_Record_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "irismod.record.Query",
    methods: [
      Irismod_Record_QueryServerMetadata.Methods.record,
    ]
  )

  internal enum Methods {
    internal static let record = GRPCMethodDescriptor(
      name: "Record",
      path: "/irismod.record.Query/Record",
      type: GRPCCallType.unary
    )
  }
}