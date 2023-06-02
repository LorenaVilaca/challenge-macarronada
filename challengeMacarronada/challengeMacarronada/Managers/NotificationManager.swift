//
//  NotificationManager.swift
//  challengeMacarronada
//
//  Created by LoreVilaca on 01/06/23.
//

import UserNotifications
import SwiftUI

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate{
    
    static let shared: NotificationManager = NotificationManager()
    @Published var pendingRequests: [UNNotificationRequest] = []

    let notificationCenter = UNUserNotificationCenter.current()
    
    private override init(){
        super.init()
        notificationCenter.delegate = self
    }
    
    func requestAuthorization() {
        print(#function)
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                print("Access Granted!")

            } else {
                print("Access Not Granted")
            }
        }
    }
    
    func deleteNotifications(){
        print(#function)
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
    func scheduleTriggerNotification(localNotification: LocalNotification) {
        print(#function)
        let content = UNMutableNotificationContent()
        content.title = localNotification.title
        content.body = localNotification.body
        content.sound = UNNotificationSound.default

        let hours = [0] + Array(8...23)
        for hour in hours {
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = 0
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: localNotification.repeats)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            notificationCenter.add(request)
        }
        
    }

    func printNotifications(){
        print(#function)
        notificationCenter.getPendingNotificationRequests { request in
            for req in request{
                if req.trigger is UNCalendarNotificationTrigger{
                    print((req.trigger as! UNCalendarNotificationTrigger).nextTriggerDate()?.description ?? "invalid next trigger date")
                }
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler(.banner)
    }
}
