//
//  HomeView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 14/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var tarefas: [CGFloat] = [1, 2, 3, 4, 5]
    
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 300))
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 30){
                        Text(Date(), style: .date) //tirar o ano?
                            .font(.system(size: 40).weight(.heavy))
                            .foregroundStyle(Color("TaskPurple"))
                        
                        ForEach(tarefas, id: \.self) { tarefa in
                            TaskRectangleView()
                        }
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
