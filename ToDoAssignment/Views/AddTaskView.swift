//
//  AddTaskView.swift
//  ToDoAssignment
//
//  Created by Tanmay . on 12/03/25.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var textFieldText: String = ""
    @State private var someColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                TextField("Add your task...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(someColor))
                    .cornerRadius(10)
                    .shadow(radius: 5, x: 4, y: 4)
                    .padding(.bottom)
                
                // Button to save the task to UserDefaults: 
                Button {
                    save()
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 100,height: 45)
                        .background(.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5, x: 0, y: 4)
                }
                .alert("Task title should be at least 3 characters long.", isPresented: $showAlert) {
                    Button("Okay") {}
                }
                Spacer()
            }
            .padding(6)
            .navigationTitle("Add a task.")
        }
    }
    
    // Function to save the task:
    func save() {
        if validateInput() {
            listViewModel.addTask(title: textFieldText)
            dismiss()
        } else {
            showAlert.toggle()
        }
    }
    
    // Function to validate the TextField Input:
    func validateInput() -> Bool {
        if textFieldText.count < 3 {
            return false
        }
        return true
    }
    
}

#Preview {
    AddTaskView()
        .environmentObject(ListViewModel())
}
