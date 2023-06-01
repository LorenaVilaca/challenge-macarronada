import SwiftUI

struct RatingCircleComponent: View {
    
    @State var circleRating: Int
    @EnvironmentObject var graphDayViewModel: GraphViewModel
    
    var whichValue: typeOfFilter
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            HStack (spacing: 8) {
                
                whichValue.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .frame(alignment: .leading)
                
                Text(whichValue.text).headerThree()
                    .frame(alignment: .leading)
                
                
            }
            
            
            SelectAvaliationCircle(whichValue: whichValue, rating: $circleRating)
                .environmentObject(graphDayViewModel)
        }
        
    }
    
}
