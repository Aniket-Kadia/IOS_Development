//
//  ParkingDetailTableViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/06/23.
//

import UIKit

class ParkingDetailTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var imgViewParkingPlace: UIImageView!
    @IBOutlet weak private var lblPin: UILabel!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblAdress: UILabel!
}

//MARK: - Configure Cell
extension ParkingDetailTableViewCell {
    func configureCell(data: ParkingDetailModel) {
        lblPin.text = String(data.pincode)
        lblTitle.text = data.title
        lblAdress.text = data.address
        imgViewParkingPlace.image = UIImage.named(data.placeImage)
    }
}
