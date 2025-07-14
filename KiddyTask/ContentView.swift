//
//  ContentView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Text("Memories")
                .tabItem{
            Label("Memories", systemImage: "book")
        }
            HomeView()
                .tabItem{
            Label("Home", systemImage: "book")
        }
            Text("Guardian")
                .tabItem{
            Label("Guardian", systemImage: "book")
        }
        }
    }
}

#Preview {
    ContentView()
}
