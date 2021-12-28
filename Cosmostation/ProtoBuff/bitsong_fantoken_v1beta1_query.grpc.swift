//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: bitsong/fantoken/v1beta1/query.proto
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


/// Query creates service with fantoken as RPC
///
/// Usage: instantiate `Bitsong_Fantoken_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Bitsong_Fantoken_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Bitsong_Fantoken_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func fanToken(
    _ request: Bitsong_Fantoken_V1beta1_QueryFanTokenRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bitsong_Fantoken_V1beta1_QueryFanTokenRequest, Bitsong_Fantoken_V1beta1_QueryFanTokenResponse>

  func fanTokens(
    _ request: Bitsong_Fantoken_V1beta1_QueryFanTokensRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bitsong_Fantoken_V1beta1_QueryFanTokensRequest, Bitsong_Fantoken_V1beta1_QueryFanTokensResponse>

  func params(
    _ request: Bitsong_Fantoken_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bitsong_Fantoken_V1beta1_QueryParamsRequest, Bitsong_Fantoken_V1beta1_QueryParamsResponse>

  func totalBurn(
    _ request: Bitsong_Fantoken_V1beta1_QueryTotalBurnRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bitsong_Fantoken_V1beta1_QueryTotalBurnRequest, Bitsong_Fantoken_V1beta1_QueryTotalBurnResponse>
}

extension Bitsong_Fantoken_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "bitsong.fantoken.v1beta1.Query"
  }

  /// FanToken returns fantoken with fantoken name
  ///
  /// - Parameters:
  ///   - request: Request to send to FanToken.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func fanToken(
    _ request: Bitsong_Fantoken_V1beta1_QueryFanTokenRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bitsong_Fantoken_V1beta1_QueryFanTokenRequest, Bitsong_Fantoken_V1beta1_QueryFanTokenResponse> {
    return self.makeUnaryCall(
      path: "/bitsong.fantoken.v1beta1.Query/FanToken",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFanTokenInterceptors() ?? []
    )
  }

  /// FanTokens returns the fantoken list
  ///
  /// - Parameters:
  ///   - request: Request to send to FanTokens.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func fanTokens(
    _ request: Bitsong_Fantoken_V1beta1_QueryFanTokensRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bitsong_Fantoken_V1beta1_QueryFanTokensRequest, Bitsong_Fantoken_V1beta1_QueryFanTokensResponse> {
    return self.makeUnaryCall(
      path: "/bitsong.fantoken.v1beta1.Query/FanTokens",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFanTokensInterceptors() ?? []
    )
  }

  /// Params queries the fantoken parameters
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Bitsong_Fantoken_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bitsong_Fantoken_V1beta1_QueryParamsRequest, Bitsong_Fantoken_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/bitsong.fantoken.v1beta1.Query/Params",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  /// TotalBurn queries all the burnt coins
  ///
  /// - Parameters:
  ///   - request: Request to send to TotalBurn.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func totalBurn(
    _ request: Bitsong_Fantoken_V1beta1_QueryTotalBurnRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bitsong_Fantoken_V1beta1_QueryTotalBurnRequest, Bitsong_Fantoken_V1beta1_QueryTotalBurnResponse> {
    return self.makeUnaryCall(
      path: "/bitsong.fantoken.v1beta1.Query/TotalBurn",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalBurnInterceptors() ?? []
    )
  }
}

internal protocol Bitsong_Fantoken_V1beta1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'fanToken'.
  func makeFanTokenInterceptors() -> [ClientInterceptor<Bitsong_Fantoken_V1beta1_QueryFanTokenRequest, Bitsong_Fantoken_V1beta1_QueryFanTokenResponse>]

  /// - Returns: Interceptors to use when invoking 'fanTokens'.
  func makeFanTokensInterceptors() -> [ClientInterceptor<Bitsong_Fantoken_V1beta1_QueryFanTokensRequest, Bitsong_Fantoken_V1beta1_QueryFanTokensResponse>]

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Bitsong_Fantoken_V1beta1_QueryParamsRequest, Bitsong_Fantoken_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when invoking 'totalBurn'.
  func makeTotalBurnInterceptors() -> [ClientInterceptor<Bitsong_Fantoken_V1beta1_QueryTotalBurnRequest, Bitsong_Fantoken_V1beta1_QueryTotalBurnResponse>]
}

