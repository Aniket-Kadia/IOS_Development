//
//  UIControlViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 27/05/23.
//
import UIKit

class UiControlViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblViewControllerData: UITableView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    let viewControllerCollection = ControllerIdentifiersModel.getViewControllers(filterStroyBoard: .uiControl)
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension UiControlViewController {
    func setupView() {
        tblViewControllerData.dataSource = self
        tblViewControllerData.delegate = self
        tblViewControllerData.register(UINib(nibName: AppConstants.viewControllerListTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.viewControllerListTableViewCell)
    }
}

//MARK: -UITableViewDataSource
extension UiControlViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllerCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewControllerData.dequeueReusableCell(withIdentifier: AppConstants.viewControllerListTableViewCell, for: indexPath) as? ViewControllerTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath, storyBoard: .uiControl)
        return cell
    }
}

//MARK: -UITableViewDelegate
extension UiControlViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coordinator else { return }
        switch viewControllerCollection[indexPath.row].viewControllerName {
        case .buttonDemoViewController:
            coordinator.goToButtonDemoViewController()
        case .textFieldDemoViewController:
            coordinator.goToTextFieldDemoViewController()
        case .switchDemoViewController:
            coordinator.goToSwitchDemoViewController()
        case .sliderDemoViewController:
            coordinator.goToSliderDemoViewController()
        case .segmentedControlViewController:
            coordinator.goToSegmentedControlViewController()
        case .pageControlViewController:
            coordinator.goToPageControlViewController()
        case .stepperDemoViewController:
            coordinator.goToStepperDemoViewController()
        default:
            return
        }
    }
}
