//
//  OrdersService.swift
//  
//
//  Created by Sergey Yuryev on 02.05.2022.
//

import CombineGRPC
import Combine
import GRPC
import Foundation

public class OrdersService: BaseService {
    
    // MARK: - Properties
    
    private lazy var client = Tinkoff_Public_Invest_Api_Contract_V1_OrdersServiceClient(channel: channel)
    
    
    // MARK: - OrdersService API
    
    public func postOrder(
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
        request.figi = figi
        request.orderID = UUID().uuidString
        return executor.call(client.postOrder)(request)
    }
    
    public func cancelOrder(accountID: String, orderID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderRequest()
        request.accountID = accountID
        request.orderID = orderID
        return executor.call(client.cancelOrder)(request)
    }
    
    public func getOrders(accountID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersRequest()
        request.accountID = accountID
        return executor.call(client.getOrders)(request)
    }
    
    public func getOrderState(accountID: String, orderID: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_OrderState, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetOrderStateRequest()
        request.accountID = accountID
        request.orderID = orderID
        return executor.call(client.getOrderState)(request)
    }
}
