//
//  UIViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 29/05/23.
//

import UIKit
class UiViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblViewControllerData: UITableView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    let viewControllerCollection = ControllerIdentifiersModel.getViewControllers(filterStroyBoard: .uiView)
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension UiViewController {
    func setupView() {
        tblViewControllerData.dataSource = self
        tblViewControllerData.delegate = self
        tblViewControllerData.register(UINib(nibName: AppConstants.viewControllerListTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.viewControllerListTableViewCell)
    }
}

//MARK: -UITableViewDataSource
extension UiViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllerCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewControllerData.dequeueReusableCell(withIdentifier: AppConstants.viewControllerListTableViewCell, for: indexPath) as? ViewControllerTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath, storyBoard: .uiView)
        return cell
    }
}

//MARK: -UITableViewDelegate
extension UiViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coordinator else { return }
        switch viewControllerCollection[indexPath.row].viewControllerName {
        case .labelDemoViewController:
            coordinator.goToLabelDemoViewController()
        case .progressViewController:
            coordinator.goToProgressViewController()
        case .activityIndicatorAndWebViewController:
            coordinator.goToActivityIndicatorAndWebViewController()
        case .uiSearchBarViewController:
            coordinator.goToUiSearchBarViewController()
        case .stackViewController:
            coordinator.goToStackViewController()
        case .tabBarViewController:
            coordinator.goToTabBarViewController()
        default:
            return
        }
    }
}