//
//  NotificationViewModel.swift
//  CombineAndData (iOS)
//
//  Created by Борис Ларионов on 29.01.2022.
//

import SwiftUI
import UserNotifications
import Firebase
import FirebaseMessaging

class NotificationViewModel: ObservableObject {
    @Published var permission: UNAuthorizationStatus?
    @AppStorage("subscribedToAllNotifications") var subscribedToAllNotifications: Bool = false {
        didSet {
            if subscribedToAllNotifications {
                subscribeToAllTopics()
            } else {
                unSubscribeFromAllTopics()
            }
        }
    }
    
    func getNotificationSetting() {
        UNUserNotificationCenter.current().getNotificationSettings() { permission in
            DispatchQueue.main.async {
                self.permission = permission.authorizationStatus
            }
            
            if self.subscribedToAllNotifications {
                self.subscribeToAllTopics()
            } else {
                self.unSubscribeFromAllTopics()
            }
            if permission.authorizationStatus == .authorized {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                DispatchQueue.main.async {
                    UIApplication.shared.unregisterForRemoteNotifications()
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                }
                self.unSubscribeFromAllTopics()
            }
        }
    }
    
    private func subscribeToAllTopics() {
        guard permission == .authorized else { return }
        
        Messaging.messaging().subscribe(toTopic: "all") { error in
            if let error = error {
                print("Error while subscribing", error)
                return
            }
            print("Subscribe to notifications for all topics")
        }
    }
    
    private func unSubscribeFromAllTopics() {
        Messaging.messaging().unsubscribe(fromTopic: "all") { error in
            if let error = error {
                print("Error while unSubscribing", error)
                return
            }
            print("Unsubscribe to notifications for all topics")
        }
    }
}
