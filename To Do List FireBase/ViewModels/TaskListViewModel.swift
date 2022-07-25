//
//  TaskListViewModel.swift
//  To Do List FireBase
//
//  Created by Zhao-Rong Lai on 2022/7/26.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModels = testDataTasks.map({ task in
            TaskCellViewModel(task: task)
        })
    }
    
    func addTask(task: Task) {
        let taskVM = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskVM)
    }
}
