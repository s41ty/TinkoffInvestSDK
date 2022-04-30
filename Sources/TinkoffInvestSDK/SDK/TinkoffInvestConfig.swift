//
//  TinkoffInvestConfig.swift
//  
//
//  Created by Sergey Yuryev on 28.04.2022.
//

public class TinkoffInvestConfig {
    
    // MARK: - Properties
    
    let token: String
    
    let appName: String
    
    
    // MARK: - Init
    
    public init(token: String, appName: String) {
        self.token = token
        self.appName = appName
    }
}
