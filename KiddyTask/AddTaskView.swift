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
    @State var imageBefore: UIImage?
    @State var imageAfter: UIImage?
    @State var desc: String = ""
    @State var isDone: Bool = false
    @State var clock = Date.now
    @State var why: String = ""
    
    @State private var showingAlert = false
    
    var body: some View {
        
        NavigationStack{
            VStack{
                DatePicker(selection: $date,  displayedComponents: .date){
                    Text("Select a date") //deixar centralizado
                }
                .navigationTitle($name)
                .navigationBarTitleDisplayMode(.inline)
                
                Text("Foto Antes 📷")
                
                PhotosPicker("Choose a picture!", selection: $pickerImage, matching: .images)
                if imageBefore != nil{
                    Image(uiImage: imageBefore!)
                        .resizable()
                        .frame(width: 320, height: 320)
                        .scaledToFill()
                        .cornerRadius(20)
                }
                
                TextField("Task Description!", text: $desc, axis: .vertical)
                    .frame(width: 500, height: 100)
                    .multilineTextAlignment(.center)
                    .lineLimit(5)
                
                HStack{
                    Text("Why is important to do this task?")
                    Image("guardianDuvida")
                        .padding()
                }
                
                TextField("Insert yout answer!", text: $why, axis: .vertical)
                    .frame(width: 500, height: 100)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)

                Text("Time to conclude this task ⏰")
                
            }
            .alert("You need to add an Image!", isPresented: $showingAlert){
                Button("OK", role: .cancel) {}
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction){
                    Button("Add") {
                        if imageBefore != nil {
                            viewModel.createTask(date: date, desc: desc, imageAfter: imageAfter!, imageBefore: imageBefore!, isDone: isDone, name: name, clock: clock, why: why)
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
            .onChange(of: pickerImage){ oldValue, newValue in
                Task {
                    guard let imageData = try await pickerImage?.loadTransferable(type: Data.self) else {return}
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
