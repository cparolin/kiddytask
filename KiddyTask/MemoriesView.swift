//
//  MemoriesView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 16/07/25.
//

import SwiftUI

struct MemoriesView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: PageMemoriesView()) {
                    Image("Caderno")
                }
            }
            .navigationTitle("Memories")
        }
        
    }
}

#Preview {
    MemoriesView()
}
