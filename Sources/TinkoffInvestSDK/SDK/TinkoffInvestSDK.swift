//
//  TinkoffInvestSDK.swift
//
//
//  Created by Sergey Yuryev on 28.04.2022.
//

import Combine

public class TinkoffInvestSDK: ObservableObject {
    
    // MARK: - Properties
    
    private let config: TinkoffInvestConfig
    
    public lazy var usersService: UsersService = UsersService(config: config)
    
    public lazy var operationsService: OperationsService = OperationsService(config: config)
    
    public lazy var sandboxService: SandboxService = SandboxService(config: config)
    
    public lazy var marketDataService: MarketDataService = MarketDataService(config: config)
    
    public lazy var instrumentsService: InstrumentsService = InstrumentsService(config: config)
    
    public lazy var ordersService: OrdersService = OrdersService(config: config)
    
    public lazy var stopOrders: StopOrdersService = StopOrdersService(config: config)

    
    // MARK: - Init
    
    public init(config: TinkoffInvestConfig) {
        self.config = config
    }
}
