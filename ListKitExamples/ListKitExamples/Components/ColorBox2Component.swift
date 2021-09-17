//
//  ColorBox2Component.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import ListKit

struct ColorBox2Component: Component {
    var id: AnyHashable { UUID() }
    let color: UIColor
    let width: NSCollectionLayoutDimension
    let height: NSCollectionLayoutDimension
    
    public init(color: UIColor, width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension) {
        self.color = color
        self.width = width
        self.height = height
    }
    
    func contentView() -> UIView {
        return UIView(frame: .zero)
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
    
    func render(in content: UIView) {
        content.backgroundColor = color
    }
}

