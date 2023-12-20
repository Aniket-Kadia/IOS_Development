//
//  UserDetailsViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/07/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    var userData: Profile?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension UserDetailsViewController {
    func setupView() {
        guard let userData = userData else {
            return
        }
        lblId.text = String(userData.id)
        lblEmail.text = userData.email
        lblFirstName.text = userData.firstName
        lblLastName.text = userData.lastName
        guard let imageUrl = URL(string: (userData.avatar)) else {
            return
        }
        DispatchQueue.global().async {
            let image = try? Data(contentsOf: imageUrl)
            DispatchQueue.main.async { [weak self] in
                guard let self = self, let image = image else {
                    return
                }
                self.imgProfile.image = UIImage(data: image)
            }
        }
    }
}
