//
//  PagesCarousel.swift
//  KiddyTask
//
//  Created by Camila Parolin on 23/07/25.
//

import SwiftUI

struct PagesCarousel: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack{
            TabView{
                ForEach(viewModel.kidTasks, id: \.self) { kidTask in
                    
                        PageMemoriesView(task: kidTask)
                        .tabItem{
                            Label(kidTask.name ?? "", systemImage: "book")
                        }
                }
                
            }
            .tabViewStyle(.page)
        }
        .onAppear {
            viewModel.getTask()
        }
    }
}

#Preview {
    PagesCarousel()
}
