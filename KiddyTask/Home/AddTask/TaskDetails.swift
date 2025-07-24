//
//  TaskDetails.swift
//  KiddyTask
//
//  Created by Camila Parolin on 23/07/25.
//

import SwiftUI

struct TaskDetails: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    @State var task: KidTask
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    VStack{
                        Text("Picture Before 📷")
                        
                        Image(uiImage: ((UIImage(data: task.imageBefore ?? Data()) ?? UIImage(named: "photoItem")) ?? UIImage()))
                            .resizable()
                            .frame(width: 175, height: 175)
                            .cornerRadius(24)
                            
                    }
                    .padding()
                    
                    VStack{
                        HStack{
                            Text("Why it's important to do this task?")
                                .frame(width: 300, height: 100)
                            Image("guardianDuvida")
                        }
//                        .padding()
                        
                        Text(task.why ?? "noAnswer")
                            .frame(width: 300, height: 100)
                            .border(.red)
                        
                        Text("Task Description 🖍️")
                            .frame(width: 200, height: 100)
                        
                        Text(task.desc ?? "noDescriptionposs")
                            .frame(width: 300, height: 100)
                            .border(.red)
                    }
                    .padding(.leading, 235)
                }
                .padding(.bottom, 100)
                
                
                HStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 370, height: 330)
                            .foregroundStyle(Color("FrontYellow"))
                        VStack{
                            Text("Date to do the task 📅")
                        }
                    }
                    .padding(.trailing, 30)
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 370, height: 330)
                            .foregroundStyle(Color("FrontYellow"))
                        
                        VStack{
                            Text("Time to do this task ⏰")
                        }
                    }
                }
                
            }
            
            .navigationTitle("name")
        }
    }
}

//#Preview {
//    TaskDetails()
//}
