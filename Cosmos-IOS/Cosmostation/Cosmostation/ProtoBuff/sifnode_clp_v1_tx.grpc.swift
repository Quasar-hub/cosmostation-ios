//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: sifnode/clp/v1/tx.proto
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


/// Usage: instantiate `Sifnode_Clp_V1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Sifnode_Clp_V1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Sifnode_Clp_V1_MsgClientInterceptorFactoryProtocol? { get }

  func removeLiquidity(
    _ request: Sifnode_Clp_V1_MsgRemoveLiquidity,
    callOptions: CallOptions?
  ) -> UnaryCall<Sifnode_Clp_V1_MsgRemoveLiquidity, Sifnode_Clp_V1_MsgRemoveLiquidityResponse>

  func createPool(
    _ request: Sifnode_Clp_V1_MsgCreatePool,
    callOptions: CallOptions?
  ) -> UnaryCall<Sifnode_Clp_V1_MsgCreatePool, Sifnode_Clp_V1_MsgCreatePoolResponse>

  func addLiquidity(
    _ request: Sifnode_Clp_V1_MsgAddLiquidity,
    callOptions: CallOptions?
  ) -> UnaryCall<Sifnode_Clp_V1_MsgAddLiquidity, Sifnode_Clp_V1_MsgAddLiquidityResponse>

  func swap(
    _ request: Sifnode_Clp_V1_MsgSwap,
    callOptions: CallOptions?
  ) -> UnaryCall<Sifnode_Clp_V1_MsgSwap, Sifnode_Clp_V1_MsgSwapResponse>

  func decommissionPool(
    _ request: Sifnode_Clp_V1_MsgDecommissionPool,
    callOptions: CallOptions?
  ) -> UnaryCall<Sifnode_Clp_V1_MsgDecommissionPool, Sifnode_Clp_V1_MsgDecommissionPoolResponse>
}

extension Sifnode_Clp_V1_MsgClientProtocol {
  internal var serviceName: String {
    return "sifnode.clp.v1.Msg"
  }

  /// Unary call to RemoveLiquidity
  ///
  /// - Parameters:
  ///   - request: Request to send to RemoveLiquidity.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func removeLiquidity(
    _ request: Sifnode_Clp_V1_MsgRemoveLiquidity,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sifnode_Clp_V1_MsgRemoveLiquidity, Sifnode_Clp_V1_MsgRemoveLiquidityResponse> {
    return self.makeUnaryCall(
      path: "/sifnode.clp.v1.Msg/RemoveLiquidity",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRemoveLiquidityInterceptors() ?? []
    )
  }

  /// Unary call to CreatePool
  ///
  /// - Parameters:
  ///   - request: Request to send to CreatePool.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createPool(
    _ request: Sifnode_Clp_V1_MsgCreatePool,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sifnode_Clp_V1_MsgCreatePool, Sifnode_Clp_V1_MsgCreatePoolResponse> {
    return self.makeUnaryCall(
      path: "/sifnode.clp.v1.Msg/CreatePool",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreatePoolInterceptors() ?? []
    )
  }

  /// Unary call to AddLiquidity
  ///
  /// - Parameters:
  ///   - request: Request to send to AddLiquidity.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func addLiquidity(
    _ request: Sifnode_Clp_V1_MsgAddLiquidity,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sifnode_Clp_V1_MsgAddLiquidity, Sifnode_Clp_V1_MsgAddLiquidityResponse> {
    return self.makeUnaryCall(
      path: "/sifnode.clp.v1.Msg/AddLiquidity",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAddLiquidityInterceptors() ?? []
    )
  }

  /// Unary call to Swap
  ///
  /// - Parameters:
  ///   - request: Request to send to Swap.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func swap(
    _ request: Sifnode_Clp_V1_MsgSwap,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sifnode_Clp_V1_MsgSwap, Sifnode_Clp_V1_MsgSwapResponse> {
    return self.makeUnaryCall(
      path: "/sifnode.clp.v1.Msg/Swap",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSwapInterceptors() ?? []
    )
  }

  /// Unary call to DecommissionPool
  ///
  /// - Parameters:
  ///   - request: Request to send to DecommissionPool.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func decommissionPool(
    _ request: Sifnode_Clp_V1_MsgDecommissionPool,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sifnode_Clp_V1_MsgDecommissionPool, Sifnode_Clp_V1_MsgDecommissionPoolResponse> {
    return self.makeUnaryCall(
      path: "/sifnode.clp.v1.Msg/DecommissionPool",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDecommissionPoolInterceptors() ?? []
    )
  }
}

internal protocol Sifnode_Clp_V1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'removeLiquidity'.
  func makeRemoveLiquidityInterceptors() -> [ClientInterceptor<Sifnode_Clp_V1_MsgRemoveLiquidity, Sifnode_Clp_V1_MsgRemoveLiquidityResponse>]

  /// - Returns: Interceptors to use when invoking 'createPool'.
  func makeCreatePoolInterceptors() -> [ClientInterceptor<Sifnode_Clp_V1_MsgCreatePool, Sifnode_Clp_V1_MsgCreatePoolResponse>]

  /// - Returns: Interceptors to use when invoking 'addLiquidity'.
  func makeAddLiquidityInterceptors() -> [ClientInterceptor<Sifnode_Clp_V1_MsgAddLiquidity, Sifnode_Clp_V1_MsgAddLiquidityResponse>]

  /// - Returns: Interceptors to use when invoking 'swap'.
  func makeSwapInterceptors() -> [ClientInterceptor<Sifnode_Clp_V1_MsgSwap, Sifnode_Clp_V1_MsgSwapResponse>]

  /// - Returns: Interceptors to use when invoking 'decommissionPool'.
  func makeDecommissionPoolInterceptors() -> [ClientInterceptor<Sifnode_Clp_V1_MsgDecommissionPool, Sifnode_Clp_V1_MsgDecommissionPoolResponse>]
}

