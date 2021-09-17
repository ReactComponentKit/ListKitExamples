//
//  ColorGridViewController.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import ListKit

class ColorGridViewController: BaseViewController {
    
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
        renderer.render {
            Section(id: UUID()) {
                HGroup(width: .fractionalWidth(1.0), height: .absolute(150)) {
                    for i in 0..<4 {
                        ColorBoxComponent(color: colors[i], width: .fractionalWidth(1.0/4), height: .fractionalHeight(1.0))
                    }
                }
            }
            .contentInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
            .decorationItem(SectionBackgroundComponent())
            
            Section(id: UUID()) {
                VGroup(of: [0, 1, 2], width: .fractionalWidth(1.0), height: .estimated(30)) { number in
                    HGroup(of: [0, 1, 2], width: .fractionalWidth(1.0), height: .absolute(100)) { index in
                        ColorBoxComponent(color: colors[(number * 3) + index], width: .fractionalWidth(1.0/3.0), height: .fractionalHeight(1.0))
                    }
                }
            }
            .contentInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
            .decorationItem(SectionBackgroundComponent())
        }
    }
}
