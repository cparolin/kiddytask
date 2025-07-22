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
    @Published var kidTasks: [KidTask] = []
    
    //FETCH
    func getTask() {
        kidTasks = CoreDataController.shared.fetchAllTasks()
    }
    
    //CREATE
    func createTask(date: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, taskTime: Int16, why: String) {
        let result = CoreDataController.shared.createTask(date: date, desc: desc, imageAfter: imageAfter, imageBefore: imageBefore, isDone: isDone, name: name, taskTime: taskTime, why: why)
        
        self.kidTasks.append(result)
    }
    
    //UPDATE
    func updateTask(kidTask: KidTask, date: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, taskTime: Int16, why: String) {
        let result = CoreDataController.shared.updateTask(kidTask: kidTask, date: date, desc: desc, imageAfter: imageAfter, imageBefore: imageBefore, isDone: isDone, name: name, taskTime: taskTime, why: why)
    }
    
    func updateBool(kidTask: KidTask, isDone: Bool) {
        let result = CoreDataController.shared.updateBool(kidTask: kidTask, isDone: isDone)
    }
    
    //DELETE
    func deleteTask(kidTask: KidTask){
        CoreDataController.shared.deleteTask(kidTask: kidTask)
    }
}
