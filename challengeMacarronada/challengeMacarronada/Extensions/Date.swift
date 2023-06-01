//
//  Date.swift
//  testsCoreData
//
//  Created by Cynara Costa on 30/05/23.
//

import SwiftUI

extension Date {
    
    static func == (lhs: Date, rhs: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.day, .month, .year], from: lhs )
        let components2 = calendar.dateComponents([.day, .month, .year], from: rhs)
        
        return components1.year == components2.year &&
        components1.month == components2.month &&
        components1.day == components2.day
    }
    
}
