//
//  TodoViewController.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/18.
//

import UIKit
import ListKit
import SwipeCellKit

class TodoViewController: BaseViewController {
    enum Sections {
        case main
        case empty
    }
    
    var todos: [Todo] = [
        Todo(title: "Book flight to Jeju"),
        Todo(title: "Go to school"),
        Todo(title: "Meeting with Jane"),
        Todo(title: "Haircut"),
        Todo(title: "Read some books")
    ] {
        didSet {
            render()
        }
    }
    
    override var dataSource: DataSource {
        return TodoDataSource()
    }
    
    override var cellClass: AnyClass? {
        return SwipeCollectionViewCell.self
    }
    
    override func render() {
        renderer.render {
            Section(id: Sections.main) {
                if todos.isEmpty {
                    VGroup(width: .fractionalWidth(1.0), height: .estimated(30)) {
                        EmptyComponent(title: "Add New Todo!")
                    }
                } else {
                    VGroup(of: todos, width: .fractionalWidth(1.0), height: .estimated(30)) { todo in
                        TodoComponent(todo: todo) { [weak self] t in
                            self?.todos.removeAll(where: { $0 == t })
                        }
                    }
                }
            }
        }
    }
}
