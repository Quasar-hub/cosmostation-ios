//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: osmosis/incentives/query.proto
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


/// Query defines the gRPC querier service.
///
/// Usage: instantiate `Osmosis_Incentives_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Osmosis_Incentives_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Osmosis_Incentives_QueryClientInterceptorFactoryProtocol? { get }

  func moduleToDistributeCoins(
    _ request: Osmosis_Incentives_ModuleToDistributeCoinsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_ModuleToDistributeCoinsRequest, Osmosis_Incentives_ModuleToDistributeCoinsResponse>

  func moduleDistributedCoins(
    _ request: Osmosis_Incentives_ModuleDistributedCoinsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_ModuleDistributedCoinsRequest, Osmosis_Incentives_ModuleDistributedCoinsResponse>

  func gaugeByID(
    _ request: Osmosis_Incentives_GaugeByIDRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_GaugeByIDRequest, Osmosis_Incentives_GaugeByIDResponse>

  func gauges(
    _ request: Osmosis_Incentives_GaugesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_GaugesRequest, Osmosis_Incentives_GaugesResponse>

  func activeGauges(
    _ request: Osmosis_Incentives_ActiveGaugesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_ActiveGaugesRequest, Osmosis_Incentives_ActiveGaugesResponse>

  func upcomingGauges(
    _ request: Osmosis_Incentives_UpcomingGaugesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_UpcomingGaugesRequest, Osmosis_Incentives_UpcomingGaugesResponse>

  func rewardsEst(
    _ request: Osmosis_Incentives_RewardsEstRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_RewardsEstRequest, Osmosis_Incentives_RewardsEstResponse>

  func lockableDurations(
    _ request: Osmosis_Incentives_QueryLockableDurationsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Osmosis_Incentives_QueryLockableDurationsRequest, Osmosis_Incentives_QueryLockableDurationsResponse>
}

extension Osmosis_Incentives_QueryClientProtocol {
  internal var serviceName: String {
    return "osmosis.incentives.Query"
  }

  /// returns coins that is going to be distributed
  ///
  /// - Parameters:
  ///   - request: Request to send to ModuleToDistributeCoins.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func moduleToDistributeCoins(
    _ request: Osmosis_Incentives_ModuleToDistributeCoinsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_ModuleToDistributeCoinsRequest, Osmosis_Incentives_ModuleToDistributeCoinsResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Query/ModuleToDistributeCoins",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeModuleToDistributeCoinsInterceptors() ?? []
    )
  }

  /// returns coins that are distributed by module so far
  ///
  /// - Parameters:
  ///   - request: Request to send to ModuleDistributedCoins.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func moduleDistributedCoins(
    _ request: Osmosis_Incentives_ModuleDistributedCoinsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_ModuleDistributedCoinsRequest, Osmosis_Incentives_ModuleDistributedCoinsResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Query/ModuleDistributedCoins",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeModuleDistributedCoinsInterceptors() ?? []
    )
  }

  /// returns Gauge by id
  ///
  /// - Parameters:
  ///   - request: Request to send to GaugeByID.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func gaugeByID(
    _ request: Osmosis_Incentives_GaugeByIDRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_GaugeByIDRequest, Osmosis_Incentives_GaugeByIDResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Query/GaugeByID",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGaugeByIDInterceptors() ?? []
    )
  }

  /// returns gauges both upcoming and active
  ///
  /// - Parameters:
  ///   - request: Request to send to Gauges.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func gauges(
    _ request: Osmosis_Incentives_GaugesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_GaugesRequest, Osmosis_Incentives_GaugesResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Query/Gauges",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGaugesInterceptors() ?? []
    )
  }

  /// returns active gauges
  ///
  /// - Parameters:
  ///   - request: Request to send to ActiveGauges.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func activeGauges(
    _ request: Osmosis_Incentives_ActiveGaugesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_ActiveGaugesRequest, Osmosis_Incentives_ActiveGaugesResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Query/ActiveGauges",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeActiveGaugesInterceptors() ?? []
    )
  }

  /// returns scheduled gauges
  ///
  /// - Parameters:
  ///   - request: Request to send to UpcomingGauges.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func upcomingGauges(
    _ request: Osmosis_Incentives_UpcomingGaugesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_UpcomingGaugesRequest, Osmosis_Incentives_UpcomingGaugesResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Query/UpcomingGauges",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpcomingGaugesInterceptors() ?? []
    )
  }

  /// RewardsEst returns an estimate of the rewards at a future specific time.
  /// The querier either provides an address or a set of locks
  /// for which they want to find the associated rewards.
  ///
  /// - Parameters:
  ///   - request: Request to send to RewardsEst.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func rewardsEst(
    _ request: Osmosis_Incentives_RewardsEstRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_RewardsEstRequest, Osmosis_Incentives_RewardsEstResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Query/RewardsEst",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRewardsEstInterceptors() ?? []
    )
  }

  /// Unary call to LockableDurations
  ///
  /// - Parameters:
  ///   - request: Request to send to LockableDurations.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func lockableDurations(
    _ request: Osmosis_Incentives_QueryLockableDurationsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Osmosis_Incentives_QueryLockableDurationsRequest, Osmosis_Incentives_QueryLockableDurationsResponse> {
    return self.makeUnaryCall(
      path: "/osmosis.incentives.Query/LockableDurations",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLockableDurationsInterceptors() ?? []
    )
  }
}

