//
//  GameCharacterCollectionHeader.swift
//  UIComponents
//
//  Created by Aniket Kadia on 09/05/23.
//

import UIKit

class GameCharacterCollectionHeader: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak private var headerTitle: UILabel!
}

//MARK: - View Methods
extension GameCharacterCollectionHeader {
    func configureHeader(lblTitle: String) {
        headerTitle.text = lblTitle
    }
}
