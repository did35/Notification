//
//  ContentView.swift
//  Notification
//
//  Created by Didier Delhaisse on 06/05/2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Tap the button to schedule a notification!")
                .padding()
            
            Button(action: {
                scheduleNotification()
            }, label: {
                Text("Schedule Notification")
            })
        }
        .padding()
    }
    
    // MARK: - Function
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "This is a notification from your app."
        content.sound = UNNotificationSound.default
        
        // Configure the notification trigger for immediate delivery
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // Create a unique identifier for the notification
        let id = UUID().uuidString
        
        // Create the notification request
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        // Add the notification request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully!")
            }
        }
    }
}

#Preview {
    ContentView()
}
