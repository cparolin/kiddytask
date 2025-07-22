//
//  InsertPasswordView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 22/07/25.
//

import SwiftUI

struct InsertPasswordView: View {
    
    var kidTask: KidTask
    
    @State var password2: String = ""
    
    @AppStorage("password") var password: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showingAlert = false
    

//    @State var kidTask: KidTask?
    
//    @ObservedObject var viewModel = ContentViewModel()
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section(header: Text("Parent Password")){
                        HStack{
                            Text("Enter your password:")
                            SecureField("Enter the parent password here", text: $password2)
                                .keyboardType(.decimalPad)
                        }
                    }
                }
                
                //                if (password2 == password) {
                //                    dismiss()
                //                } else{
                //
                //                }
                
            }
            .alert("Wrong Password, please try again", isPresented: $showingAlert){
                Button("OK", role: .cancel) {}
            }
            .navigationTitle("Parent Password")
            .toolbar {
                ToolbarItem(placement: .confirmationAction){
                    Button("GO!") {
                        if (password2 == password) {
                            viewModel.updateBool(kidTask: kidTask, isDone: true)
                            dismiss()
                        } else {
                            showingAlert = true
                        }
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

//#Preview {
//    InsertPasswordView()
//}
