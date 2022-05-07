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
    
    public func etfs() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_EtfsResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest()
        request.instrumentStatus = .base
        return executor.call(client.etfs)(request)
    }
    
    public func bonds() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_BondsResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest()
        request.instrumentStatus = .base
        return executor.call(client.bonds)(request)
    }
    
    public func currencies() -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_CurrenciesResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest()
        request.instrumentStatus = .base
        return executor.call(client.currencies)(request)
    }
    
    public func shareBy(figi: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_ShareResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest()
        request.id = figi
        request.idType = .figi
        return executor.call(client.shareBy)(request)
    }
    
    public func etfBy(figi: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_EtfResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest()
        request.id = figi
        request.idType = .figi
        return executor.call(client.etfBy)(request)
    }
    
    public func bondBy(figi: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_BondResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest()
        request.id = figi
        request.idType = .figi
        return executor.call(client.bondBy)(request)
    }
    
    public func currencyBy(figi: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_CurrencyResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest()
        request.id = figi
        request.idType = .figi
        return executor.call(client.currencyBy)(request)
    }
    
    public func getInstrumentBy(figi: String) -> AnyPublisher<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentResponse, RPCError> {
        var request = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest()
        request.id = figi
        request.idType = .figi
        return executor.call(client.getInstrumentBy)(request)
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
