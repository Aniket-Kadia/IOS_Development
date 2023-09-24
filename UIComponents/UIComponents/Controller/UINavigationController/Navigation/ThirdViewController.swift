//
//  ThirdViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 01/06/23.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var textTitle: UITextField!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    var delegate: DataPass?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backButtonTitle = AppConstants.previousTitleForBackItem
    }
}

//MARK: - IBAction Methods
extension ThirdViewController {
    @IBAction func tapOnSetTitle(_ sender: UIButton) {
        delegate?.setData(text: textTitle.text ?? AppConstants.navigationControllerTitle)
        navigationController?.popViewController(animated: true)
    }
}
