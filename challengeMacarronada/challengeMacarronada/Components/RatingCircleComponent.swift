import SwiftUI

struct RatingCircleComponent: View {
    
    @State var circleRating: Int
    @EnvironmentObject var graphDayViewModel: GraphViewModel
    
    var whichValue: typeOfFilter
    
    var body: some View {
        
        VStack {
            
            Text(whichValue.text).headerThree()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            
            SelectAvaliationCircle(whichValue: whichValue, rating: $circleRating)
                .frame(maxWidth: .infinity, alignment: .leading)
                .environmentObject(graphDayViewModel)
        }
        .padding()
        
    }
    
}
