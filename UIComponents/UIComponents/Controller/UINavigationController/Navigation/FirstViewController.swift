//
//  FirstViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 01/06/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension FirstViewController {
    func setupView() {
        title = AppConstants.navigationControllerTitle
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - IBAction Methods
extension FirstViewController {
    @IBAction func goToSecondAsShow(_ sender: UIButton) {
        coordinator?.goToSecondViewController()
    }
    
    @IBAction func goToSecondAsPresent(_ sender: UIButton) {
        coordinator?.goToSecondViewAsPresent()
    }
    
    @IBAction func goToSecondAsShowDetail(_ sender: UIButton) {
        coordinator?.goToSecondViewAsShowDetail()
    }
    
    @IBAction func goToSecondAsPopOver(_ sender: UIButton) {
        coordinator?.goToSecondViewAsPopover(sender: sender)
    }
    
    @IBAction func goToThirdView(_ sender: UIButton) {
        coordinator?.goToThirdViewController()
    }
    
    @IBAction func goTofourthView(_ sender: UIButton) {
        coordinator?.goToFourthViewController(closure: { colourName in
            self.view.backgroundColor = UIColor(named: colourName)
        })
    }
}

//MARK: Protocol
protocol DataPass {
    func setData(text: String)
}

//MARK: DataPass
extension FirstViewController: DataPass {
    func setData(text: String) {
        title = text
    }
}
