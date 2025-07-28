//
//  PageMemoriesView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 16/07/25.
//

import SwiftUI
import PhotosUI

struct PageMemoriesView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var task: KidTask
    
    var body: some View {
        VStack{
            Image("GuardianFelizMemories")
                .padding(.leading, 450)
            ZStack{
                Rectangle()
                    .frame(width: 580, height: 771)
                    .foregroundStyle(Color("MemoriesPurple"))
                
                Rectangle()
                    .frame(width: 560, height: 751)
                    .foregroundStyle(Color.white)
                
                VStack{
                    
                    
                    Text("\(task.name ?? "noName")")
                        .font(.system(size: 60))
                    
                    Text("Date is \(task.taskDate?.formatted(date: .long, time: .omitted) ?? "noData")")
                    
                    Text(task.desc ?? "undefined")
                        .frame(width: 250, height: 50)
                    
                    HStack{
                        VStack{
                            Text("Foto Antes 📷")
                            Image(uiImage: ((UIImage(data: task.imageBefore ?? Data()) ?? UIImage(named: "photoItem")) ?? UIImage()))
                                .resizable()
                                .frame(width: 175, height: 175)
                                .cornerRadius(24)
                        }
                        
                        VStack{
                            Text("Foto Depois 📸")
                            Image(uiImage: ((UIImage(data: task.imageAfter ?? Data()) ?? UIImage(named: "photoItem")) ?? UIImage()))
                                .resizable()
                                .frame(width: 175, height: 175)
                                .cornerRadius(24)
                        }
                    }
                    
                }
                
            }
            .onAppear {
                viewModel.getTask()
//                print(viewModel.kidTasks)
            }
        }
    }
}


//#Preview {
//    PageMemoriesView()
//}
