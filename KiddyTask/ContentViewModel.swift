//
//  ContentViewModel.swift
//  KiddyTask
//
//  Created by Camila Parolin on 15/07/25.
//

import Foundation
import CoreData
import PhotosUI

class ContentViewModel: ObservableObject {
    @Published var tasks: [KidTask] = []
    
    //FETCH
    func getTask() {
        tasks = CoreDataController.shared.fetchAllTasks()
    }
    
    //CREATE
    func createTask(date: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, clock: Date, why: String) {
        let result = CoreDataController.shared.createTask(date: date, desc: desc, imageAfter: imageAfter, imageBefore: imageBefore, isDone: isDone, name: name, clock: clock, why: why)
        
        self.tasks.append(result)
    }
    
    //UPDATE
    func updateTask(task: KidTask, date: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String) {
        let result = CoreDataController.shared.createTask(date: date, desc: desc, imageAfter: imageAfter, imageBefore: imageBefore, isDone: isDone, name: name, clock: clock, why: why)
        
        self.tasks.append(result)
    }
    
    //DELETE
    func deleteTask(task: KidTask){
        CoreDataController.shared.deleteTask(task: task)
    }
}
