//
//  Settings.swift
//  KiddyTask
//
//  Created by Camila Parolin on 26/07/25.
//

import SwiftUI

struct ChangeSettings: View {
    
    @ObservedObject var viewModel = CoreDataViewModel()
    
    @AppStorage("kidUsername") var kidUsername: String = ""
    @AppStorage("parentUsername") var parentUsername: String = ""
    @AppStorage("password") var password: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @State private var didSendNotification: Bool = false
    @State var reminders = false
    @State var reminderTime = Date.now
    
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
                    //                    Section(header: Text("Notifications")){
                    //                        HStack{
                    //                            Button {
                    //                                let notification: NotificationModel = NotificationModel(title: "Hi \(kidUsername)!", subtitle: "How about starting your daily tasks now?", body: "Guardian is waiting for you to complete them!")
                    //                                NotificationManagerModel.scheduleNotification(notification: notification, hour: 13, minute: 30, repeating: true)
                    //
                    //                                didSendNotification = true
                    //                            } label: {
                    //                                Text("Set notification every day at 1:30pm")
                    //                            }
                    //                        }
                    Text("Crie notificações")
                    Toggle("Notificações Semanais", isOn: $reminders)
                    
                    if reminders {
                        DatePicker("Time", selection: $reminderTime, displayedComponents: .hourAndMinute)
                    }
                    
                    HStack {
                        Button {
                            for scheduledNotification in viewModel.scheduledNotifications {
                                NotificationManagerModel.cancelScheduledNotification(scheduledNotification: scheduledNotification)
                                viewModel.deleteScheduledNotification(scheduledNotification: scheduledNotification)
                            }
                            viewModel.scheduledNotifications.removeAll()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 40)
                                    .frame(width: 210, height: 45)
                                    .foregroundStyle(.gray)
                                Text("Desativar Notificações")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                        }
                        
                        Button {
                            print(reminders)
                            if reminders {
                                let notification: NotificationModel = NotificationModel(title: "Hi \(kidUsername)!", subtitle: "How about starting your daily tasks now?", body: "Guardian is waiting for you to complete them!")
                                let calendar = Calendar.current
                                let hour = calendar.component(.hour, from: reminderTime)
                                let minute = calendar.component(.minute, from: reminderTime)
                                
                                NotificationManagerModel
                                    .scheduleRepeatingNotification(notification: notification, hour: hour, minute: minute, interval: 86400)
                                
                                didSendNotification = true
//                                dismiss()
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 40)
                                    .frame(width: 80, height: 45)
                                    .foregroundStyle(.orange)
                                Text("Salvar")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                        }
                        //                    }
                    }
                    Spacer()
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
            .onAppear {
                viewModel.getNotifications()
            }
        }
    }
}
    
//    #Preview {
//        ChangeSettings()
//    }
