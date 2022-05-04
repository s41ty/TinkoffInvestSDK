//
//  File.swift
//  
//
//  Created by Sergey Yuryev on 04.05.2022.
//

import Foundation

public extension Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue {
    
    var asString: String {
        let value = Decimal(units) + Decimal(sign: nano.signum() == -1 ? .minus : .plus , exponent: -9, significand: Decimal(nano))
        return "\(value) \(currency.uppercased())"
    }
    
    var asDecimal: Decimal {
        let value = Decimal(units) + Decimal(sign: nano.signum() == -1 ? .minus : .plus , exponent: -9, significand: Decimal(nano))
        return value
    }
}
