//
//  UIScrollViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 27/05/23.
//

import UIKit

class UiScrollViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblViewControllerData: UITableView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    let viewControllerCollection = ControllerIdentifiersModel.getViewControllers(filterStroyBoard: .uiScrollView)
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension UiScrollViewController {
    func setupView() {
        tblViewControllerData.dataSource = self
        tblViewControllerData.delegate = self
        tblViewControllerData.register(UINib(nibName: AppConstants.viewControllerListTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.viewControllerListTableViewCell)
    }
}

//MARK: -UITableViewDataSource
extension UiScrollViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllerCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewControllerData.dequeueReusableCell(withIdentifier: AppConstants.viewControllerListTableViewCell, for: indexPath) as? ViewControllerTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath, storyBoard: .uiScrollView)
        return cell
    }
}

//MARK: -UITableViewDelegate
extension UiScrollViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coordinator else { return }
        switch viewControllerCollection[indexPath.row].viewControllerName {
        case .textViewDemoViewController:
            coordinator.goToTextViewDemoViewController()
        case .scrollViewDemoViewController:
            coordinator.goToScrollViewDemoViewController()
        case .tableViewDemoViewController:
            coordinator.goToTableViewDemoViewController()
        case .tableViewdelegatesViewController:
            coordinator.goToTableViewdelegatesViewController()
        case .cartTableViewController:
            coordinator.goToCartTableViewController()
        case .jobProfileTableViewController:
            coordinator.goToJobProfileTableViewController()
        case .collectionViewDemoViewController:
            coordinator.goToCollectionViewDemoViewController()
        default:
            return
        }
    }
}
