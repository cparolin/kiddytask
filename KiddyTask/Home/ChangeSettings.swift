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
                }
            }
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button{
                       dismiss()
                    } label: {
                        Text("Go!")
                    }
                }
            }
        }
    }
}

#Preview {
    ChangeSettings()
}
