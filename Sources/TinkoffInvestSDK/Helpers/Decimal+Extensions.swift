//
//  Decimal+Extensions.swift
//  
//
//  Created by Sergey Yuryev on 03.05.2022.
//

import Foundation

public extension Decimal {

    func rounded(_ roundingMode: NSDecimalNumber.RoundingMode = .bankers) -> Decimal {
        var result = Decimal()
        var number = self
        NSDecimalRound(&result, &number, 0, roundingMode)
        return result
    }
    var whole: Decimal { self < 0 ? rounded(.up) : rounded(.down) }
    var fraction: Decimal { self - whole }

    var asQuotation: Tinkoff_Public_Invest_Api_Contract_V1_Quotation {
        var model = Tinkoff_Public_Invest_Api_Contract_V1_Quotation()
        model.units = (self as NSDecimalNumber).int64Value
        model.nano = (self.fraction * 1_000_000_000 as NSDecimalNumber).int32Value
        return model
    }
}

public extension Tinkoff_Public_Invest_Api_Contract_V1_Quotation {
    var asDecimal: Decimal {
        let value = Decimal(units) + Decimal(sign: nano.signum() == -1 ? .minus : .plus , exponent: -9, significand: Decimal(nano))
        return value
    }
}
