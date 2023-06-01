import SwiftUI
import UserNotifications


struct NotificationView: View {
    
    let notificationManager: NotificationManager = NotificationManager.shared
    var body: some View {
        VStack {
            VStack {
                Button("Request Permission") {
                    //Call a func here don't define it
                    notificationManager.requestAuthorization()
                }
                .frame(width: 200, height: 60, alignment: .center)
                .foregroundColor(.black)
                .background(Color.blue)
                .cornerRadius(10.0)
                .padding()
                Button("Add Notifications For Morning") {
                    //Unique date components
                    var dateComponents = DateComponents()
                    dateComponents.hour = 15
                    dateComponents.minute = 47
                    //Reusable method
//                    self.notificationManager.scheduleTriggerNotification(localNotification: LocalNotification)
                }
                .padding()
                Button("Add Notifications For Middle Of The Day") {
                    
                    let localNotification = LocalNotification(identifier: UUID().uuidString,
                                                              title: "teste de notificação",
                                                              body: "hello",
                                                              repeats: false)
                    
                    self.notificationManager.scheduleTriggerNotification(localNotification: localNotification)
                    
//                    for hour in 8...24 {
//
//                        var dateComponents = DateComponents()
//                        dateComponents.hour = hour
//                        dateComponents.minute = 0
//
//                        self.notificationManager.scheduleTriggerNotification(title: "Middle Of The Day", body: "Did you have your daily run?", categoryIdentifier: "reminder", dateComponents: dateComponents, repeats: false)
//
//                    }

                    //Reusable method

                    
                }
                .padding()
                Button("Add Notifications For Night") {
                    var dateComponents = DateComponents()
                    dateComponents.hour = 15
                    dateComponents.minute = 49
                    //Reusable method
//                    self.notificationManager.scheduleTriggerNotification(title: "Night Time", body: "Time to sleep", categoryIdentifier: "reminder", dateComponents: dateComponents, repeats: false)
                    
                }
                .foregroundColor(.blue)
                .padding()
                
                Button("Print Notifications") {
                    //Reusable method
                    self.notificationManager.printNotifications()
                }
                .foregroundColor(.blue)
                .padding()
                Button("Delete Notifications") {
                    //Reusable method
                    self.notificationManager.deleteNotifications()
                }
                .foregroundColor(.blue)
                .padding()
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
