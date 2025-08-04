//
//  CoreDataViewModel.swift
//  KiddyTask
//
//  Created by Camila Parolin on 04/08/25.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataViewModel: ObservableObject {
    @Published public var scheduledNotifications: [ScheduledNotification] = []
    
    public func getNotifications() {
        scheduledNotifications = CoreDataModel.shared.fetchScheduledNotifications()
    }
    
    public func createScheduledNotification(id: UUID, date: Date) {
        let newScheduledNotification: ScheduledNotification = CoreDataModel.shared.createScheduledNotification(id: id, date: date)
        self.scheduledNotifications.append(newScheduledNotification)
    }
    
    public func deleteScheduledNotification(scheduledNotification: ScheduledNotification) {
        CoreDataModel.shared.deleteNotification(scheduledNotification: scheduledNotification)
    }
}
