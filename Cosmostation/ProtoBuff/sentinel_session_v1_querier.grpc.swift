//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: sentinel/session/v1/querier.proto
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
import SwiftProtobuf


/// Usage: instantiate `Sentinel_Session_V1_QueryServiceClient`, then call methods of this protocol to make API calls.
internal protocol Sentinel_Session_V1_QueryServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Sentinel_Session_V1_QueryServiceClientInterceptorFactoryProtocol? { get }

  func querySessions(
    _ request: Sentinel_Session_V1_QuerySessionsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Session_V1_QuerySessionsRequest, Sentinel_Session_V1_QuerySessionsResponse>

  func querySessionsForAddress(
    _ request: Sentinel_Session_V1_QuerySessionsForAddressRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Session_V1_QuerySessionsForAddressRequest, Sentinel_Session_V1_QuerySessionsForAddressResponse>

  func querySession(
    _ request: Sentinel_Session_V1_QuerySessionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Session_V1_QuerySessionRequest, Sentinel_Session_V1_QuerySessionResponse>

  func queryParams(
    _ request: Sentinel_Session_V1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Session_V1_QueryParamsRequest, Sentinel_Session_V1_QueryParamsResponse>
}

extension Sentinel_Session_V1_QueryServiceClientProtocol {
  internal var serviceName: String {
    return "sentinel.session.v1.QueryService"
  }

  /// Unary call to QuerySessions
  ///
  /// - Parameters:
  ///   - request: Request to send to QuerySessions.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func querySessions(
    _ request: Sentinel_Session_V1_QuerySessionsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Session_V1_QuerySessionsRequest, Sentinel_Session_V1_QuerySessionsResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.session.v1.QueryService/QuerySessions",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQuerySessionsInterceptors() ?? []
    )
  }

  /// Unary call to QuerySessionsForAddress
  ///
  /// - Parameters:
  ///   - request: Request to send to QuerySessionsForAddress.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func querySessionsForAddress(
    _ request: Sentinel_Session_V1_QuerySessionsForAddressRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Session_V1_QuerySessionsForAddressRequest, Sentinel_Session_V1_QuerySessionsForAddressResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.session.v1.QueryService/QuerySessionsForAddress",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQuerySessionsForAddressInterceptors() ?? []
    )
  }

  /// Unary call to QuerySession
  ///
  /// - Parameters:
  ///   - request: Request to send to QuerySession.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func querySession(
    _ request: Sentinel_Session_V1_QuerySessionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Session_V1_QuerySessionRequest, Sentinel_Session_V1_QuerySessionResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.session.v1.QueryService/QuerySession",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQuerySessionInterceptors() ?? []
    )
  }

  /// Unary call to QueryParams
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryParams.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryParams(
    _ request: Sentinel_Session_V1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Session_V1_QueryParamsRequest, Sentinel_Session_V1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.session.v1.QueryService/QueryParams",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryParamsInterceptors() ?? []
    )
  }
}

internal protocol Sentinel_Session_V1_QueryServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'querySessions'.
  func makeQuerySessionsInterceptors() -> [ClientInterceptor<Sentinel_Session_V1_QuerySessionsRequest, Sentinel_Session_V1_QuerySessionsResponse>]

  /// - Returns: Interceptors to use when invoking 'querySessionsForAddress'.
  func makeQuerySessionsForAddressInterceptors() -> [ClientInterceptor<Sentinel_Session_V1_QuerySessionsForAddressRequest, Sentinel_Session_V1_QuerySessionsForAddressResponse>]

  /// - Returns: Interceptors to use when invoking 'querySession'.
  func makeQuerySessionInterceptors() -> [ClientInterceptor<Sentinel_Session_V1_QuerySessionRequest, Sentinel_Session_V1_QuerySessionResponse>]

  /// - Returns: Interceptors to use when invoking 'queryParams'.
  func makeQueryParamsInterceptors() -> [ClientInterceptor<Sentinel_Session_V1_QueryParamsRequest, Sentinel_Session_V1_QueryParamsResponse>]
}

internal final class Sentinel_Session_V1_QueryServiceClient: Sentinel_Session_V1_QueryServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Sentinel_Session_V1_QueryServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the sentinel.session.v1.QueryService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Sentinel_Session_V1_QueryServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Sentinel_Session_V1_QueryServiceProvider: CallHandlerProvider {
  var interceptors: Sentinel_Session_V1_QueryServiceServerInterceptorFactoryProtocol? { get }

  func querySessions(request: Sentinel_Session_V1_QuerySessionsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Session_V1_QuerySessionsResponse>

  func querySessionsForAddress(request: Sentinel_Session_V1_QuerySessionsForAddressRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Session_V1_QuerySessionsForAddressResponse>

  func querySession(request: Sentinel_Session_V1_QuerySessionRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Session_V1_QuerySessionResponse>

  func queryParams(request: Sentinel_Session_V1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Session_V1_QueryParamsResponse>
}

extension Sentinel_Session_V1_QueryServiceProvider {
  internal var serviceName: Substring { return "sentinel.session.v1.QueryService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "QuerySessions":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Session_V1_QuerySessionsRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Session_V1_QuerySessionsResponse>(),
        interceptors: self.interceptors?.makeQuerySessionsInterceptors() ?? [],
        userFunction: self.querySessions(request:context:)
      )

    case "QuerySessionsForAddress":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Session_V1_QuerySessionsForAddressRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Session_V1_QuerySessionsForAddressResponse>(),
        interceptors: self.interceptors?.makeQuerySessionsForAddressInterceptors() ?? [],
        userFunction: self.querySessionsForAddress(request:context:)
      )

    case "QuerySession":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Session_V1_QuerySessionRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Session_V1_QuerySessionResponse>(),
        interceptors: self.interceptors?.makeQuerySessionInterceptors() ?? [],
        userFunction: self.querySession(request:context:)
      )

    case "QueryParams":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Session_V1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Session_V1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeQueryParamsInterceptors() ?? [],
        userFunction: self.queryParams(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Sentinel_Session_V1_QueryServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'querySessions'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQuerySessionsInterceptors() -> [ServerInterceptor<Sentinel_Session_V1_QuerySessionsRequest, Sentinel_Session_V1_QuerySessionsResponse>]

  /// - Returns: Interceptors to use when handling 'querySessionsForAddress'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQuerySessionsForAddressInterceptors() -> [ServerInterceptor<Sentinel_Session_V1_QuerySessionsForAddressRequest, Sentinel_Session_V1_QuerySessionsForAddressResponse>]

  /// - Returns: Interceptors to use when handling 'querySession'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQuerySessionInterceptors() -> [ServerInterceptor<Sentinel_Session_V1_QuerySessionRequest, Sentinel_Session_V1_QuerySessionResponse>]

  /// - Returns: Interceptors to use when handling 'queryParams'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryParamsInterceptors() -> [ServerInterceptor<Sentinel_Session_V1_QueryParamsRequest, Sentinel_Session_V1_QueryParamsResponse>]
}