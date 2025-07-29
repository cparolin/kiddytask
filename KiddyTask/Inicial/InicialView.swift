//
//  InicialView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 21/07/25.
//

import SwiftUI

struct InicialView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Welcome to Kiddy Task")
                    .font(.system(size: 60))
                    .foregroundStyle(Color("TaskPurple"))
                    .padding(.bottom, 100)
                
                Image("GuardianGrande")
                
                NavigationLink(destination: InsertFirstInformationView()) {
                    Text("Click here to start!")
                        .font(.system(size: 40))
                        .foregroundStyle(Color("TaskPurple"))
                }
                .padding(.top, 100)
            }
            .onAppear {
                NotificationManagerModel.requirePermissions()
            }
            
        }
       
    }
}

#Preview {
    InicialView()
}
