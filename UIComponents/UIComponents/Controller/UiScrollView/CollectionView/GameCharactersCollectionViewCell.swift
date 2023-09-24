//
//  GameCharactersCollectionViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 08/05/23.
//

import UIKit

class GameCharactersCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterSpecialPowers: UILabel!
}

//MARK: - View Methods
extension GameCharactersCollectionViewCell {
    func configureCell(characterDetails:[Game], indexpath: IndexPath) {
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        characterImage.image = characterDetails[indexpath.row].image
        characterName.text = characterDetails[indexpath.row].name
        characterSpecialPowers.text = characterDetails[indexpath.row].powers
    }
}
