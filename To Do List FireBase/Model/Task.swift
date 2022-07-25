//
//  Task.swift
//  To Do List FireBase
//
//  Created by Zhao-Rong Lai on 2022/7/25.
//

import Foundation

struct Task {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG

let testDataTasks = [
    Task(title: "Buy Milk", completed: true),
    Task(title: "學習 iOS", completed: false),
    Task(title: "????", completed: false),
    Task(title: "Get apple before home", completed: false)
]

#endif
