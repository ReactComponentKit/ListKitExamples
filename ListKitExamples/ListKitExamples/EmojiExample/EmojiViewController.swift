//
//  EmojiViewController.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import UIKit
import ListKit
import SnapKit

class EmojiViewController: BaseViewController {
    
    enum Sections {
        case main
    }
    
    var emojiList: [String] = ["😊"] {
        didSet {
            render()
        }
    }
    
    override var dataSource: DataSource {
        DiffableDataSource()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIButton(type: .system)
        addButton.setTitle("ADD", for: [])
        addButton.addTarget(self, action: #selector(onClickAddButton(_:)), for: .touchUpInside)
        
        let removeButton = UIButton(type: .system)
        removeButton.setTitle("REMOVE", for: [])
        removeButton.addTarget(self, action: #selector(onClickRemoveButton(_:)), for: .touchUpInside)
        
        let suffleButton = UIButton(type: .system)
        suffleButton.setTitle("SUFFLE", for: [])
        suffleButton.addTarget(self, action: #selector(onClickSuffleButton(_:)), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [addButton, removeButton, suffleButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-48)
            make.height.equalTo(48)
        }
    }
    
    override func render() {
        renderer.render(animated: true) {
            Section(id: Sections.main) {
                HGroup(of: emojiList, width: .fractionalWidth(1.0), height: .estimated(30)) { item in
                    EmojiBoxComponent(emoji: item)
                }
            }
        }
    }
    
    @objc
    func onClickAddButton(_ sender: UIButton) {
        if let emoji = EmojiHelper.shared.emoji(), !emojiList.contains(emoji) {
            emojiList.append(emoji)
        }
    }
    
    @objc
    func onClickRemoveButton(_ sender: UIButton) {
        guard emojiList.count > 1 else { return }
        let removed = emojiList.remove(at: (0..<emojiList.count).random)
        EmojiHelper.shared.append(emoji: removed)
    }
    
    @objc
    func onClickSuffleButton(_ sender: UIButton) {
        emojiList.shuffle()
    }
}
