//
//  SandboxService.swift
//  
//
//  Created by Sergey Yuryev on 28.04.2022.
//

import CombineGRPC
import Combine
import GRPC

public class SandboxService: BaseService {
    
    // MARK: - Properties
    
    private lazy var client = Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceClient(channel: channel)
    
    
    // MARK: - SandboxService API
    
    public func getSandboxAccounts() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse, RPCError> {
        return executor.call(client.getSandboxAccounts)(Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest())
    }
    
    public func openSandboxAccount() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_OpenSandboxAccountResponse, RPCError> {
        return executor.call(client.openSandboxAccount)(Tinkoff_Public_Invest_Api_Contract_V1_OpenSandboxAccountRequest())
    }
    
    public func closeSandboxAccount(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountRequest()
        request.accountID = accountID
        return executor.call(client.closeSandboxAccount)(request)
    }
    
    public func sandboxPayIn(accountID: String, ammount: Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInRequest()
        request.accountID = accountID
        request.amount = ammount
        return executor.call(client.sandboxPayIn)(request)
    }
    
    public func getSandboxPortfolio(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_PortfolioRequest()
        request.accountID = accountID
        return executor.call(client.getSandboxPortfolio)(request)
    }
    
//    getSandboxOperations
//    getSandboxOrders
//    postSandboxOrder
//    cancelSandboxOrder
//    getSandboxOrderState
//    getSandboxPositions
    
}
