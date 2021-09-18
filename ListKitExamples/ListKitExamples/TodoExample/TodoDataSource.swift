//
//  TodoDataSource.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/18.
//

import UIKit
import ListKit
import SwipeCellKit

class TodoDataSource: DiffableDataSource, SwipeCollectionViewCellDelegate {
    override func configure(cell: UICollectionViewCell) {
        guard let swipableCell = cell as? SwipeCollectionViewCell else { return }
        swipableCell.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        guard let deletable = component(at: indexPath, to: Deletable.self) else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            deletable.delete()
            action.fulfill(with: .delete)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        return [deleteAction]
    }
}
