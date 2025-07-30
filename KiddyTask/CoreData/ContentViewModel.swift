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
    @Published public var scheduledNotifications: [ScheduledNotification] = []
    
    //FETCH
    func getTask() {
        kidTasks = CoreDataController.shared.fetchAllTasks()
    }
    
    func getTaskCount(todayOnly: Bool = false) -> Int {
        if todayOnly {
            return kidTasks.filter({ task in
                Calendar.current.isDateInToday(task.taskDate ?? Date.distantPast)
            }).count
        } else {
            return kidTasks.count
        }
    }
    
    func getTaskDate() -> [KidTask] {
        return kidTasks.filter { task in
            task.taskDate == Date.now
        }
    }
    
    public func getNotifications() {
        scheduledNotifications = CoreDataController.shared.fetchScheduledNotifications()
    }
    
    //CREATE
    func createTask(taskDate: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, taskTime: Int16, why: String) {
        let result = CoreDataController.shared.createTask(taskDate: taskDate, desc: desc, imageAfter: imageAfter, imageBefore: imageBefore, isDone: isDone, name: name, taskTime: taskTime, why: why)
        
        self.kidTasks.append(result)
    }
    
    public func createScheduledNotification(id: UUID, date: Date) {
        let newScheduledNotification: ScheduledNotification = CoreDataController.shared.createScheduledNotification(id: id, date: date)
        self.scheduledNotifications.append(newScheduledNotification)
    }
    
    //UPDATE
    func updateTask(kidTask: KidTask, taskDate: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, taskTime: Int16, why: String) {
        let result = CoreDataController.shared.updateTask(kidTask: kidTask, taskDate: taskDate, desc: desc, imageAfter: imageAfter, imageBefore: imageBefore, isDone: isDone, name: name, taskTime: taskTime, why: why)
    }
    
    func updateBool(kidTask: KidTask, isDone: Bool) {
        let result = CoreDataController.shared.updateBool(kidTask: kidTask, isDone: isDone)
    }
    
    func updateImageAfter(kidTask: KidTask, imageAfter: UIImage) {
        let result = CoreDataController.shared.updateAfterImage(kidTask: kidTask, imageAfter: imageAfter)
    }
    
    //DELETE
    func deleteTask(kidTask: KidTask){
        CoreDataController.shared.deleteTask(kidTask: kidTask)
    }
    
    public func deleteScheduledNotification(scheduledNotification: ScheduledNotification) {
        CoreDataController.shared.deleteNotification(scheduledNotification: scheduledNotification)
    }
}
