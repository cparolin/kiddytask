//
//  GuardianView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 25/07/25.
//

import SwiftUI

struct GuardianView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
//    var kidTasks: [KidTask] = []
 
    @AppStorage("kidUsername") var kidUsername: String = ""
    
    var guardianNum: Int {
        viewModel.kidTasks.reduce(0) { count, task in
            count + (task.isDone ? 1 : 0)
        }
    }
    
//    var x: Int {
//        viewModel.kidTasks.filter { $0.isDone }.count
//    }
    
    var body: some View {
        NavigationStack{
            VStack{
                //            Text("\(viewModel.getTaskCount() / 2)")
                //            Text("\(viewModel.getTaskCount()), x = \(x), outro = \(guardianNum)")
                if viewModel.getTaskCount(todayOnly: true) == guardianNum {
                    VStack {
                        Image ("GuardianGrande")
                        Text ("""
                    Congratulations, \(kidUsername)!
                    Your parents told me that you completed all your activities today — your home looks beautiful!
                    It must be wonderful to have you in the family. How about giving your parents a big hug?
                    """)
                        .frame(width: 700, height: 350)
                        //                        .border(.red)
                        .font(.system(size: 30).weight(.medium))
                        
                    }
                } else if guardianNum >= viewModel.getTaskCount(todayOnly: true) / 2 && guardianNum != 0 {
                    VStack{
                        Image("GuardianSemiGrande")
                        Text ("""
                            \(kidUsername) is almost there!
                            Your parents told me that you're very close to finishing all your activities for today!
                            I'm sure \(kidUsername) can do it!
                            """)
                        .frame(width: 700, height: 350)
                        //                    .border(.red)
                        .font(.system(size: 30).weight(.medium))
                        
                    }
                } else if guardianNum < viewModel.getTaskCount(todayOnly: true) / 2 && guardianNum != 0 {
                    VStack{
                        Image("GuardianQuaseGrande")
                        Text ("""
                                \(kidUsername) has already started their activities!
                                Now they just need to keep going, and their tasks will be done in no time!
                                I believe in you, (kidUsername)!       
                                """)
                        .frame(width: 700, height: 350)
                        //                    .border(.red)
                        .font(.system(size: 30).weight(.medium))
                        
                    }
                } else {
                    VStack{
                        Image("GuardianTristeGrande")
                        Text ("""
                            \(kidUsername) hasn't started their activities yet?
                            How strange! That’s their responsibility.
                            Do you think they’ll be able to complete their tasks?
                            Why haven’t they started yet?
                            They’re so brave!
                            
                            """)
                        .frame(width: 700, height: 350, alignment: .center)
                        //                    .border(.red)
                        .font(.system(size: 30).weight(.medium))
                        
                    }
                }
            }
            .navigationTitle("Guardian")
        }
        .onAppear{
            viewModel.getTask()
        }
    }
}

//#Preview {
//    GuardianView()
//}


//Text(viewModel.getTaskCount(), format: .number)
