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
    
    @State var timeRemaining: Int
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isStart: Bool = false
    
    init(viewModel: ContentViewModel = ContentViewModel(), task: KidTask, timeRemaining: Int) {
        self.viewModel = viewModel
        self.task = task
        self.timeRemaining = Int(task.taskTime * 60)
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    VStack{
                        Text("Picture Before 📷")
                        
                        Image(uiImage: ((UIImage(data: task.imageBefore ?? Data()) ?? UIImage(named: "photoItem")) ?? UIImage()))
                            .resizable()
                            .frame(width: 350, height: 350)
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
                        //                            .border(.red)
                        
                        Text("Task Description 🖍️")
                            .frame(width: 200, height: 100)
                        
                        Text(task.desc ?? "noDescriptionposs")
                            .frame(width: 300, height: 100)
                        //                            .border(.red)
                    }
                    .padding(.leading, 30)
                }
                .padding(.bottom, 100)
                
                
                HStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 370, height: 330)
                            .foregroundStyle(Color("FrontYellow"))
                        VStack{
                            Text("Date to do the task 📅")
                            Text("\(task.taskDate?.formatted(date: .long, time: .omitted) ?? "noData")")
                        }
                    }
                    .padding(.trailing, 30)
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 370, height: 330)
                            .foregroundStyle(Color("FrontYellow"))
                        
                        VStack{
                            Text("Time to do this task ⏰")
                            
                            Text(timeString(from: Int(timeRemaining)))
                                .onReceive(timer) { time in
                                    if isStart{
                                        if timeRemaining > 0 {
                                            timeRemaining -= 1
                                        }
                                    }
                                }
                            
                            //                            Button("\(timeRemaining)") {
                            //                                timer.connect()
                            //                            }
                            //                            Button {
                            //                                timer.connect()
                            //                            } label: {
                            //                                Image(systemName: "play.circle.fill")
                            //                                Text("\(timeRemaining)")
                            //                            }
                            
                            Button (action: {
                                
                                isStart.toggle()
                                
                            }, label: {
                                Text( isStart ? "Stop" : "Start")
                            })
                        }
                    }
                }
                
            }
            
            .navigationTitle(task.name ?? "noName")
        }
    }
}

//#Preview {
//    TaskDetails()
//}
