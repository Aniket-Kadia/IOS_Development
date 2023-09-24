//
//  ViewControllerTableViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 27/05/23.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var btnViewControllerTitle: UIButton!
    func configureCell(index: IndexPath, storyBoard: storyBoard) {
        btnViewControllerTitle.setTitle(ControllerIdentifiersModel.getViewControllers(filterStroyBoard: storyBoard)[index.row].title, for: .normal)
    }
}
