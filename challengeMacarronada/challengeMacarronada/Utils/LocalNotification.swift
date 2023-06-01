//
//  LocalNotification.swift
//  challengeMacarronada
//
//  Created by LoreVilaca on 30/05/23.
//

import Foundation

struct LocalNotification {
    var identifier: String
    var title: String
    var body: String
    var repeats: Bool
    
    
    internal init(identifier: String,
                  title: String,
                  body: String,
                  repeats: Bool) {
        self.identifier = identifier
        self.title = title
        self.body = body
        self.repeats = repeats
    }
}