internal protocol Osmosis_Incentives_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'moduleToDistributeCoins'.
  func makeModuleToDistributeCoinsInterceptors() -> [ClientInterceptor<Osmosis_Incentives_ModuleToDistributeCoinsRequest, Osmosis_Incentives_ModuleToDistributeCoinsResponse>]

  /// - Returns: Interceptors to use when invoking 'moduleDistributedCoins'.
  func makeModuleDistributedCoinsInterceptors() -> [ClientInterceptor<Osmosis_Incentives_ModuleDistributedCoinsRequest, Osmosis_Incentives_ModuleDistributedCoinsResponse>]

  /// - Returns: Interceptors to use when invoking 'gaugeByID'.
  func makeGaugeByIDInterceptors() -> [ClientInterceptor<Osmosis_Incentives_GaugeByIDRequest, Osmosis_Incentives_GaugeByIDResponse>]

  /// - Returns: Interceptors to use when invoking 'gauges'.
  func makeGaugesInterceptors() -> [ClientInterceptor<Osmosis_Incentives_GaugesRequest, Osmosis_Incentives_GaugesResponse>]

  /// - Returns: Interceptors to use when invoking 'activeGauges'.
  func makeActiveGaugesInterceptors() -> [ClientInterceptor<Osmosis_Incentives_ActiveGaugesRequest, Osmosis_Incentives_ActiveGaugesResponse>]

  /// - Returns: Interceptors to use when invoking 'upcomingGauges'.
  func makeUpcomingGaugesInterceptors() -> [ClientInterceptor<Osmosis_Incentives_UpcomingGaugesRequest, Osmosis_Incentives_UpcomingGaugesResponse>]

  /// - Returns: Interceptors to use when invoking 'rewardsEst'.
  func makeRewardsEstInterceptors() -> [ClientInterceptor<Osmosis_Incentives_RewardsEstRequest, Osmosis_Incentives_RewardsEstResponse>]

  /// - Returns: Interceptors to use when invoking 'lockableDurations'.
  func makeLockableDurationsInterceptors() -> [ClientInterceptor<Osmosis_Incentives_QueryLockableDurationsRequest, Osmosis_Incentives_QueryLockableDurationsResponse>]
}

internal final class Osmosis_Incentives_QueryClient: Osmosis_Incentives_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Osmosis_Incentives_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the osmosis.incentives.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Osmosis_Incentives_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Osmosis_Incentives_QueryProvider: CallHandlerProvider {
  var interceptors: Osmosis_Incentives_QueryServerInterceptorFactoryProtocol? { get }

