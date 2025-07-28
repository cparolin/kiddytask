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
    func createTask(taskDate: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, taskTime: Int16, why: String) -> KidTask{
        let kidTask = KidTask(context: viewContext)
        
        kidTask.taskDate = taskDate
        kidTask.desc = desc
        kidTask.imageAfter = imageAfter.jpegData(compressionQuality: 1.0)
        kidTask.imageBefore = imageBefore.jpegData(compressionQuality: 1.0)
        kidTask.isDone = isDone
        kidTask.name = name
        kidTask.taskTime = taskTime
        kidTask.why = why
        
        saveContext()
        print(kidTask)
        return kidTask
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
    func updateTask(kidTask: KidTask, taskDate: Date, desc: String, imageAfter: UIImage, imageBefore: UIImage, isDone: Bool, name: String, taskTime: Int16, why: String) -> KidTask{
        
        kidTask.taskDate = taskDate
        kidTask.desc = desc
        kidTask.imageAfter = imageAfter.jpegData(compressionQuality: 1.0)
        kidTask.imageBefore = imageBefore.jpegData(compressionQuality: 1.0)
        kidTask.isDone = isDone
        kidTask.name = name
        kidTask.taskTime = taskTime
        kidTask.why = why
        
        saveContext()
        return kidTask
    }
    
    func updateBool(kidTask: KidTask, isDone: Bool) -> KidTask {
        
        kidTask.isDone = isDone
        
        saveContext()
        
        return kidTask
    }
    
    func updateAfterImage(kidTask: KidTask, imageAfter: UIImage) -> KidTask {
        
        kidTask.imageAfter = imageAfter.jpegData(compressionQuality: 1.0)
        
        saveContext()
        print(kidTask)
        return kidTask
    }
    
    //DELETE
    func deleteTask(kidTask: KidTask){
        viewContext.delete(kidTask)
        
        saveContext()
    }
}
