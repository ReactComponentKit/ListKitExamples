//
//  ComplexLayoutExample.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import ListKit

class ComplexLayoutViewController: BaseViewController {
    
    let colors: [UIColor] = [
        UIColor.red,
        UIColor.orange,
        UIColor.yellow,
        UIColor.green,
        UIColor.blue,
        UIColor.brown,
        UIColor.purple,
        UIColor.systemPink,
        UIColor.magenta
    ]
    
    var randomColor: UIColor {
        return colors.randomElement() ?? .cyan
    }
    override func render() {
        renderer.render(of: Array(0..<10)) { index in
            Section(id: index) {
                HGroup(width: .fractionalWidth(1.0), height: .absolute(150)) {
                    for _ in 0..<3 {
                        ColorBox2Component(color: randomColor, width: .fractionalWidth(0.5), height: .fractionalHeight(1.0))
                        VGroup(of: [0, 1], width: .fractionalWidth(0.25), height: .fractionalHeight(1.0)) { _ in
                            ColorBox2Component(color: randomColor, width: .fractionalWidth(1.0), height: .fractionalHeight(0.5))
                        }
                        VGroup(of: [0, 1], width: .fractionalWidth(0.25), height: .fractionalHeight(1.0)) { _ in
                            ColorBox2Component(color: randomColor, width: .fractionalWidth(1.0), height: .fractionalHeight(0.5))
                        }
                    }
                }
            }
            .orthogonalScrollingBehavior(.groupPaging)
            .boundarySupplementaryItem(SectionHeaderComponent(title: "Section \(index + 1)"))
        }
    }
}
