//
//  MainViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 29/05/23.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblViewControllerData: UITableView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    let viewControllerCollection = ControllerIdentifiersModel.getViewControllers(filterStroyBoard: .main)
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension MainViewController {
    func setupView() {
        tblViewControllerData.dataSource = self
        tblViewControllerData.delegate = self
        tblViewControllerData.register(UINib(nibName: AppConstants.viewControllerListTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.viewControllerListTableViewCell)
    }
}

//MARK: -UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllerCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewControllerData.dequeueReusableCell(withIdentifier: AppConstants.viewControllerListTableViewCell, for: indexPath) as? ViewControllerTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath, storyBoard: .main)
        return cell
    }
}

//MARK: -UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coordinator else { return }
        switch viewControllerCollection[indexPath.row].viewControllerName {
        case .uiViewController:
            coordinator.goToUiViewController()
        case .uiScrollViewController:
            coordinator.goToUiScrollViewController()
        case .uiControlViewController:
            coordinator.goToUiControlViewController()
        case .uiNavigationViewController:
            coordinator.goToUiNavigationControllerViewController()
        case .autoLayoutViewController:
            coordinator.goToAutoLayoutViewController()
        case .assignedParkingViewController:
            coordinator.goToAssignedParkingViewController()
        case .parkingLotViewController:
            coordinator.goToParkingLotViewController()
        case .webServiceViewController:
            coordinator.goToWebServiceViewController()
        default:
            return
        }
    }
}
