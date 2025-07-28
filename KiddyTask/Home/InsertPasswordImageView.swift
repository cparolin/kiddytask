//
//  InsertPasswordView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 22/07/25.
//

import SwiftUI
import PhotosUI

struct InsertPasswordImageView: View {
    
    var kidTask: KidTask
    
    @State var password2: String = ""
    
    @AppStorage("password") var password: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showingAlert = false
    
  
    
    @State var pickerImage: PhotosPickerItem?
    @State var imageAfter: UIImage?
    
    @State var photoItem: PhotosPickerItem?
    

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
                
                Text("Enter the picture you took after conclude your task!")
                
                PhotosPicker(selection: $photoItem, matching: .images) {
                    ImageAddPicture(photoItem: $photoItem)
                }
                if imageAfter != nil{
                    Image(uiImage: imageAfter!)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFill()
                        .cornerRadius(20)
                }
                
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
                            viewModel.updateImageAfter(kidTask: kidTask, imageAfter: imageAfter ?? UIImage())
                            
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
        .onChange(of: photoItem) { oldValue, newValue in
            Task {
                guard let imageData = try await photoItem?.loadTransferable(type: Data.self) else { return }
                guard let inputImage = UIImage(data: imageData) else { return }
                imageAfter = inputImage
                
            }
        }
    }
}

//#Preview {
//    InsertPasswordImageView()
//}
