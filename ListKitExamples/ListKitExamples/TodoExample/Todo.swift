//
//  Todo.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/18.
//

import Foundation

struct Todo: Hashable {
    let title: String
    let date = Date()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(date)
    }
}
