//
//  CalendarViewModel.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 26/05/23.
//

import Foundation
import EventKit

class CalendarViewModel: ObservableObject {
    
    var eventStore = EKEventStore()
    @Published var events: [EKEvent] = []
    
    init() {
        requestAccessToCalendar()
    }
    
    func requestAccessToCalendar() {
        eventStore.requestAccess(to: .event) { success, error in
            print(success)
        }
    }
    
    func bestPossibleEKSource() -> EKSource? {
        let `default` = eventStore.defaultCalendarForNewEvents?.source
        let iCloud = eventStore.sources.first(where: { $0.title == "iCloud" }) // this is fragile, user can rename the source
        let local = eventStore.sources.first(where: { $0.sourceType == .local })
        
        return `default` ?? iCloud ?? local
    }

    func todaysEvents() {
        DispatchQueue.main.async {
            
            let newEvent = EKEvent(eventStore: self.eventStore)
            newEvent.title = "PFV só testando ele dnv"
            newEvent.startDate = Date()
            newEvent.endDate = Date()

            let calendar = EKCalendar(for: .event, eventStore: self.eventStore)
                calendar.title = "Cicle"
            guard let source = self.bestPossibleEKSource() else {
                   return
               }
               calendar.source = source
            try! self.eventStore.saveCalendar(calendar, commit: true)

            newEvent.calendar = calendar

            do {
                try self.eventStore.save(newEvent, span: .thisEvent)
              } catch let error as NSError {
                  print("failed to save event with error : \(error)")
              }
            
        }
    }
}
