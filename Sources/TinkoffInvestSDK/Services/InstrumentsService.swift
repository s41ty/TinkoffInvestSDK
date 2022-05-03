//
//  InstrumentsService.swift
//  
//
//  Created by Sergey Yuryev on 02.05.2022.
//

import CombineGRPC
import Combine
import GRPC
import CoreGraphics

public class InstrumentsService: BaseService {
    
    // MARK: - Properties
    
    private lazy var client = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsServiceClient(channel: channel)
    
    
    // MARK: - InstrumentsService API
    
    public func shares() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_SharesResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest()
        request.instrumentStatus = .base
        return executor.call(client.shares)(request)
    }
    
    public func getFavorites() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_GetFavoritesResponse, RPCError> {
        return executor.call(client.getFavorites)(.init())
    }
    
    public func editFavorites(figi: String, actionType: Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesActionType) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesRequest()
        var instrument = Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesRequestInstrument()
        instrument.figi = figi
        request.instruments = [instrument]
        request.actionType = actionType
        return executor.call(client.editFavorites)(request)
    }
}
