//
//  MemoriesView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 16/07/25.
//

import SwiftUI

struct MemoriesView: View {

    var body: some View {
        
        NavigationStack() {
            VStack{
                NavigationLink(destination: PageMemoriesView()) {
                    ZStack{
                        Image("Caderno")
                        Text("Camila")
                            .font(.system(size: 60))
                            .foregroundStyle(Color("MemoriesPurple"))
                            .padding(.bottom, 140)
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
