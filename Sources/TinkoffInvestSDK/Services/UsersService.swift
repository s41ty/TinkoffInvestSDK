//
//  UsersService.swift
//  
//
//  Created by Sergey Yuryev on 28.04.2022.
//

import CombineGRPC
import Combine
import GRPC

public class UsersService: BaseService {
    
    // MARK: - Properties
    
    private lazy var client = Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClient(channel: channel)
    
    
    // MARK: - UsersService API
    
    public func getUserInfo() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse, RPCError> {
        return executor.call(client.getInfo)(.init())
    }
    
    public func getAccounts() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse, RPCError> {
        return executor.call(client.getAccounts)(Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest())
    }

    public func getMarginAttributes(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest()
        request.accountID = accountID
        return executor.call(client.getMarginAttributes)(request)
    }

    public func getUserTariffRequest() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse, RPCError> {
        return executor.call(client.getUserTariff)(Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest())
    }
}
