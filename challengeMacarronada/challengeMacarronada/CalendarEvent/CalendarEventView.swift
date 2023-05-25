//
//  CalendarEventView.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 25/05/23.
//

import SwiftUI
import Shift
import EventKit

struct CalendarEventView: View {
    @StateObject var eventKitWrapper = Shift.shared
    @State private var selectedEvent: EKEvent?
    
    var body: some View {
        VStack {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(eventKitWrapper.events, id: \.self) { event in
                    Text("\(event.title)")
                }
            }
            .padding()
            .task { // wrap async call inside .task modifier
                try? await eventKitWrapper.fetchEventsForToday()
            }
            Button("adicionar evento", action: myAsyncFunction)
        }
        .padding()
    }
    
    func myAsyncFunction()  {
        Task {
            let startTime = Date.now
            let tomorrow = Date.now.addingTimeInterval(86400)
            let endTime = tomorrow
            try? await Shift.shared.createEvent("Be happy!", startDate: startTime, endDate: endTime)
        }
    }
}

struct CalendarEventView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEventView()
    }
}
