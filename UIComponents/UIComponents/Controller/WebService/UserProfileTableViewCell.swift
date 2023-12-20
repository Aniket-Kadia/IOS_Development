//
//  UserProfileTableViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/07/23.
//

import UIKit

class UserProfileTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    //MARK: - Configure Cell
    func configuration(userDetails: Profile) {
        lblId.text = String(userDetails.id)
        lblEmail.text = userDetails.email
        lblFullName.text = "\(userDetails.firstName) \(userDetails.lastName)"
        guard let imageUrl = URL(string: (userDetails.avatar)) else {
            return
        }
        DispatchQueue.global().async {
            let image = try? Data(contentsOf: imageUrl)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.imgProfile.image = UIImage(data: image!)
            }
        }
    }
}
