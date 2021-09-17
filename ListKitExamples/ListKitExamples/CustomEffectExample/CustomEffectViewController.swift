//
//  CustomEffectViewController.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/18.
//

import UIKit
import ListKit

class CustomEffectViewController: BaseViewController {
    
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
    
    override func render() {
        renderer.render(of: [1, 2, 3]) { number in
            Section(id: number) {
                HGroup(of: Array(0..<9), width: .fractionalWidth(1.0), height: .absolute(150)) { index in
                    ColorBoxComponent(color: colors[((index + number) % colors.count)], width: .fractionalWidth(1.0/3.0), height: .fractionalHeight(1.0))
                }
            }
            .contentInsets(top: 30, leading: 2.5, bottom: 30, trailing: 2.5)
            .orthogonalScrollingBehavior(.continuous)
            .visibleItemsInvalidationHandler { (items, offset, environment) in
                items.forEach { item in
                    let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                    let minScale: CGFloat = 0.7
                    let maxScale: CGFloat = 1.1
                    let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                    item.transform = CGAffineTransform(scaleX: scale, y: scale)
                }
            }
        }
    }
}
