//
//  PagesCarousel.swift
//  KiddyTask
//
//  Created by Camila Parolin on 23/07/25.
//

import SwiftUI

struct PagesCarousel: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    init() {
        #if canImport(UIKit)
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("CarouselColor"))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color("PagePassColor"))
        #endif
    }
    
    var body: some View {
        NavigationStack{
            TabView{
                ForEach(viewModel.kidTasks, id: \.self) { kidTask in
//                    if Calendar.current.isDate(kidTask.taskDate, equalTo: Date.now, toGranularity: .day) {
                        PageMemoriesView(task: kidTask)
                            .tabItem{
                                Label(kidTask.name ?? "", systemImage: "circle.fill")
                                    .foregroundStyle(Color("CarouselColor"))
                            }
//                    }
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
