//
//  EmptyComponent.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/18.
//

import UIKit
import ListKit

struct EmptyComponent: Component {
    var id: AnyHashable = UUID()
    let title: String
    init(title: String) {
        self.title = title
    }
    
    func contentView() -> UILabel {
        return UILabel()
    }
    
    func layoutSize() -> NSCollectionLayoutSize {
        return .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
    }
    
    func render(in content: UILabel) {
        content.textAlignment = .center
        content.text = title
    }
}
