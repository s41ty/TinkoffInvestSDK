//
//  StopOrdersService.swift
//  
//
//  Created by Sergey Yuryev on 02.05.2022.
//

import CombineGRPC
import Combine
import GRPC

public class StopOrdersService: BaseService {
    
    // MARK: - Properties
    
    private lazy var client = Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClient(channel: channel)
    
    
    // MARK: - StopOrdersService API
    
    
    
}
