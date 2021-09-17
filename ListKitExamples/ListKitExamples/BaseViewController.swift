//
//  BaseViewController.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import SnapKit
import ListKit


open class BaseViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ComposeRenderer.emptyLayout)
        return collectionView
    }()
    
    lazy var renderer: ComposeRenderer = ComposeRenderer(dataSource: dataSource)
    
    open var dataSource: DataSource {
        PlainDataSource()
    }
    
    open override func viewDidLoad() {
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
    
    open func render() {
        
    }
}
