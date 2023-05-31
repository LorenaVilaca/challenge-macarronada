import SwiftUI

enum hours: CaseIterable, Identifiable, CustomStringConvertible {
    
    case eight
    case nine
    case ten
    case eleven
    case twelve
    case thirteen
    case fourteen
    case fifteen
    case sixteen
    case seventeen
    case eighteen
    case nineteen
    case twenty
    case twentyOne
    case twentyTwo
    case twentyThree
    case twentyFour
    
    var id: Self { self }
    
    var description: String {
        
        switch self {
        
        case .eight:
            return "8h"
        
        case .nine:
            return "9h"
            
        case .ten:
            return "10h"
            
        case .eleven:
            return "11h"
            
        case .twelve:
            return "12h"
            
        case .thirteen:
            return "13h"
            
        case .fourteen:
            return "14h"
            
        case .fifteen:
            return "15h"
            
        case .sixteen:
            return "16h"
            
        case .seventeen:
            return "17h"
            
        case .eighteen:
            return "18h"
            
        case .nineteen:
            return "19h"
            
        case .twenty:
            return "20h"
            
        case .twentyOne:
            return "21h"
            
        case .twentyTwo:
            return "22h"
            
        case .twentyThree:
            return "23h"
            
        case .twentyFour:
            return "24h"
            
        }
        
    }
    
}
