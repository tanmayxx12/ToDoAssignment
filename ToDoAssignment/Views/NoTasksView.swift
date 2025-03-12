//
//  NoTasksView.swift
//  ToDoAssignment
//
//  Created by Tanmay . on 12/03/25.
//

import SwiftUI

struct NoTasksView: View {
    
    var body: some View {
        ScrollView{
            VStack{
                Text("There are no tasks available!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                Text("Stay organized by adding new tasks to your to-do list—simply tap the add button to get started.")
                    .padding(.bottom, 20)
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .background(.thickMaterial)
            .background(.black)
            .cornerRadius(10)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NoTasksView()
}
