//
//  AmenitiesCollectionViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/06/23.
//

import UIKit

class AmenitiesCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblAmenitiesName: UILabel!
    @IBOutlet weak var imgviewAmenitieIcon: UIImageView!
}

//MARK: - Configure Cell
extension AmenitiesCollectionViewCell {
    func configureCell(data: AmenitiesModel) {
        imgviewAmenitieIcon.image = UIImage.named(data.amenitiesIcon)
        lblAmenitiesName.text = data.amenitiesName
    }
}
