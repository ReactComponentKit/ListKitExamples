//
//  NumberBoxComponent.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import SnapKit
import ListKit

struct NumberBoxComponent: Component {
    let id: AnyHashable
    let number: Int
    let width: NSCollectionLayoutDimension
    let height: NSCollectionLayoutDimension
    
    init(number: Int, width: NSCollectionLayoutDimension = .fractionalWidth(1.0/10.0), height: NSCollectionLayoutDimension = .fractionalWidth(1.0/10.0)) {
        self.id = number.hashValue
        self.number = number
        self.width = width
        self.height = height
    }
    
    func contentView() -> NumberBoxComponentContentView {
        NumberBoxComponentContentView()
    }
    
    func layoutSize() -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
    }
    
    func edgeSpacing() -> NSCollectionLayoutEdgeSpacing? {
        return nil
    }
    
    func contentInsets() -> NSDirectionalEdgeInsets {
        return .init(top: 2, leading: 2, bottom: 2, trailing: 2)
    }
    
    func supplementComponents() -> [AnySupplementaryComponent] {
        return []
    }
    
    func render(in content: NumberBoxComponentContentView) {
        content.label.text = "\(number)"
    }
}

final class NumberBoxComponentContentView: UIView {
    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.backgroundColor = .darkGray
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8.0
    }
}
