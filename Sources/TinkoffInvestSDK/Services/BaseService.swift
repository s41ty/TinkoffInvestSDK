//
//  BaseService.swift
//  
//
//  Created by Sergey Yuryev on 28.04.2022.
//

import CombineGRPC
import Combine
import GRPC

private enum Constants {
    static let url = "invest-public-api.tinkoff.ru"
    static let port = 443
}

public class BaseService {
    
    // MARK: - Properties
    
    private let config: TinkoffInvestConfig
    
    private let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
    
    private lazy var defaulCallOptions = CurrentValueSubject<CallOptions, Never>(
        CallOptions(customMetadata: ["Authorization": "Bearer \(config.token)", "x-app-name": config.appName])
    ).eraseToAnyPublisher()

    lazy var channel = try! GRPCChannelPool.with(target: .hostAndPort(Constants.url, Constants.port), transportSecurity: .tls(.makeClientConfigurationBackedByNIOSSL()), eventLoopGroup: group)
    
    lazy var executor = GRPCExecutor(callOptions: defaulCallOptions)
    
    
    // MARK: - Init
    
    init(config: TinkoffInvestConfig) {
        self.config = config
    }
    
    deinit {
        try? group.syncShutdownGracefully()
    }
}
