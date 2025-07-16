//
//  CoreDataController.swift
//  KiddyTask
//
//  Created by Camila Parolin on 15/07/25.
//

import Foundation
import CoreData
import PhotosUI

final class CoreDataController {
    static let shared = CoreDataController()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
            }
        }
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
    
    //CREATE
    func createTask(date: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, taskTime: Int16, why: String) -> KidTask{
        let task = KidTask(context: viewContext)
        
        task.date = date
        task.desc = desc
        task.imageAfter = imageAfter.jpegData(compressionQuality: 1.0)
        task.imageBefore = imageBefore.jpegData(compressionQuality: 1.0)
        task.isDone = isDone
        task.name = name
        task.taskTime = taskTime
        task.why = why
        
        saveContext()
        print(task)
        return task
    }
    
    //READ
    func fetchAllTasks() -> [KidTask]{
        let fetchRequest: NSFetchRequest<KidTask> = KidTask.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching Client: \(error.localizedDescription)")
            return []
        }
    }
    
    //UPDATE
    func updateTask(task: KidTask, date: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, taskTime: Int16, why: String) -> KidTask{
        
        task.date = date
        task.desc = desc
        task.imageAfter = imageAfter.jpegData(compressionQuality: 1.0)
        task.imageBefore = imageBefore.jpegData(compressionQuality: 1.0)
        task.isDone = isDone
        task.name = name
        task.taskTime = taskTime
        task.why = why
        
        saveContext()
        return task
    }
    
    //DELETE
    func deleteTask(task: KidTask){
        viewContext.delete(task)
        
        saveContext()
    }
}
