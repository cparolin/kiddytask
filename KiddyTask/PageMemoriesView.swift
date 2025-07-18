//
//  PageMemoriesView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 16/07/25.
//

import SwiftUI

struct PageMemoriesView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var task: KidTask?
    
    
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
                    if task != nil {
                        
                        Text("Tarefa 2")
                            .font(.system(size: 60))
                        
                    //data
                    
                    Text(task!.desc ?? "undefined")
                        .frame(width: 250, height: 50)
                        
                        HStack{
                            Text("Foto Antes 📷")
                            
                            Text("Foto Depois 📸")
                        }
                        
                    }
                    
                }
                .onAppear {
                    viewModel.getTask()
                    print(viewModel.tasks)
                }
            }
        }
    }
}

#Preview {
    PageMemoriesView()
}
