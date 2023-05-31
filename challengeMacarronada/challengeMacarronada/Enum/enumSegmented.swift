import SwiftUI

enum segmented: CaseIterable, Identifiable, CustomStringConvertible {
    
    case now
    case previous
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .now:
            return "Agora"
        case .previous:
            return "Anteriores"
        }
        
    }
    
}
