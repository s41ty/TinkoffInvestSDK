//
//  Date+Extensions.swift
//  
//
//  Created by Sergey Yuryev on 02.05.2022.
//

import SwiftProtobuf
import Foundation

public extension Date {

    var asProtobuf: Google_Protobuf_Timestamp {
        return Google_Protobuf_Timestamp(date: self)
    }
}

public extension Google_Protobuf_Timestamp {
    
    var asDate: Date {
        return Date(timeIntervalSince1970: Double(self.seconds))
    }
}
