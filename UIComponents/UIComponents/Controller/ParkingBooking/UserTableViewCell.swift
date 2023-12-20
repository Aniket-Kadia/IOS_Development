//
//  UserTableViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/06/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var imgViewUserProfile: UIImageView!
    @IBOutlet weak var lblUserPhoneNo: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
}

extension UserTableViewCell {
    func configureCell(data: AttendantsModel) {
        imgViewUserProfile.image = UIImage.named(data.profilePicture)
        lblUserPhoneNo.text = data.phoneNo
        lblUserName.text = data.name
    }
}
