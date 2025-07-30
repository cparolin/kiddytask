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
//                .padding(.top, 150)
            ZStack{
                Rectangle()
                    .frame(width: 580, height: 771)
                    .foregroundStyle(Color("MemoriesPurple"))
                
                Rectangle()
                    .frame(width: 560, height: 751)
                    .foregroundStyle(Color.white)
                
                VStack{
                    
                    
                    Text("\(task.name ?? "noName")")
                        .font(.system(size: 60).weight(.semibold))
                        .frame(width: 500, height: 80)
//                        .border(.red)
                        .padding(.bottom, 50)
                        .foregroundStyle(Color("MemoriesText"))
                        
                    Text("Date is \(task.taskDate?.formatted(date: .long, time: .omitted) ?? "noData")")
                        .font(.system(size: 20).weight(.medium))
                        .frame(width: 400, height: 50)
//                        .border(.red)
                        .padding(.bottom, 50)
                        .foregroundStyle(Color("MemoriesText"))
                    
                    Text(task.desc ?? "undefined")
                        .font(.system(size: 20))
                        .frame(width: 400, height: 100)
//                        .border(.red)
                        .padding(.bottom, 50)
                        .foregroundStyle(Color("MemoriesText"))
                    
                    HStack{
                        VStack{
                            Text("Before Pic 📷")
                                .padding(.bottom, 30)
                                .font(.system(size: 20).weight(.medium))
                                .foregroundStyle(Color("MemoriesText"))
                            
                            Image(uiImage: ((UIImage(data: task.imageBefore ?? Data()) ?? UIImage(named: "photoItem")) ?? UIImage()))
                                .resizable()
                                .frame(width: 175, height: 175)
                                .cornerRadius(24)
                        }
                        .padding(.trailing, 80)
                        
                        VStack{
                            Text("After Pic 📸")
                                .foregroundStyle(Color("MemoriesText"))
                                .padding(.bottom, 30)
                                .font(.system(size: 20).weight(.medium))
                            
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
