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
    
    public func postSandboxOrder(
        accountID: String,
        figi: String,
        quantity: Int64,
        price: Tinkoff_Public_Invest_Api_Contract_V1_Quotation,
        direction: Tinkoff_Public_Invest_Api_Contract_V1_OrderDirection,
        orderType: Tinkoff_Public_Invest_Api_Contract_V1_OrderType
    ) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_PostOrderRequest()
        request.accountID = accountID
        request.quantity = quantity
        request.direction = direction
        request.orderType = orderType
        request.price = price
        return executor.call(client.postSandboxOrder)(request)
    }
    
    public func getSandboxOperations(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_OperationsResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_OperationsRequest()
        request.accountID = accountID
        return executor.call(client.getSandboxOperations)(request)
    }
    
    public func getSandboxPositions(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_PositionsResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_PositionsRequest()
        request.accountID = accountID
        return executor.call(client.getSandboxPositions)(request)
    }
    
    public func getSandboxOrders(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersRequest()
        request.accountID = accountID
        return executor.call(client.getSandboxOrders)(request)
    }
    
    public func getSandboxOrderState(accountID: String, orderID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_OrderState, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetOrderStateRequest()
        request.accountID = accountID
        request.orderID = orderID
        return executor.call(client.getSandboxOrderState)(request)
    }
    
    public func cancelSandboxOrder(accountID: String, orderID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderRequest()
        request.accountID = accountID
        request.orderID = orderID
        return executor.call(client.cancelSandboxOrder)(request)
    }
}
