//
//  TodoComponent.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/18.
//

import UIKit
import ListKit
import SnapKit

struct TodoComponent: Component, Deletable {
    var id: AnyHashable {
        return todo.hashValue
    }
    
    let todo: Todo
    let handleDelete: (Todo) -> Void
    init(todo: Todo, delete: @escaping (Todo) -> Void) {
        self.todo = todo
        self.handleDelete = delete
    }
    
    func contentView() -> TodoComponentContentView {
        return TodoComponentContentView()
    }
    
    func layoutSize() -> NSCollectionLayoutSize {
        return .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
    }
    
    func contentInsets() -> NSDirectionalEdgeInsets {
        return .init(top: 8, leading: 8, bottom: 8, trailing: 8)
    }
    
    func render(in content: TodoComponentContentView) {
        content.label.text = todo.title
    }
    
    func delete() {
        handleDelete(todo)
    }
}

class TodoComponentContentView: UIView {
    lazy var label: UILabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        backgroundColor = .lightGray
        layer.cornerRadius = 8
    }
}
