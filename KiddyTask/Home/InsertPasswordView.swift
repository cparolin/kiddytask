//
//  InsertPasswordView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 28/07/25.
//

import SwiftUI

struct InsertPasswordView: View {
    
    @AppStorage("password") var password: String = ""
    
    @State var password3: String = ""
    
    @State private var showingAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    @State private var x: Bool = false
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section(header: Text("Parent Password")){
                        HStack{
                            Text("Enter your password:")
                            SecureField("Enter the parent password here", text: $password3)
                                .keyboardType(.decimalPad)
                        }
                    }
                }
            }
            .alert("Wrong Password, please try again", isPresented: $showingAlert){
                Button("OK", role: .cancel) {}
            }
            .navigationTitle("Parent Password")
            .toolbar {
                ToolbarItem(placement: .confirmationAction){
                    Button("GO!") {
                        if (password3 == password) {
                            
                            x.toggle()
                            
//                            dismiss()
                            
                            
                        } else {
                            showingAlert = true
                        }
                            
                    }
                    .navigationDestination(isPresented: $x) {
                        ChangeSettings()
                    }
                    
                    
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            
        }
    }
}

#Preview {
    InsertPasswordView()
}
