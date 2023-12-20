//
//  WebServiceViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 07/07/23.
//

import UIKit

class WebServiceViewController: UIViewController {
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - IBAction Methods
extension WebServiceViewController {
    @IBAction func tapOnBtnUserDetail(_ sender: UIButton) {
        coordinator?.goToEmployeeViewController()
    }
    
    @IBAction func tapOnBtnUserList(_ sender: UIButton) {
        coordinator?.goToUserProfileViewController()
    }
    
    @IBAction func tapOnImageUpload(_ sender: UIButton) {
        coordinator?.goToUploadImageViewController()
    }
    
    @IBAction func tapOnStartupApi(_ sender: UIButton) {
        coordinator?.goToStartupViewController()
    }
}
