import SwiftUI
import UserNotifications


struct NotificationView: View {
    @EnvironmentObject var notificationManager: NotificationManager

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

                Button("Add Notifications For Middle Of The Day") {
                    
                    let localNotification = LocalNotification(identifier: UUID().uuidString,
                                                              title: "teste de notificação",
                                                              body: "hello",
                                                              repeats: true)
                    
                    self.notificationManager.scheduleTriggerNotification(localNotification: localNotification)
                    

                    
                }
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
