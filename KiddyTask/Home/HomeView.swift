//
//  HomeView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 14/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    
    @ObservedObject var viewModel = ContentViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 300))
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
//                Text("\(viewModel.kidTasks.count)")
//                Form {
//                    ForEach(viewModel.kidTasks) { task in
//                        if Calendar.current.isDateInToday(task.taskDate!) {
//                            Text("\(task.taskDate)")
//                        }
//                    }
//                }
                List {
//                    LazyVGrid(columns: columns, spacing: 30) {
                        Text(Date(), style: .date) //tirar o ano?
                            .font(.system(size: 40).weight(.heavy))
                            .foregroundStyle(Color("TaskPurple"))
                        
                    ForEach(viewModel.kidTasks, id: \.self) { kidTask in
                        if Calendar.current.isDateInToday(kidTask.taskDate ?? Date.distantPast) {
                            TaskRectangleView(kidTask: kidTask)
                                .swipeActions (content: {
                                    Button(role: .destructive) {
                                        viewModel.deleteTask(kidTask: kidTask)
                                        viewModel.getTask()
                                    } label: {
                                        VStack{
                                            Image(systemName: "trash.circle.fill")
                                            Text("Delete")
                                        }
                                    }
                                    .tint(.red)
                                })
                                .swipeActions (edge: .leading) {
                                    seeTheTask(kidTask: kidTask)
                                }
                                .listRowSeparator(.hidden)
                        }
                    }
//                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
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
                
                ToolbarItem(placement: .cancellationAction) {
                    Button{
                        showingSheet2.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .sheet(isPresented: $showingSheet2, onDismiss: {
                        viewModel.getTask()
                    }) {
                        InsertPasswordView()
                    }
                }
            }
            .onAppear(){
                viewModel.getTask()
            }
//            .onChange(of: viewModel.kidTasks) { oldValue, newValue in
//                viewModel.getTask()
//            }
        }
    }
    
    private func seeTheTask(kidTask: KidTask) -> some View {
        NavigationLink(destination: TaskDetails(task: kidTask, timeRemaining: Int(kidTask.taskTime))) {
            Text("Details")
        }
        .tint(.blue)
    }
}

#Preview {
    HomeView()
}
