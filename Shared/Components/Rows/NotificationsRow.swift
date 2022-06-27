//
//  NotificationsRow.swift
//  CombineAndData (iOS)
//
//  Created by Борис Ларионов on 28.01.2022.
//

import SwiftUI

struct NotificationsRow: View {
    @StateObject private var notificationVM = NotificationViewModel()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        Group {
            if notificationVM.permission == .authorized {
                Toggle(isOn: $notificationVM.subscribedToAllNotifications) {
                    HStack (spacing: 12){
                        GradientIcon(icon: "bell.fill")
                        
                        VStack (alignment: .leading) {
                            Text("Notify me of new content")
                                .font(.subheadline.weight(.semibold))
                            
                            Text("Max once a week")
                                .font(.caption2)
                                .opacity(0.7)
                        }
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.4212473631, green: 0.4374457002, blue: 0.8710209727, alpha: 1))))
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Notifications are disabled")
                        .font(.subheadline.weight(.bold))
                    
                    Text("We can't notify you when new content is available")
                        .font(.caption2)
                        .opacity(0.7)
                    
                    
                    
                    Link(destination: URL(string: UIApplication.openSettingsURLString)!) {
                        Text("Open settings")
                            .font(.subheadline.weight(.semibold))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .onAppear {
            notificationVM.getNotificationSetting()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                notificationVM.getNotificationSetting()
            }
        }
    }
}

struct NotificationsRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsRow()
    }
}
