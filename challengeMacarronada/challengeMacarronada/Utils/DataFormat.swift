//
//  DataFormat.swift
//  testsCoreData
//
//  Created by Cynara Costa on 30/05/23.
//

import SwiftUI

class DataFormat {
    
    func formatCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
    
    func getHourString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "H"
        return formatter.string(from: date)
    }
    
}
