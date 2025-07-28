//
//  GuardianView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 25/07/25.
//

import SwiftUI

struct GuardianView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
//    var kidTasks: [KidTask] = []
 
    @AppStorage("kidUsername") var kidUsername: String = ""
    
    var guardianNum: Int {
        viewModel.kidTasks.reduce(0) { count, task in
            count + (task.isDone ? 1 : 0)
        }
    }
    
//    var x: Int {
//        viewModel.kidTasks.filter { $0.isDone }.count
//    }
    
    var body: some View {
        NavigationStack{
//            Text("\(viewModel.getTaskCount() / 2)")
//            Text("\(viewModel.getTaskCount()), x = \(x), outro = \(guardianNum)")
            if viewModel.getTaskCount() == guardianNum {
                VStack {
                    Image ("GuardianGrande")
                    Text ("Parabéns \(kidUsername)!  Seus papais me contaram que você fez todas as suas atividades de hoje, sua casa está linda! Deve ser muito bom ter você na família, que tal dar um grande abraço nos papais?")
                }
            } else if guardianNum >= viewModel.getTaskCount() / 2 && guardianNum != 0 {
                VStack{
                    Image("GuardianSemiGrande")
                    Text ("""
                              O(A) \(kidUsername) está quase lá!  Seus papais me contaram que falta muito pouco para você terminar todas as suas atividades de hoje! Tenho certeza que o(a) \(kidUsername) consegue!
                            """)
                }
            } else if guardianNum < viewModel.getTaskCount() / 2 && guardianNum != 0 {
                VStack{
                    Image("GuardianQuaseGrande")
                    Text ("""
                              O(A) \(kidUsername) já começou as atividades dele(a)! Agora é só ele(a) continuar por esse caminho que rapidinho as tarefas dele(a) terminam! Eu acredito em você \(kidUsername)! 
                            """)
                }
            } else {
                VStack{
                    Image("GuardianTristeGrande")
                    Text ("""
                              O(A) \(kidUsername) ainda não começou as atividades?
                              Que estranho! Isso é responsabilidade só dele(a).
                              Será que ele(a) vai conseguir fazer as tarefas dele(a)?
                              Porque será que ele(a) ainda não começou ? Ele(a) é tão corajoso(a)!

                            """)
                }
            }
        }
        .onAppear{
            viewModel.getTask()
        }
    }
}

//#Preview {
//    GuardianView()
//}


//Text(viewModel.getTaskCount(), format: .number)
