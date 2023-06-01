////
////  NotificationManager.swift
////  challengeMacarronada
////
////  Created by LoreVilaca on 29/05/23.
////
//
////import SwiftUI
//import UserNotifications
//
//
//
//@MainActor
//class LocalNotificationManager: NSObject, ObservableObject {
//
//    let notificationCenter = UNUserNotificationCenter.current()
//    @Published var pendingRequests: [UNNotificationRequest] = []
//
//
//    func requestAuthorization () {
//        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//        notificationCenter.requestAuthorization(options: options) { granted, error in
//            if let error = error {
//                print("ERROR: \(error)")
//            } else {
//                print("SUCCESS")
//            }
//        }
//
//    }
//
//    func scheduleNotification (localNotification: LocalNotification) {
//        let content = UNMutableNotificationContent()
//
//        content.title = localNotification.title
//        content.body = localNotification.body
//        content.sound = .default
//
//
//
//        let startHour = 8
//        let endHour = 24
//        dateComponents.timeZone = .autoupdatingCurrent
//
//        for hour in startHour...endHour {
//            dateComponents.hour = hour
//            let trigger = UNCalendarNotificationTrigger (dateMatching: dateComponents,
//                                                         repeats: localNotification.repeats)
//            let request = UNNotificationRequest(identifier: localNotification.identifier, content: content, trigger: trigger)
//            try? await notificationCenter.add(request)
//            print ("chegou aqui")
//            print (trigger.nextTriggerDate() ?? "erro")
//        }
//
//    }
//
//    func clearRequests () {
//        notificationCenter.removeAllPendingNotificationRequests()
//        pendingRequests.removeAll()
//    }
//
//}
