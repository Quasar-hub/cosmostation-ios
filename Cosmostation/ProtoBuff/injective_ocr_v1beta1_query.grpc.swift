//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: injective/ocr/v1beta1/query.proto
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


/// Query defines the gRPC querier service for OCR module.
///
/// Usage: instantiate `Injective_Ocr_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Injective_Ocr_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Injective_Ocr_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func params(
    _ request: Injective_Ocr_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryParamsRequest, Injective_Ocr_V1beta1_QueryParamsResponse>

  func feedConfig(
    _ request: Injective_Ocr_V1beta1_QueryFeedConfigRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryFeedConfigRequest, Injective_Ocr_V1beta1_QueryFeedConfigResponse>

  func feedConfigInfo(
    _ request: Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest, Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse>

  func latestRound(
    _ request: Injective_Ocr_V1beta1_QueryLatestRoundRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryLatestRoundRequest, Injective_Ocr_V1beta1_QueryLatestRoundResponse>

  func latestTransmissionDetails(
    _ request: Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest, Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse>

  func owedAmount(
    _ request: Injective_Ocr_V1beta1_QueryOwedAmountRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryOwedAmountRequest, Injective_Ocr_V1beta1_QueryOwedAmountResponse>

  func ocrModuleState(
    _ request: Injective_Ocr_V1beta1_QueryModuleStateRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryModuleStateRequest, Injective_Ocr_V1beta1_QueryModuleStateResponse>
}

extension Injective_Ocr_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "injective.ocr.v1beta1.Query"
  }

  /// Unary call to Params
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Injective_Ocr_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryParamsRequest, Injective_Ocr_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/injective.ocr.v1beta1.Query/Params",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  /// Retrieves the OCR FeedConfig for a given FeedId
  ///
  /// - Parameters:
  ///   - request: Request to send to FeedConfig.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func feedConfig(
    _ request: Injective_Ocr_V1beta1_QueryFeedConfigRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryFeedConfigRequest, Injective_Ocr_V1beta1_QueryFeedConfigResponse> {
    return self.makeUnaryCall(
      path: "/injective.ocr.v1beta1.Query/FeedConfig",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeedConfigInterceptors() ?? []
    )
  }

  /// Retrieves the OCR FeedConfigInfo for a given FeedId
  ///
  /// - Parameters:
  ///   - request: Request to send to FeedConfigInfo.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func feedConfigInfo(
    _ request: Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest, Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse> {
    return self.makeUnaryCall(
      path: "/injective.ocr.v1beta1.Query/FeedConfigInfo",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeedConfigInfoInterceptors() ?? []
    )
  }

  /// Retrieves latest round ID and data, including median answer for that round
  ///
  /// - Parameters:
  ///   - request: Request to send to LatestRound.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func latestRound(
    _ request: Injective_Ocr_V1beta1_QueryLatestRoundRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryLatestRoundRequest, Injective_Ocr_V1beta1_QueryLatestRoundResponse> {
    return self.makeUnaryCall(
      path: "/injective.ocr.v1beta1.Query/LatestRound",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLatestRoundInterceptors() ?? []
    )
  }

  /// LatestTransmissionDetails returns details about the latest trasmission recorded on chain for the given feed ID.
  ///
  /// - Parameters:
  ///   - request: Request to send to LatestTransmissionDetails.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func latestTransmissionDetails(
    _ request: Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest, Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse> {
    return self.makeUnaryCall(
      path: "/injective.ocr.v1beta1.Query/LatestTransmissionDetails",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLatestTransmissionDetailsInterceptors() ?? []
    )
  }

  /// Retrieves transmitter's owed amount
  ///
  /// - Parameters:
  ///   - request: Request to send to OwedAmount.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func owedAmount(
    _ request: Injective_Ocr_V1beta1_QueryOwedAmountRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryOwedAmountRequest, Injective_Ocr_V1beta1_QueryOwedAmountResponse> {
    return self.makeUnaryCall(
      path: "/injective.ocr.v1beta1.Query/OwedAmount",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeOwedAmountInterceptors() ?? []
    )
  }

  /// Retrieves the entire OCR module's state
  ///
  /// - Parameters:
  ///   - request: Request to send to OcrModuleState.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func ocrModuleState(
    _ request: Injective_Ocr_V1beta1_QueryModuleStateRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Injective_Ocr_V1beta1_QueryModuleStateRequest, Injective_Ocr_V1beta1_QueryModuleStateResponse> {
    return self.makeUnaryCall(
      path: "/injective.ocr.v1beta1.Query/OcrModuleState",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeOcrModuleStateInterceptors() ?? []
    )
  }
}

internal protocol Injective_Ocr_V1beta1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Injective_Ocr_V1beta1_QueryParamsRequest, Injective_Ocr_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when invoking 'feedConfig'.
  func makeFeedConfigInterceptors() -> [ClientInterceptor<Injective_Ocr_V1beta1_QueryFeedConfigRequest, Injective_Ocr_V1beta1_QueryFeedConfigResponse>]

  /// - Returns: Interceptors to use when invoking 'feedConfigInfo'.
  func makeFeedConfigInfoInterceptors() -> [ClientInterceptor<Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest, Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse>]

  /// - Returns: Interceptors to use when invoking 'latestRound'.
  func makeLatestRoundInterceptors() -> [ClientInterceptor<Injective_Ocr_V1beta1_QueryLatestRoundRequest, Injective_Ocr_V1beta1_QueryLatestRoundResponse>]

  /// - Returns: Interceptors to use when invoking 'latestTransmissionDetails'.
  func makeLatestTransmissionDetailsInterceptors() -> [ClientInterceptor<Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest, Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse>]

  /// - Returns: Interceptors to use when invoking 'owedAmount'.
  func makeOwedAmountInterceptors() -> [ClientInterceptor<Injective_Ocr_V1beta1_QueryOwedAmountRequest, Injective_Ocr_V1beta1_QueryOwedAmountResponse>]

  /// - Returns: Interceptors to use when invoking 'ocrModuleState'.
  func makeOcrModuleStateInterceptors() -> [ClientInterceptor<Injective_Ocr_V1beta1_QueryModuleStateRequest, Injective_Ocr_V1beta1_QueryModuleStateResponse>]
}

internal final class Injective_Ocr_V1beta1_QueryClient: Injective_Ocr_V1beta1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Injective_Ocr_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the injective.ocr.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Injective_Ocr_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service for OCR module.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Injective_Ocr_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Injective_Ocr_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  func params(request: Injective_Ocr_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Injective_Ocr_V1beta1_QueryParamsResponse>

  /// Retrieves the OCR FeedConfig for a given FeedId
  func feedConfig(request: Injective_Ocr_V1beta1_QueryFeedConfigRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Injective_Ocr_V1beta1_QueryFeedConfigResponse>

  /// Retrieves the OCR FeedConfigInfo for a given FeedId
  func feedConfigInfo(request: Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse>

  /// Retrieves latest round ID and data, including median answer for that round
  func latestRound(request: Injective_Ocr_V1beta1_QueryLatestRoundRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Injective_Ocr_V1beta1_QueryLatestRoundResponse>

  /// LatestTransmissionDetails returns details about the latest trasmission recorded on chain for the given feed ID.
  func latestTransmissionDetails(request: Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse>

  /// Retrieves transmitter's owed amount
  func owedAmount(request: Injective_Ocr_V1beta1_QueryOwedAmountRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Injective_Ocr_V1beta1_QueryOwedAmountResponse>

  /// Retrieves the entire OCR module's state
  func ocrModuleState(request: Injective_Ocr_V1beta1_QueryModuleStateRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Injective_Ocr_V1beta1_QueryModuleStateResponse>
}

extension Injective_Ocr_V1beta1_QueryProvider {
  internal var serviceName: Substring { return "injective.ocr.v1beta1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Params":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Injective_Ocr_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Injective_Ocr_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
      )

    case "FeedConfig":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Injective_Ocr_V1beta1_QueryFeedConfigRequest>(),
        responseSerializer: ProtobufSerializer<Injective_Ocr_V1beta1_QueryFeedConfigResponse>(),
        interceptors: self.interceptors?.makeFeedConfigInterceptors() ?? [],
        userFunction: self.feedConfig(request:context:)
      )

    case "FeedConfigInfo":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest>(),
        responseSerializer: ProtobufSerializer<Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse>(),
        interceptors: self.interceptors?.makeFeedConfigInfoInterceptors() ?? [],
        userFunction: self.feedConfigInfo(request:context:)
      )

    case "LatestRound":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Injective_Ocr_V1beta1_QueryLatestRoundRequest>(),
        responseSerializer: ProtobufSerializer<Injective_Ocr_V1beta1_QueryLatestRoundResponse>(),
        interceptors: self.interceptors?.makeLatestRoundInterceptors() ?? [],
        userFunction: self.latestRound(request:context:)
      )

    case "LatestTransmissionDetails":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest>(),
        responseSerializer: ProtobufSerializer<Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse>(),
        interceptors: self.interceptors?.makeLatestTransmissionDetailsInterceptors() ?? [],
        userFunction: self.latestTransmissionDetails(request:context:)
      )

    case "OwedAmount":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Injective_Ocr_V1beta1_QueryOwedAmountRequest>(),
        responseSerializer: ProtobufSerializer<Injective_Ocr_V1beta1_QueryOwedAmountResponse>(),
        interceptors: self.interceptors?.makeOwedAmountInterceptors() ?? [],
        userFunction: self.owedAmount(request:context:)
      )

    case "OcrModuleState":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Injective_Ocr_V1beta1_QueryModuleStateRequest>(),
        responseSerializer: ProtobufSerializer<Injective_Ocr_V1beta1_QueryModuleStateResponse>(),
        interceptors: self.interceptors?.makeOcrModuleStateInterceptors() ?? [],
        userFunction: self.ocrModuleState(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Injective_Ocr_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Injective_Ocr_V1beta1_QueryParamsRequest, Injective_Ocr_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when handling 'feedConfig'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFeedConfigInterceptors() -> [ServerInterceptor<Injective_Ocr_V1beta1_QueryFeedConfigRequest, Injective_Ocr_V1beta1_QueryFeedConfigResponse>]

  /// - Returns: Interceptors to use when handling 'feedConfigInfo'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFeedConfigInfoInterceptors() -> [ServerInterceptor<Injective_Ocr_V1beta1_QueryFeedConfigInfoRequest, Injective_Ocr_V1beta1_QueryFeedConfigInfoResponse>]

  /// - Returns: Interceptors to use when handling 'latestRound'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLatestRoundInterceptors() -> [ServerInterceptor<Injective_Ocr_V1beta1_QueryLatestRoundRequest, Injective_Ocr_V1beta1_QueryLatestRoundResponse>]

  /// - Returns: Interceptors to use when handling 'latestTransmissionDetails'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLatestTransmissionDetailsInterceptors() -> [ServerInterceptor<Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsRequest, Injective_Ocr_V1beta1_QueryLatestTransmissionDetailsResponse>]

  /// - Returns: Interceptors to use when handling 'owedAmount'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeOwedAmountInterceptors() -> [ServerInterceptor<Injective_Ocr_V1beta1_QueryOwedAmountRequest, Injective_Ocr_V1beta1_QueryOwedAmountResponse>]

  /// - Returns: Interceptors to use when handling 'ocrModuleState'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeOcrModuleStateInterceptors() -> [ServerInterceptor<Injective_Ocr_V1beta1_QueryModuleStateRequest, Injective_Ocr_V1beta1_QueryModuleStateResponse>]
}