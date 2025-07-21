//
//  ContentView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("kidUsername") var kidUsername: String = ""
    @AppStorage("parentUsername") var parentUsername: String = ""
    @AppStorage("password") var password: String = ""
    
    @State var tapGo: Bool = false
    
    var body: some View {
        if (tapGo == false) {
            InicialView()
        } else{
            
            TabView{
                MemoriesView()
                    .tabItem{
                        Label("Memories", systemImage: "book")
                    }
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "book")
                    }
                Text("\(kidUsername)")
                    .tabItem{
                        Label("Guardian", systemImage: "book")
                    }
            }
            //        .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
