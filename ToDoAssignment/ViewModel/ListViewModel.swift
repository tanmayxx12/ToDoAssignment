//
//  ListViewModel.swift
//  ToDoAssignment
//
//  Created by Tanmay . on 11/03/25.
//

import Foundation


// MARK: - ViewModel with persistence using UserDefaults
class ListViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTasks()
        }
    }
    
    let taskKey: String = "tasks_key"
    
    init() {
        getTasks()
    }
    
    // Function to get the tasks from UserDefaults:
    func getTasks() {
        guard let data = UserDefaults.standard.data(forKey: taskKey),
              let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data) else { return }
        self.tasks = savedTasks
    }
    
    // Function that saves tasks to UserDefaults:
    private func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: taskKey)
        }
    }
    
    // Function to Add task:
    func addTask(title: String) {
        let newTask = TaskModel(title: title, isCompleted: false)
        tasks.append(newTask)
    }
  
    // Function to Update Task:
    func updateTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.updateCompletion()
        }
    }
    
    // Function to Delete Task:
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
