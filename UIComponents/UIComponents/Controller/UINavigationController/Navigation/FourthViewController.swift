//
//  FourthViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 01/06/23.
//

import UIKit

class FourthViewController: UIViewController {
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    var colourTitle: ((String) -> Void)?
    var ColourName: String?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension FourthViewController {
    func setupView() {
        navigationItem.hidesBackButton = true
        let item = UIBarButtonItemGroup.fixedGroup(items: [UIBarButtonItem(title: AppConstants.homeTitleForBarItem, style: .plain, target: self, action: #selector(tapOnHome)), UIBarButtonItem(title: AppConstants.backTitleForBarItem, style: .plain, target: self, action: #selector(tapOnBack))])
        navigationItem.centerItemGroups = [item]
    }
}

//MARK: - @objc Methods
extension FourthViewController {
    @objc func tapOnHome() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func tapOnBack() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - IBAction Methods
extension FourthViewController {
    @IBAction func changeColourSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case colourGroup.green.rawValue:
            ColourName = AppConstants.greenColor
        case colourGroup.yellow.rawValue:
            ColourName = AppConstants.yellowColor
        default:
            return
        }
    }
    
    @IBAction func tapOnSetBackground(_ sender: UIButton) {
        if let colourTitle {
            if let ColourName {
                colourTitle(ColourName)
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
