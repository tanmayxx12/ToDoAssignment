//
//  TaskModel.swift
//  ToDoAssignment
//
//  Created by Tanmay . on 11/03/25.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TaskModel {
        return TaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
