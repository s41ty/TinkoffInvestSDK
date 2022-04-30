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
    
    public lazy var userService: UsersService = UsersService(config: config)
    
    
    // MARK: - Init
    
    public init(config: TinkoffInvestConfig) {
        self.config = config
    }
    
}
