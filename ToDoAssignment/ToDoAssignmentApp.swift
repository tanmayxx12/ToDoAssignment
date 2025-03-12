//
//  ToDoAssignmentApp.swift
//  ToDoAssignment
//
//  Created by Tanmay . on 11/03/25.
//

import SwiftUI

@main
struct ToDoAssignmentApp: App {
    @StateObject private var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(listViewModel)
        }
    }
}