  /// returns coins that is going to be distributed
  func moduleToDistributeCoins(request: Osmosis_Incentives_ModuleToDistributeCoinsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_ModuleToDistributeCoinsResponse>

  /// returns coins that are distributed by module so far
  func moduleDistributedCoins(request: Osmosis_Incentives_ModuleDistributedCoinsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_ModuleDistributedCoinsResponse>

  /// returns Gauge by id
  func gaugeByID(request: Osmosis_Incentives_GaugeByIDRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_GaugeByIDResponse>

  /// returns gauges both upcoming and active
  func gauges(request: Osmosis_Incentives_GaugesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_GaugesResponse>

  /// returns active gauges
  func activeGauges(request: Osmosis_Incentives_ActiveGaugesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_ActiveGaugesResponse>

  /// returns scheduled gauges
  func upcomingGauges(request: Osmosis_Incentives_UpcomingGaugesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_UpcomingGaugesResponse>

  /// RewardsEst returns an estimate of the rewards at a future specific time.
  /// The querier either provides an address or a set of locks
  /// for which they want to find the associated rewards.
  func rewardsEst(request: Osmosis_Incentives_RewardsEstRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_RewardsEstResponse>

  func lockableDurations(request: Osmosis_Incentives_QueryLockableDurationsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Osmosis_Incentives_QueryLockableDurationsResponse>
}

extension Osmosis_Incentives_QueryProvider {
  internal var serviceName: Substring { return "osmosis.incentives.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "ModuleToDistributeCoins":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_ModuleToDistributeCoinsRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_ModuleToDistributeCoinsResponse>(),
        interceptors: self.interceptors?.makeModuleToDistributeCoinsInterceptors() ?? [],
        userFunction: self.moduleToDistributeCoins(request:context:)
      )

    case "ModuleDistributedCoins":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_ModuleDistributedCoinsRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_ModuleDistributedCoinsResponse>(),
        interceptors: self.interceptors?.makeModuleDistributedCoinsInterceptors() ?? [],
        userFunction: self.moduleDistributedCoins(request:context:)
      )

    case "GaugeByID":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_GaugeByIDRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_GaugeByIDResponse>(),
        interceptors: self.interceptors?.makeGaugeByIDInterceptors() ?? [],
        userFunction: self.gaugeByID(request:context:)
      )

    case "Gauges":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_GaugesRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_GaugesResponse>(),
        interceptors: self.interceptors?.makeGaugesInterceptors() ?? [],
        userFunction: self.gauges(request:context:)
      )

    case "ActiveGauges":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_ActiveGaugesRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_ActiveGaugesResponse>(),
        interceptors: self.interceptors?.makeActiveGaugesInterceptors() ?? [],
        userFunction: self.activeGauges(request:context:)
      )

    case "UpcomingGauges":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_UpcomingGaugesRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_UpcomingGaugesResponse>(),
        interceptors: self.interceptors?.makeUpcomingGaugesInterceptors() ?? [],
        userFunction: self.upcomingGauges(request:context:)
      )

    case "RewardsEst":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_RewardsEstRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_RewardsEstResponse>(),
        interceptors: self.interceptors?.makeRewardsEstInterceptors() ?? [],
        userFunction: self.rewardsEst(request:context:)
      )

    case "LockableDurations":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Osmosis_Incentives_QueryLockableDurationsRequest>(),
        responseSerializer: ProtobufSerializer<Osmosis_Incentives_QueryLockableDurationsResponse>(),
        interceptors: self.interceptors?.makeLockableDurationsInterceptors() ?? [],
        userFunction: self.lockableDurations(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Osmosis_Incentives_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'moduleToDistributeCoins'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeModuleToDistributeCoinsInterceptors() -> [ServerInterceptor<Osmosis_Incentives_ModuleToDistributeCoinsRequest, Osmosis_Incentives_ModuleToDistributeCoinsResponse>]

  /// - Returns: Interceptors to use when handling 'moduleDistributedCoins'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeModuleDistributedCoinsInterceptors() -> [ServerInterceptor<Osmosis_Incentives_ModuleDistributedCoinsRequest, Osmosis_Incentives_ModuleDistributedCoinsResponse>]

  /// - Returns: Interceptors to use when handling 'gaugeByID'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGaugeByIDInterceptors() -> [ServerInterceptor<Osmosis_Incentives_GaugeByIDRequest, Osmosis_Incentives_GaugeByIDResponse>]

  /// - Returns: Interceptors to use when handling 'gauges'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGaugesInterceptors() -> [ServerInterceptor<Osmosis_Incentives_GaugesRequest, Osmosis_Incentives_GaugesResponse>]

  /// - Returns: Interceptors to use when handling 'activeGauges'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeActiveGaugesInterceptors() -> [ServerInterceptor<Osmosis_Incentives_ActiveGaugesRequest, Osmosis_Incentives_ActiveGaugesResponse>]

  /// - Returns: Interceptors to use when handling 'upcomingGauges'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpcomingGaugesInterceptors() -> [ServerInterceptor<Osmosis_Incentives_UpcomingGaugesRequest, Osmosis_Incentives_UpcomingGaugesResponse>]

  /// - Returns: Interceptors to use when handling 'rewardsEst'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRewardsEstInterceptors() -> [ServerInterceptor<Osmosis_Incentives_RewardsEstRequest, Osmosis_Incentives_RewardsEstResponse>]

  /// - Returns: Interceptors to use when handling 'lockableDurations'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLockableDurationsInterceptors() -> [ServerInterceptor<Osmosis_Incentives_QueryLockableDurationsRequest, Osmosis_Incentives_QueryLockableDurationsResponse>]
}