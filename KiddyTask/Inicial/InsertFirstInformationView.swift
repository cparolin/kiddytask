//
//  InsertFirstInformationView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 21/07/25.
//

import SwiftUI

struct InsertFirstInformationView: View {
    
    @AppStorage("kidUsername") var kidUsername: String = ""
    @AppStorage("parentUsername") var parentUsername: String = ""
    @AppStorage("password") var password: String = ""
//    @State private var path = NavigationPath()
    @AppStorage("tapGo") var tapGo: Bool = false
    
    var body: some View {
        
        NavigationStack(/*path: $path*/) {
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
//                .frame(width: 800)
            }
            .navigationTitle("Let's Start!")
//            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button{
                        tapGo = true
                    } label: {
                        Text("Go!")
                    }
                }
            }
            
        }
    }
}

#Preview {
    InsertFirstInformationView()
}
