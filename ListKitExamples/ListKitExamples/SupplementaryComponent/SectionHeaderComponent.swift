//
//  SectionHeaderComponent.swift
//  ListKitApp
//
//  Created by burt on 2021/09/16.
//

import UIKit
import ListKit

struct SectionHeaderComponent: SupplementaryComponent {
    var id: AnyHashable = UUID()
    var kind: SupplementaryComponentKind {
        .header
    }
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func layoutSize() -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
    }
    
    func contentView() -> SectionComponentContentView {
        return SectionComponentContentView()
    }
    
    func pinToVisibleBounds() -> Bool {
        return true
    }
    
    func render(in content: SectionComponentContentView) {
        content.backgroundColor = .lightGray
        content.titleLabel.text = title
    }
}

final class SectionComponentContentView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
        
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.bottom.trailing.equalToSuperview()
        }
    }
}
