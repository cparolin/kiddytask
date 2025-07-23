//
//  TaskDetails.swift
//  KiddyTask
//
//  Created by Camila Parolin on 23/07/25.
//

import SwiftUI

struct TaskDetails: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    @State var task: KidTask
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    TaskDetails()
//}