internal final class Bitsong_Fantoken_V1beta1_QueryClient: Bitsong_Fantoken_V1beta1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Bitsong_Fantoken_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the bitsong.fantoken.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Bitsong_Fantoken_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query creates service with fantoken as RPC
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Bitsong_Fantoken_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Bitsong_Fantoken_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// FanToken returns fantoken with fantoken name
  func fanToken(request: Bitsong_Fantoken_V1beta1_QueryFanTokenRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Bitsong_Fantoken_V1beta1_QueryFanTokenResponse>

  /// FanTokens returns the fantoken list
  func fanTokens(request: Bitsong_Fantoken_V1beta1_QueryFanTokensRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Bitsong_Fantoken_V1beta1_QueryFanTokensResponse>

  /// Params queries the fantoken parameters
  func params(request: Bitsong_Fantoken_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Bitsong_Fantoken_V1beta1_QueryParamsResponse>

  /// TotalBurn queries all the burnt coins
  func totalBurn(request: Bitsong_Fantoken_V1beta1_QueryTotalBurnRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Bitsong_Fantoken_V1beta1_QueryTotalBurnResponse>
}

extension Bitsong_Fantoken_V1beta1_QueryProvider {
  internal var serviceName: Substring { return "bitsong.fantoken.v1beta1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "FanToken":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Bitsong_Fantoken_V1beta1_QueryFanTokenRequest>(),
        responseSerializer: ProtobufSerializer<Bitsong_Fantoken_V1beta1_QueryFanTokenResponse>(),
        interceptors: self.interceptors?.makeFanTokenInterceptors() ?? [],
        userFunction: self.fanToken(request:context:)
      )

    case "FanTokens":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Bitsong_Fantoken_V1beta1_QueryFanTokensRequest>(),
        responseSerializer: ProtobufSerializer<Bitsong_Fantoken_V1beta1_QueryFanTokensResponse>(),
        interceptors: self.interceptors?.makeFanTokensInterceptors() ?? [],
        userFunction: self.fanTokens(request:context:)
      )

    case "Params":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Bitsong_Fantoken_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Bitsong_Fantoken_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
      )

    case "TotalBurn":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Bitsong_Fantoken_V1beta1_QueryTotalBurnRequest>(),
        responseSerializer: ProtobufSerializer<Bitsong_Fantoken_V1beta1_QueryTotalBurnResponse>(),
        interceptors: self.interceptors?.makeTotalBurnInterceptors() ?? [],
        userFunction: self.totalBurn(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Bitsong_Fantoken_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'fanToken'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFanTokenInterceptors() -> [ServerInterceptor<Bitsong_Fantoken_V1beta1_QueryFanTokenRequest, Bitsong_Fantoken_V1beta1_QueryFanTokenResponse>]

  /// - Returns: Interceptors to use when handling 'fanTokens'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFanTokensInterceptors() -> [ServerInterceptor<Bitsong_Fantoken_V1beta1_QueryFanTokensRequest, Bitsong_Fantoken_V1beta1_QueryFanTokensResponse>]

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Bitsong_Fantoken_V1beta1_QueryParamsRequest, Bitsong_Fantoken_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when handling 'totalBurn'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeTotalBurnInterceptors() -> [ServerInterceptor<Bitsong_Fantoken_V1beta1_QueryTotalBurnRequest, Bitsong_Fantoken_V1beta1_QueryTotalBurnResponse>]
}