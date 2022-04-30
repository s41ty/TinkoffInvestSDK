//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: users.proto
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


///Сервис предназначен для получения: </br> **1**.
///списка счетов пользователя; </br> **2**. маржинальных показателе по счёту.
///
/// Usage: instantiate `Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClient`, then call methods of this protocol to make API calls.
public protocol Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientInterceptorFactoryProtocol? { get }

  func getAccounts(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse>

  func getMarginAttributes(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse>

  func getUserTariff(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse>

  func getInfo(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse>
}

extension Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientProtocol {
  public var serviceName: String {
    return "tinkoff.public.invest.api.contract.v1.UsersService"
  }

  ///Метод получения счетов пользователя.
  ///
  /// - Parameters:
  ///   - request: Request to send to GetAccounts.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getAccounts(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse> {
    return self.makeUnaryCall(
      path: "/tinkoff.public.invest.api.contract.v1.UsersService/GetAccounts",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetAccountsInterceptors() ?? []
    )
  }

  ///Расчёт маржинальных показателей по счёту.
  ///
  /// - Parameters:
  ///   - request: Request to send to GetMarginAttributes.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getMarginAttributes(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse> {
    return self.makeUnaryCall(
      path: "/tinkoff.public.invest.api.contract.v1.UsersService/GetMarginAttributes",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetMarginAttributesInterceptors() ?? []
    )
  }

  ///Запрос тарифа пользователя.
  ///
  /// - Parameters:
  ///   - request: Request to send to GetUserTariff.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getUserTariff(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse> {
    return self.makeUnaryCall(
      path: "/tinkoff.public.invest.api.contract.v1.UsersService/GetUserTariff",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserTariffInterceptors() ?? []
    )
  }

  ///Метод получения информации о пользователе.
  ///
  /// - Parameters:
  ///   - request: Request to send to GetInfo.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getInfo(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse> {
    return self.makeUnaryCall(
      path: "/tinkoff.public.invest.api.contract.v1.UsersService/GetInfo",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetInfoInterceptors() ?? []
    )
  }
}

public protocol Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'getAccounts'.
  func makeGetAccountsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse>]

  /// - Returns: Interceptors to use when invoking 'getMarginAttributes'.
  func makeGetMarginAttributesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse>]

  /// - Returns: Interceptors to use when invoking 'getUserTariff'.
  func makeGetUserTariffInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse>]

  /// - Returns: Interceptors to use when invoking 'getInfo'.
  func makeGetInfoInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse>]
}

public final class Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the tinkoff.public.invest.api.contract.v1.UsersService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

///Сервис предназначен для получения: </br> **1**.
///списка счетов пользователя; </br> **2**. маржинальных показателе по счёту.
///
/// To build a server, implement a class that conforms to this protocol.
public protocol Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceProvider: CallHandlerProvider {
  var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceServerInterceptorFactoryProtocol? { get }

  ///Метод получения счетов пользователя.
  func getAccounts(request: Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse>

  ///Расчёт маржинальных показателей по счёту.
  func getMarginAttributes(request: Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse>

  ///Запрос тарифа пользователя.
  func getUserTariff(request: Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse>

  ///Метод получения информации о пользователе.
  func getInfo(request: Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse>
}

extension Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceProvider {
  public var serviceName: Substring { return "tinkoff.public.invest.api.contract.v1.UsersService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "GetAccounts":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest>(),
        responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse>(),
        interceptors: self.interceptors?.makeGetAccountsInterceptors() ?? [],
        userFunction: self.getAccounts(request:context:)
      )

    case "GetMarginAttributes":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest>(),
        responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse>(),
        interceptors: self.interceptors?.makeGetMarginAttributesInterceptors() ?? [],
        userFunction: self.getMarginAttributes(request:context:)
      )

    case "GetUserTariff":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest>(),
        responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse>(),
        interceptors: self.interceptors?.makeGetUserTariffInterceptors() ?? [],
        userFunction: self.getUserTariff(request:context:)
      )

    case "GetInfo":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest>(),
        responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse>(),
        interceptors: self.interceptors?.makeGetInfoInterceptors() ?? [],
        userFunction: self.getInfo(request:context:)
      )

    default:
      return nil
    }
  }
}

public protocol Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'getAccounts'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetAccountsInterceptors() -> [ServerInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse>]

  /// - Returns: Interceptors to use when handling 'getMarginAttributes'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetMarginAttributesInterceptors() -> [ServerInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse>]

  /// - Returns: Interceptors to use when handling 'getUserTariff'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetUserTariffInterceptors() -> [ServerInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse>]

  /// - Returns: Interceptors to use when handling 'getInfo'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetInfoInterceptors() -> [ServerInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse>]
}
