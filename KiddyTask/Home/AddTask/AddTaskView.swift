//
//  AddTaskView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 15/07/25.
//

import SwiftUI
import PhotosUI

struct AddTaskView: View {
    @StateObject var viewModel = ContentViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = "Task Name"
    @State var date = Date.now
    @State var pickerImage: PhotosPickerItem?
    @State var photoItem2: PhotosPickerItem?
    @State var imageBefore: UIImage?
    @State var imageAfter: UIImage?
    @State var desc: String = ""
    @State var isDone: Bool = false
    @State var taskTime: Int16 = 0
    @State var why: String = ""
    
    @State private var showingAlert = false
    
    var body: some View {
        
        NavigationStack{
            VStack {
                HStack {
                    //                VStack {
                    //                    Spacer()
                    //                        .frame(width: 50)
                    
                    
                    //                Divider()
                    VStack{
                        Text("Before Pic 📷")
                            .font(.system(size: 20).weight(.semibold))
                        
                        Spacer()
                            .frame(height: 8)
                        
                        PhotosPicker(selection: $photoItem2, matching: .images){
                            ImageAddPicture2(photoItem2: $photoItem2)
                        }
                        if imageBefore != nil{
                            Image(uiImage: imageBefore!)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .scaledToFill()
                                .cornerRadius(20)
                        }
                        
                        
                        
                        TextField("Task Description!", text: $desc, axis: .vertical)
                            .frame(width: 250, height: 50)
                            .font(.system(size: 20).weight(.semibold))
                            .multilineTextAlignment(.center)
                            .lineLimit(5)
                        //                    .border(.red)
                    }
//                    Spacer()
//                        .frame(width: 10)
                    
                    VStack{
                        Text("Date to do the task:")
                            .font(.system(size: 20).weight(.semibold))
                        
                        HStack{
                            //                    Spacer()
                            //                        .frame(width: 100)
                            DatePicker(selection: $date,  displayedComponents: .date){
                            }
                            .navigationTitle($name)
                            .navigationBarTitleDisplayMode(.inline)
                            Spacer()
                                .frame(width: 100)
                        }
                    }
                }
                
//                Divider()
                
                HStack{
                    Text("Why is important to do this task?")
                        .font(.system(size: 20).weight(.semibold))
                    Image("guardianDuvida")
                        .padding()
                }
                
                TextField("Insert yout answer!", text: $why, axis: .vertical)
                    .frame(width: 250, height: 50)
                    
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
//                    .border(.red)

//                Divider()
                
                Text("Time to conclude this task (in minutes) ⏰")
                    .font(.system(size: 20).weight(.semibold))
                
                TextField("Enter your time", value: $taskTime, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 100, height: 30)
                
                
                
            }
            .alert("You need to add an Image!", isPresented: $showingAlert){
                Button("OK", role: .cancel) {}
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction){
                    Button("Add") {
                        if imageBefore != nil {
                            viewModel.createTask(taskDate: date, desc: desc, imageAfter: imageAfter ?? UIImage(), imageBefore: imageBefore ?? UIImage(), isDone: isDone, name: name, taskTime: taskTime, why: why)
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
            .onChange(of: photoItem2){ oldValue, newValue in
                Task {
                    guard let imageData = try await photoItem2?.loadTransferable(type: Data.self) else {return}
                    guard let inputImage = UIImage(data: imageData) else {return}
                    imageBefore = inputImage
                }
                
            }
        }
    }
}

#Preview {
    AddTaskView()
}
