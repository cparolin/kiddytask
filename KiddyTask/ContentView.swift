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
    
    @AppStorage("tapGo") var tapGo: Bool = false
    
    var body: some View {
        if (tapGo == false) {
            InicialView()
        } else{
            
            TabView{
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                MemoriesView()
                    .tabItem{
                        Label("Memories", systemImage: "lightbulb.max")
                    }
                GuardianView()
                    .tabItem{
                        Label("Guardian", systemImage: "figure")
                    }
            }
            
            //        .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
