//
//  EmojiBoxComponent.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import SnapKit
import ListKit

struct EmojiBoxComponent: Component {
    let id: AnyHashable
    let emoji: String
    
    init(emoji: String) {
        self.id = emoji
        self.emoji = emoji
    }
    
    func contentView() -> EmojiBoxComponentContentView {
        EmojiBoxComponentContentView()
    }
    
    func layoutSize() -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(widthDimension: .absolute(30), heightDimension: .absolute(30))
    }
    
    func edgeSpacing() -> NSCollectionLayoutEdgeSpacing? {
        return nil
    }
    
    func contentInsets() -> NSDirectionalEdgeInsets {
        return .init(top: 2, leading: 2, bottom: 2, trailing: 2)
    }
    
    func render(in content: EmojiBoxComponentContentView) {
        content.label.text = emoji
    }
}

final class EmojiBoxComponentContentView: UIView {
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
