//
//  Settings.swift
//  KiddyTask
//
//  Created by Camila Parolin on 26/07/25.
//

import SwiftUI

struct ChangeSettings: View {
    
    @AppStorage("kidUsername") var kidUsername: String = ""
    @AppStorage("parentUsername") var parentUsername: String = ""
    @AppStorage("password") var password: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @State private var didSendNotification: Bool = false
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack{
                
                List{
                    Section(header: Text("Enter your information")){
                        HStack{
                            Text("Kiddy Name:")
                            TextField("Insert your kiddy name", text: $kidUsername)
                        }
                        HStack{
                            Text("Parent Name:")
                            TextField("Insert your name", text: $parentUsername)
                        }
                    }
                    Section(header: Text("Parent Password")){
                        HStack{
                            Text("Enter your password:")
                            SecureField("Enter the parent password here", text: $password)
                                .keyboardType(.decimalPad)
                        }
                    }
                    Section(header: Text("Notifications")){
                        HStack{
                            Button {
                                let notification: NotificationModel = NotificationModel(title: "Hi \(kidUsername)!", subtitle: "How about starting your daily tasks now?", body: "Guardian is waiting for you to complete them!")
                                NotificationManagerModel.scheduleNotification(notification: notification, hour: 13, minute: 30, repeating: true)
                                
                                didSendNotification = true
                            } label: {
                                Text("Set notification every day at 1:30pm")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button{
                       dismiss()
                        dismiss()
                        
                    } label: {
                        Text("Go!")
                    }
                }
            }
            
        }
        .alert(isPresented: $didSendNotification) {
            Alert(
                title: Text("Notification Set"),
                message: Text("The notification was set. Close the app to receive it.")
            )
        }
    }
}

#Preview {
    ChangeSettings()
}
