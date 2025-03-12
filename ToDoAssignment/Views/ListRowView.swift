//
//  ListRowView.swift
//  ToDoAssignment
//
//  Created by Tanmay . on 12/03/25.
//

import SwiftUI

struct ListRowView: View {
    let task: TaskModel
    
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(task.isCompleted ? .green : .red)
            Text(task.title)
            Spacer()
        }
        .font(.headline)
        .padding(.horizontal, 8)
    }
}

#Preview {
    ListRowView(task: TaskModel(title: "This is the first task.", isCompleted: false))
}
