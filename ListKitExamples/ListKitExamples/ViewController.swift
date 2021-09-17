//
//  ViewController.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import ListKit

class ViewController: BaseViewController {
    enum Scene {
        case staticListExample
        case colorGridExample
        case complexLayoutExample
        case emojiExample
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ListKit Examples"
    }
    
    override func render() {
        renderer.render {
            Section(id: UUID()) {
                VGroup(width: .fractionalWidth(1.0), height: .fractionalHeight(1.0)) {
                    ExampleComponent(title: "Static List Example") { [weak self] in
                        self?.goto(scene: .staticListExample)
                    }
                    ExampleComponent(title: "Color Grid Example") { [weak self] in
                        self?.goto(scene: .colorGridExample)
                    }
                    ExampleComponent(title: "Complex Layout Example") { [weak self] in
                        self?.goto(scene: .complexLayoutExample)
                    }
                    ExampleComponent(title: "Emoji Example") { [weak self] in
                        self?.goto(scene: .emojiExample)
                    }
                }
            }
        }
    }
    
    private func goto(scene: Scene) {
        let vc: UIViewController
        switch scene {
        case .staticListExample:
            vc = StaticListViewController()
        case .colorGridExample:
            vc = ColorGridViewController()
        case .complexLayoutExample:
            vc = ComplexLayoutViewController()
        case .emojiExample:
            vc = EmojiViewController()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

