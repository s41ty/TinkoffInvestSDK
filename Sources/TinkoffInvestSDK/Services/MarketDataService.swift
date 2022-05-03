//
//  MarketDataService.swift
//  
//
//  Created by Sergey Yuryev on 02.05.2022.
//

import SwiftProtobuf
import CombineGRPC
import Combine
import GRPC

public class MarketDataService: BaseService {
    
    // MARK: - Properties
    
    private lazy var client = Tinkoff_Public_Invest_Api_Contract_V1_MarketDataServiceClient(channel: channel)
    
    
    // MARK: - MarketDataService API
    
    public func getCandels(
        figi: String,
        from: SwiftProtobuf.Google_Protobuf_Timestamp,
        to: SwiftProtobuf.Google_Protobuf_Timestamp,
        interval: Tinkoff_Public_Invest_Api_Contract_V1_CandleInterval = .unspecified
    ) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetCandlesResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetCandlesRequest()
        request.figi = figi
        request.to = to
        request.from = from
        request.interval = interval
        return executor.call(client.getCandles)(request)
    }
    
    public func getLastPrices(figi: [String]) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetLastPricesResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetLastPricesRequest()
        request.figi = figi
        return executor.call(client.getLastPrices)(request)
    }

    public func getOrderBook(figi: String, depth: Int32) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookRequest()
        request.figi = figi
        request.depth = depth
        return executor.call(client.getOrderBook)(request)
    }

    public func getTradingStatus(figi: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusRequest()
        request.figi = figi
        return executor.call(client.getTradingStatus)(request)
    }
}
