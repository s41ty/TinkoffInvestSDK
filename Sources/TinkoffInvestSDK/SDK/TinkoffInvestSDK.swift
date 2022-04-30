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
    
    
    // MARK: - Init
    
    public init(config: TinkoffInvestConfig) {
        self.config = config
    }
    
}
