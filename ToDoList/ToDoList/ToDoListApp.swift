//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Timur Dolotkazin on 27.05.2022.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
