//
//  HomeView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 14/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingSheet = false
    @ObservedObject var viewModel = ContentViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 300))
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
//                    LazyVGrid(columns: columns, spacing: 30) {
                        Text(Date(), style: .date) //tirar o ano?
                            .font(.system(size: 40).weight(.heavy))
                            .foregroundStyle(Color("TaskPurple"))
                        
                        ForEach(viewModel.kidTasks, id: \.self) { kidTask in
                            TaskRectangleView(kidTask: kidTask)
                                .swipeActions {
                                    deleteAction(kidTask: kidTask)
                                }
                        }
//                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button{
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingSheet, onDismiss: {
                        viewModel.getTask()
                    }) {
                        AddTaskView()
                    }
                }
            }
            .onAppear(){
                viewModel.getTask()
            }
        }
    }
    
    private func deleteAction(kidTask: KidTask) -> some View {
        Button(role: .destructive) {
            viewModel.deleteTask(kidTask: kidTask)
            dismiss()
        } label: {
            VStack{
                Image(systemName: "wrongwaysign.fill")
                Text("Delete")
            }
        }
        .tint(.red)
    }
}

//#Preview {
//    HomeView()
//}
