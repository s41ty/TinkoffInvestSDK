//
//  OperationsService.swift
//  
//
//  Created by Sergey Yuryev on 01.05.2022.
//

import CombineGRPC
import Combine
import GRPC

public class OperationsService: BaseService {
    
    // MARK: - Properties
    
    lazy var client = Tinkoff_Public_Invest_Api_Contract_V1_OperationsServiceClient(channel: channel)
    
    
    // MARK: - OperationsService API
    
    public func getPortfolio(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_PortfolioRequest()
        request.accountID = accountID
        return executor.call(client.getPortfolio)(request)
    }

    public func getPositions(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_PositionsResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_PositionsRequest()
        request.accountID = accountID
        return executor.call(client.getPositions)(request)
    }

    public func getWithdrawLimits(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest()
        request.accountID = accountID
        return executor.call(client.getWithdrawLimits)(request)
    }

    public func getOperations(request: Tinkoff_Public_Invest_Api_Contract_V1_OperationsRequest) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_OperationsResponse, RPCError> {
        return executor.call(client.getOperations)(request)
    }
}
