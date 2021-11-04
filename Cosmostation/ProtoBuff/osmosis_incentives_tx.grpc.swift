//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: osmosis/incentives/tx.proto
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


/// Usage: instantiate `Osmosis_Incentives_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Osmosis_Incentives_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Osmosis_Incentives_MsgClientInterceptorFactoryProtocol? { get }

  func createGauge(
    _ request: Osmosis_Incentives_MsgCreateGauge,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_MsgCreateGauge, Osmosis_Incentives_MsgCreateGaugeResponse>

  func addToGauge(
    _ request: Osmosis_Incentives_MsgAddToGauge,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_MsgAddToGauge, Osmosis_Incentives_MsgAddToGaugeResponse>
}

extension Osmosis_Incentives_MsgClientProtocol {
  internal var serviceName: String {
    return "osmosis.incentives.Msg"
  }

  /// Unary call to CreateGauge
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateGauge.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createGauge(
    _ request: Osmosis_Incentives_MsgCreateGauge,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_MsgCreateGauge, Osmosis_Incentives_MsgCreateGaugeResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Msg/CreateGauge",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateGaugeInterceptors() ?? []
    )
  }

  /// Unary call to AddToGauge
  ///
  /// - Parameters:
  ///   - request: Request to send to AddToGauge.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func addToGauge(
    _ request: Osmosis_Incentives_MsgAddToGauge,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_MsgAddToGauge, Osmosis_Incentives_MsgAddToGaugeResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Msg/AddToGauge",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAddToGaugeInterceptors() ?? []
    )
  }
}

internal protocol Osmosis_Incentives_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'createGauge'.
  func makeCreateGaugeInterceptors() -> [ClientInterceptor<Osmosis_Incentives_MsgCreateGauge, Osmosis_Incentives_MsgCreateGaugeResponse>]

  /// - Returns: Interceptors to use when invoking 'addToGauge'.
  func makeAddToGaugeInterceptors() -> [ClientInterceptor<Osmosis_Incentives_MsgAddToGauge, Osmosis_Incentives_MsgAddToGaugeResponse>]
}

internal final class Osmosis_Incentives_MsgClient: Osmosis_Incentives_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Osmosis_Incentives_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the osmosis.incentives.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Osmosis_Incentives_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Osmosis_Incentives_MsgProvider: CallHandlerProvider {
  var interceptors: Osmosis_Incentives_MsgServerInterceptorFactoryProtocol? { get }

  func createGauge(request: Osmosis_Incentives_MsgCreateGauge, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_MsgCreateGaugeResponse>

  func addToGauge(request: Osmosis_Incentives_MsgAddToGauge, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_MsgAddToGaugeResponse>
}

extension Osmosis_Incentives_MsgProvider {
  internal var serviceName: Substring { return "osmosis.incentives.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "CreateGauge":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_MsgCreateGauge>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_MsgCreateGaugeResponse>(),
        interceptors: self.interceptors?.makeCreateGaugeInterceptors() ?? [],
        userFunction: self.createGauge(request:context:)
      )

    case "AddToGauge":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_MsgAddToGauge>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_MsgAddToGaugeResponse>(),
        interceptors: self.interceptors?.makeAddToGaugeInterceptors() ?? [],
        userFunction: self.addToGauge(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Osmosis_Incentives_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'createGauge'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateGaugeInterceptors() -> [ServerInterceptor<Osmosis_Incentives_MsgCreateGauge, Osmosis_Incentives_MsgCreateGaugeResponse>]

  /// - Returns: Interceptors to use when handling 'addToGauge'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAddToGaugeInterceptors() -> [ServerInterceptor<Osmosis_Incentives_MsgAddToGauge, Osmosis_Incentives_MsgAddToGaugeResponse>]
}