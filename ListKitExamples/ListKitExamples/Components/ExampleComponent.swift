//
//  ExampleComponent.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import ListKit

struct ExampleComponent: Component {
    let id: AnyHashable = UUID()
    
    let title: String
    let onClick: () -> Void
    
    init(title: String, onClick: @escaping () -> Void) {
        self.title = title
        self.onClick = onClick
    }
    
    func layoutSize() -> NSCollectionLayoutSize {
        return .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(48))
    }
    
    func contentView() -> ExampleComponentContentView {
        return ExampleComponentContentView()
    }
    
    func render(in content: ExampleComponentContentView) {
        content.titleLabel.text = title
        content.onClick = onClick
    }
}

final class ExampleComponentContentView: UIView {
    
    var onClick: (() -> Void)?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClickHandler(_:)))
        return tap
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
            make.edges.equalToSuperview()
        }
        self.addGestureRecognizer(tap)
    }
    
    @objc
    func onClickHandler(_ sender: UIButton) {
        onClick?()
    }
}
