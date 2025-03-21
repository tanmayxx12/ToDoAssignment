//
//  ContentView.swift
//  ToDoAssignment
//
//  Created by Tanmay . on 11/03/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var isShowingAddTaskView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if listViewModel.tasks.isEmpty {
                    NoTasksView()
                } else {
                    List {
                        ForEach(listViewModel.tasks) { task in
                            ListRowView(task: task)
                                .onTapGesture {
                                    withAnimation {
                                        listViewModel.updateTask(task: task)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteTask)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("ToDos")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .disabled(listViewModel.tasks.isEmpty)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddTaskView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddTaskView) {
                AddTaskView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
        
    }
}

#Preview {
    RootView()
        .environmentObject(ListViewModel())
}
