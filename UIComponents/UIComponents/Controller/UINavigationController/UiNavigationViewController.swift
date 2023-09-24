//
//  UINavigationControllerViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 27/05/23.
//

import UIKit

class UiNavigationViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblViewControllerData: UITableView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    let viewControllerCollection = ControllerIdentifiersModel.getViewControllers(filterStroyBoard: .uiNavigationController)
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension UiNavigationViewController {
    func setupView() {
        tblViewControllerData.dataSource = self
        tblViewControllerData.delegate = self
        tblViewControllerData.register(UINib(nibName: AppConstants.viewControllerListTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.viewControllerListTableViewCell)
    }
}

//MARK: -UITableViewDataSource
extension UiNavigationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllerCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewControllerData.dequeueReusableCell(withIdentifier: AppConstants.viewControllerListTableViewCell, for: indexPath) as? ViewControllerTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath, storyBoard: .uiNavigationController)
        return cell
    }
}

//MARK: -UITableViewDelegate
extension UiNavigationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coordinator else { return }
        switch viewControllerCollection[indexPath.row].viewControllerName {
        case .imagePickerDemoViewController:
            coordinator.goToImagePickerDemoViewController()
        case .phPickerDemoViewController:
            coordinator.goToPhPickerDemoViewController()
        case .firstViewController:
            coordinator.goToFirstViewController()
        default:
            return
        }
    }
}
