//
//  ViewController.swift
//  01StaticList
//
//  Created by burt on 2021/09/16.
//

import UIKit
import SnapKit
import ListKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ComposeRenderer.emptyLayout)
        return collectionView
    }()
    
    private lazy var renderer: ComposeRenderer = ComposeRenderer(dataSource: PlainDataSource())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
                collectionView.backgroundColor = .clear
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        renderer.target = collectionView
        render()
    }
    
    private func render() {
        renderer.render {
            Section(id: UUID()) {
                HGroup(width: .fractionalWidth(1.0), height: .estimated(30)) {
                    NumberBoxComponent(number: 1)
                    for n in 2...30 {
                        NumberBoxComponent(number: n)
                    }
                }
            }
            .contentInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            
            Section(id: UUID()) {
                HGroup(width: .fractionalWidth(1.0), height: .estimated(30)) {
                    for n in 1...40 {
                        if n % 2 == 1 {
                            NumberBoxComponent(number: n)
                        }
                    }
                }
            }
            .contentInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            
            Section(id: UUID()) {
                HGroup(width: .fractionalWidth(1.0), height: .fractionalHeight(1.0)) {
                    for n in 1...10 {
                        VGroup(of: Array(n...n*5), width: .absolute(30), height: .absolute(150)) { i in
                            NumberBoxComponent(number: i, width: .absolute(30), height: .absolute(30))
                        }
                    }
                }
            }
            .orthogonalScrollingBehavior(.continuous)
            .contentInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        }
    }
}

