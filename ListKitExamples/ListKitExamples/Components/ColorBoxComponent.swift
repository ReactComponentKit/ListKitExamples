//
//  ColorBoxComponent.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import ListKit

struct ColorBoxComponent: Component {
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
        return .zero
    }
    
    func render(in content: UIView) {
        content.backgroundColor = color
    }
}
