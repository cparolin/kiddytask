//
//  TaskRectangleView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 14/07/25.
//

import SwiftUI

struct TaskRectangleView: View {
    
    var kidTask: KidTask
    
    @State private var showingSheet = false
    
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var isDone: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                //            Rectangle()
                //                .frame(width: 750, height: 158)
                //                .foregroundStyle(Color("FrontYellow"))
                //                .clipShape(.rect(cornerRadius: 20))
                //                .overlay(
                //                    RoundedRectangle(cornerRadius: 20)
                //                        .stroke(Color("BackYellow"), lineWidth: 5)
                //                )
                //nao estou usando da forma certa, a acima pois corta na hora de chamar a scrollview
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 760, height: 160)
                    .foregroundStyle(Color("BackYellow"))
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 750, height: 150)
                    .foregroundStyle(Color("FrontYellow"))
                
                HStack{
                    
                    VStack{
                        Text(kidTask.name ?? "Tarefa 1") //variavel sera recebida de outra forma futuramente
                            .foregroundStyle(Color("TaskPurple"))
                            .font(.system(size: 32).weight(.semibold))
                            .padding(.bottom, 25) //distancia entre os textos
                        
                        Text(kidTask.desc ?? "undefined")
                            .foregroundStyle(Color("TaskPurple"))
                            .font(.system(size: 24))
                    }
                    //                .border(.red)
                    /*.padding(180)*/ //distancia do circulo para o corpo de texto
                    

                        Button {
                            if kidTask.isDone == false{
                                showingSheet.toggle()
                            } else{
                                viewModel.updateBool(kidTask: kidTask, isDone: false)
                                viewModel.getTask()
                            }
                           
                        } label: {
                            ZStack{
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(Color.white)
                                Image("Star")
                                    .opacity(kidTask.isDone ? 100 : 0)
                            }
//                            Circle()
//                                .frame(width: 50, height: 50)
//                                .foregroundStyle(Color.white)
//                            //                            .border(.red)
                        }
                        .sheet(isPresented: $showingSheet, onDismiss: {
                            viewModel.getTask()
                        }) {
                            InsertPasswordView(kidTask: kidTask)
                        }
                        
//                    NavigationLink(destination: PageMemoriesView(task: kidTask)) {
//                        Text("See the task ->")
//                    }
//                    .padding(.leading, 100)
               
//                        Button {
//                            print("antes: \(kidTask.isDone)")
//                            viewModel.updateBool(kidTask: kidTask, isDone: false)
//                            print("Depois: \(kidTask.isDone)")
//                        } label: {
//                            ZStack{
//                                Circle()
//                                    .frame(width: 50, height: 50)
//                                    .foregroundStyle(Color.white)
//                                Image("Star")
//                            }
//                            
//                        }
                        
                        
                        //                                            Circle()
                        //                                                .frame(width: 50, height: 50)
                        //                                                .foregroundStyle(Color.white)
                        //                    //                            .border(.red)
                        //
                        //                                            ZStack{
                        //                                                Circle()
                        //                                                    .frame(width: 50, height: 50)
                        //                                                    .foregroundStyle(Color.white)
                        //                                                Image("Star")
                        //
                    
                    
                }
                
            }
        }
        
    }
       
    }
    
    //#Preview {
    //    TaskRectangleView()
    //}