internal final class Sifnode_Clp_V1_MsgClient: Sifnode_Clp_V1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Sifnode_Clp_V1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the sifnode.clp.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Sifnode_Clp_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Sifnode_Clp_V1_MsgProvider: CallHandlerProvider {
  var interceptors: Sifnode_Clp_V1_MsgServerInterceptorFactoryProtocol? { get }

  func removeLiquidity(request: Sifnode_Clp_V1_MsgRemoveLiquidity, context: StatusOnlyCallContext) -> EventLoopFuture<Sifnode_Clp_V1_MsgRemoveLiquidityResponse>

  func createPool(request: Sifnode_Clp_V1_MsgCreatePool, context: StatusOnlyCallContext) -> EventLoopFuture<Sifnode_Clp_V1_MsgCreatePoolResponse>

  func addLiquidity(request: Sifnode_Clp_V1_MsgAddLiquidity, context: StatusOnlyCallContext) -> EventLoopFuture<Sifnode_Clp_V1_MsgAddLiquidityResponse>

  func swap(request: Sifnode_Clp_V1_MsgSwap, context: StatusOnlyCallContext) -> EventLoopFuture<Sifnode_Clp_V1_MsgSwapResponse>

  func decommissionPool(request: Sifnode_Clp_V1_MsgDecommissionPool, context: StatusOnlyCallContext) -> EventLoopFuture<Sifnode_Clp_V1_MsgDecommissionPoolResponse>
}

extension Sifnode_Clp_V1_MsgProvider {
  internal var serviceName: Substring { return "sifnode.clp.v1.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "RemoveLiquidity":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sifnode_Clp_V1_MsgRemoveLiquidity>(),
        responseSerializer: ProtobufSerializer<Sifnode_Clp_V1_MsgRemoveLiquidityResponse>(),
        interceptors: self.interceptors?.makeRemoveLiquidityInterceptors() ?? [],
        userFunction: self.removeLiquidity(request:context:)
      )

    case "CreatePool":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sifnode_Clp_V1_MsgCreatePool>(),
        responseSerializer: ProtobufSerializer<Sifnode_Clp_V1_MsgCreatePoolResponse>(),
        interceptors: self.interceptors?.makeCreatePoolInterceptors() ?? [],
        userFunction: self.createPool(request:context:)
      )

    case "AddLiquidity":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sifnode_Clp_V1_MsgAddLiquidity>(),
        responseSerializer: ProtobufSerializer<Sifnode_Clp_V1_MsgAddLiquidityResponse>(),
        interceptors: self.interceptors?.makeAddLiquidityInterceptors() ?? [],
        userFunction: self.addLiquidity(request:context:)
      )

    case "Swap":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sifnode_Clp_V1_MsgSwap>(),
        responseSerializer: ProtobufSerializer<Sifnode_Clp_V1_MsgSwapResponse>(),
        interceptors: self.interceptors?.makeSwapInterceptors() ?? [],
        userFunction: self.swap(request:context:)
      )

    case "DecommissionPool":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sifnode_Clp_V1_MsgDecommissionPool>(),
        responseSerializer: ProtobufSerializer<Sifnode_Clp_V1_MsgDecommissionPoolResponse>(),
        interceptors: self.interceptors?.makeDecommissionPoolInterceptors() ?? [],
        userFunction: self.decommissionPool(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Sifnode_Clp_V1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'removeLiquidity'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRemoveLiquidityInterceptors() -> [ServerInterceptor<Sifnode_Clp_V1_MsgRemoveLiquidity, Sifnode_Clp_V1_MsgRemoveLiquidityResponse>]

  /// - Returns: Interceptors to use when handling 'createPool'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreatePoolInterceptors() -> [ServerInterceptor<Sifnode_Clp_V1_MsgCreatePool, Sifnode_Clp_V1_MsgCreatePoolResponse>]

  /// - Returns: Interceptors to use when handling 'addLiquidity'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAddLiquidityInterceptors() -> [ServerInterceptor<Sifnode_Clp_V1_MsgAddLiquidity, Sifnode_Clp_V1_MsgAddLiquidityResponse>]

  /// - Returns: Interceptors to use when handling 'swap'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSwapInterceptors() -> [ServerInterceptor<Sifnode_Clp_V1_MsgSwap, Sifnode_Clp_V1_MsgSwapResponse>]

  /// - Returns: Interceptors to use when handling 'decommissionPool'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDecommissionPoolInterceptors() -> [ServerInterceptor<Sifnode_Clp_V1_MsgDecommissionPool, Sifnode_Clp_V1_MsgDecommissionPoolResponse>]
}
