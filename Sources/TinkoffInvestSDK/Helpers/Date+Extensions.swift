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
