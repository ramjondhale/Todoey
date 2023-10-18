//
//  File.swift
//  Todoey
//
//  Created by Ram Jondhale on 15/10/23.
//

import Foundation

class TodoItem: Codable {
    var title: String = ""
    var done: Bool = false

    init(title: String, done: Bool = false) {
        self.title = title
        self.done = done
    }
}
