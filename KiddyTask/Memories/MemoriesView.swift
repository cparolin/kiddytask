//
//  MemoriesView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 16/07/25.
//

import SwiftUI

struct MemoriesView: View {
    
    @AppStorage("kidUsername") var kidUsername: String = ""

    var body: some View {
        
        NavigationStack() {
            VStack{
                NavigationLink(destination: PagesCarousel() /*PageMemoriesView()*/) {
                    ZStack{
                        Image("Caderno")
                        Text("\(kidUsername)'s")
                            .font(.system(size: 60))
                            .foregroundStyle(Color("MemoriesPurple"))
                            .padding(.bottom, 430)
                    }
                }
            }
            .navigationTitle("Memories")
        }
        
    }
}

#Preview {
    MemoriesView()
}
