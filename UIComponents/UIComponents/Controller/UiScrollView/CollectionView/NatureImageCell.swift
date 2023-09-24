//
//  NatureImageCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 11/05/23.
//

import UIKit

class NatureImageCell: UICollectionViewCell {
    @IBOutlet weak private var imgNature: UIImageView!
    
    func configureCell(img: UIImage) {
        imgNature.layer.borderWidth = CGFloat(1)
        imgNature.image = img
    }
}
