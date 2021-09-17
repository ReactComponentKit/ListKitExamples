//
//  SectionBacgroundComponent.swift
//  ListKitApp
//
//  Created by burt on 2021/09/15.
//

import UIKit
import ListKit

struct SectionBackgroundComponent: DecorationComponent {
    func contentViewClass() -> AnyClass {
        return SectionBackgroundComponentContentView.self
    }
    
    func contentInsets() -> NSDirectionalEdgeInsets {
        return .init(top: 8, leading: 8, bottom: 8, trailing: 8)
    }
}

final class SectionBackgroundComponentContentView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func render() {
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 8
    }
}
