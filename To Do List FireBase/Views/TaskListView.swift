//
//  ContentView.swift
//  To Do List FireBase
//
//  Created by Zhao-Rong Lai on 2022/7/25.
//

import SwiftUI

struct TaskListView: View {
    
    
    @ObservedObject var taskListVM = TaskListViewModel()
    let tasks = testDataTasks
    
    @State var presentAddNewItem = false

    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(taskListVM.taskCellViewModels){ taslCellVM in
                        TaskCell(taskCellVM: taslCellVM)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))){ task in
                            self.taskListVM.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: {self.presentAddNewItem.toggle()}) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("Add new Task")
                }
                .padding()
            }
            .navigationTitle("Taks")
            //            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
        
        TaskListView()
            .preferredColorScheme(.dark)
    }
}

struct TaskCell: View {
    
    @ObservedObject var taskCellVM: TaskCellViewModel
    //    let task: Task
    var onCommit: (Task) -> () = { _ in }
    
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
            TextField("Enter the tasks title", text: $taskCellVM.task.title) {
                self.onCommit(self.taskCellVM.task)
            }
        }
    }
}
