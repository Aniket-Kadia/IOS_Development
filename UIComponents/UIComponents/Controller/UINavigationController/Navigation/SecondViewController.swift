//
//  SecondViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 01/06/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var btnDismiss: UIButton!
    @IBOutlet weak var lblPresentationName: UILabel!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    var presentationStyle: String?
    var hiddenStatus = false
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        if let presentationStyle {
            lblPresentationName.text = presentationStyle
            btnDismiss.isHidden = hiddenStatus
        }
    }
}

//MARK: - IBAction Methods
extension SecondViewController {
    @IBAction func tapOnDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
