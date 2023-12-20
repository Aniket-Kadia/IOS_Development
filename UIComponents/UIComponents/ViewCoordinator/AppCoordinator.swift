//
//  AppCoordinator.swift
//  UIComponents
//
//  Created by Aniket Kadia on 30/05/23.
//

import Foundation
import UIKit
class AppCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if let mainViewController = UIStoryboard(name: storyBoard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.mainViewController.rawValue) as? MainViewController {
            mainViewController.coordinator = self
            navigationController?.pushViewController(mainViewController, animated: true)
        }
    }
    
    func goToUiViewController() {
        if let uiViewController = UIStoryboard(name: storyBoard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.uiViewController.rawValue) as? UiViewController {
            uiViewController.coordinator = self
            navigationController?.pushViewController(uiViewController, animated: true)
        }
    }
    
    func goToUiScrollViewController() {
        if let uiScrollViewController = UIStoryboard(name: storyBoard.uiScrollView.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.uiScrollViewController.rawValue) as? UiScrollViewController {
            uiScrollViewController.coordinator = self
            navigationController?.pushViewController(uiScrollViewController, animated: true)
        }
    }
    
    func goToUiControlViewController() {
        if let uiControlViewController = UIStoryboard(name: storyBoard.uiControl.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.uiControlViewController.rawValue) as? UiControlViewController {
            uiControlViewController.coordinator = self
            navigationController?.pushViewController(uiControlViewController, animated: true)
        }
    }
    
    func goToUiNavigationControllerViewController() {
        if let uiNavigationControllerViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.uiNavigationViewController.rawValue) as? UiNavigationViewController {
            uiNavigationControllerViewController.coordinator = self
            navigationController?.pushViewController(uiNavigationControllerViewController, animated: true)
        }
    }
    
    func goToAutoLayoutViewController() {
        if let autoLayoutViewController = UIStoryboard(name: storyBoard.uiScreen.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.autoLayoutViewController.rawValue) as? AutoLayoutViewController {
            navigationController?.pushViewController(autoLayoutViewController, animated: true)
        }
    }
    
    func goToTextViewDemoViewController() {
        if let textViewDemoViewController = UIStoryboard(name: storyBoard.uiScrollView.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.textViewDemoViewController.rawValue) as? TextViewDemoViewController {
            textViewDemoViewController.coordinator = self
            navigationController?.pushViewController(textViewDemoViewController, animated: true)
        }
    }
    
    func goToScrollViewDemoViewController() {
        if let scrollViewDemoViewController = UIStoryboard(name: storyBoard.uiScrollView.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.scrollViewDemoViewController.rawValue) as? ScrollViewDemoViewController {
            scrollViewDemoViewController.coordinator = self
            navigationController?.pushViewController(scrollViewDemoViewController, animated: true)
        }
    }
    
    func goToTableViewDemoViewController() {
        if let tableViewDemoViewController = UIStoryboard(name: storyBoard.uiScrollView.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.tableViewDemoViewController.rawValue) as? TableViewDemoViewController {
            tableViewDemoViewController.coordinator = self
            navigationController?.pushViewController(tableViewDemoViewController, animated: true)
        }
    }
    
    func goToTableViewdelegatesViewController() {
        if let tableViewdelegatesViewController = UIStoryboard(name: storyBoard.uiScrollView.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.tableViewdelegatesViewController.rawValue) as? TableViewdelegatesViewController {
            tableViewdelegatesViewController.coordinator = self
            navigationController?.pushViewController(tableViewdelegatesViewController, animated: true)
        }
    }
    
    func goToCartTableViewController() {
        if let cartTableViewController = UIStoryboard(name: storyBoard.uiScrollView.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.cartTableViewController.rawValue) as? CartTableViewController {
            cartTableViewController.coordinator = self
            navigationController?.pushViewController(cartTableViewController, animated: true)
        }
    }
    
    func goToJobProfileTableViewController() {
        if let jobProfileTableViewController = UIStoryboard(name: storyBoard.uiScrollView.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.jobProfileTableViewController.rawValue) as? JobProfileTableViewController {
            jobProfileTableViewController.coordinator = self
            navigationController?.pushViewController(jobProfileTableViewController, animated: true)
        }
    }
    
    func goToCollectionViewDemoViewController() {
        if let collectionViewDemoViewController = UIStoryboard(name: storyBoard.uiScrollView.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.collectionViewDemoViewController.rawValue) as? CollectionViewDemoViewController {
            collectionViewDemoViewController.coordinator = self
            navigationController?.pushViewController(collectionViewDemoViewController, animated: true)
        }
    }
    
    func goToButtonDemoViewController() {
        if let buttonDemoViewController = UIStoryboard(name: storyBoard.uiControl.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.buttonDemoViewController.rawValue) as? ButtonDemoViewController {
            buttonDemoViewController.coordinator = self
            navigationController?.pushViewController(buttonDemoViewController, animated: true)
        }
    }
    
    func goToTextFieldDemoViewController() {
        if let textFieldDemoViewController = UIStoryboard(name: storyBoard.uiControl.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.textFieldDemoViewController.rawValue) as? TextFieldDemoViewController {
            textFieldDemoViewController.coordinator = self
            navigationController?.pushViewController(textFieldDemoViewController, animated: true)
        }
    }
    
    func goToSwitchDemoViewController() {
        if let switchDemoViewController = UIStoryboard(name: storyBoard.uiControl.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.switchDemoViewController.rawValue) as? SwitchDemoViewController {
            switchDemoViewController.coordinator = self
            navigationController?.pushViewController(switchDemoViewController, animated: true)
        }
    }
    
    func goToSliderDemoViewController() {
        if let sliderDemoViewController = UIStoryboard(name: storyBoard.uiControl.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.sliderDemoViewController.rawValue) as? SliderDemoViewController {
            sliderDemoViewController.coordinator = self
            navigationController?.pushViewController(sliderDemoViewController, animated: true)
        }
    }
    
    func goToSegmentedControlViewController() {
        if let segmentedControlViewController = UIStoryboard(name: storyBoard.uiControl.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.segmentedControlViewController.rawValue) as? SegmentedControlViewController {
            segmentedControlViewController.coordinator = self
            navigationController?.pushViewController(segmentedControlViewController, animated: true)
        }
    }
    
    func goToPageControlViewController() {
        if let pageControlViewController = UIStoryboard(name: storyBoard.uiControl.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.pageControlViewController.rawValue) as? PageControlViewController {
            pageControlViewController.coordinator = self
            navigationController?.pushViewController(pageControlViewController, animated: true)
        }
    }
    
    func goToStepperDemoViewController() {
        if let stepperDemoViewController = UIStoryboard(name: storyBoard.uiControl.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.stepperDemoViewController.rawValue) as? StepperDemoViewController {
            stepperDemoViewController.coordinator = self
            navigationController?.pushViewController(stepperDemoViewController, animated: true)
        }
    }
    
    func goToImagePickerDemoViewController() {
        if let imagePickerDemoViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.imagePickerDemoViewController.rawValue) as? ImagePickerDemoViewController {
            imagePickerDemoViewController.coordinator = self
            navigationController?.pushViewController(imagePickerDemoViewController, animated: true)
        }
    }
    
    func goToPhPickerDemoViewController() {
        if let phPickerDemoViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.phPickerDemoViewController.rawValue) as? PhPickerDemoViewController {
            phPickerDemoViewController.coordinator = self
            navigationController?.pushViewController(phPickerDemoViewController, animated: true)
        }
    }
    
    func goToLabelDemoViewController() {
        if let labelDemoViewController = UIStoryboard(name: storyBoard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.labelDemoViewController.rawValue) as? LabelDemoViewController {
            labelDemoViewController.coordinator = self
            navigationController?.pushViewController(labelDemoViewController, animated: true)
        }
    }
    
    func goToProgressViewController() {
        if let progressViewController = UIStoryboard(name: storyBoard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.progressViewController.rawValue) as? ProgressViewController {
            progressViewController.coordinator = self
            navigationController?.pushViewController(progressViewController, animated: true)
        }
    }
    
    func goToActivityIndicatorAndWebViewController() {
        if let activityIndicatorAndWebViewController = UIStoryboard(name: storyBoard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.activityIndicatorAndWebViewController.rawValue) as? ActivityIndicatorAndWebViewController {
            activityIndicatorAndWebViewController.coordinator = self
            navigationController?.pushViewController(activityIndicatorAndWebViewController, animated: true)
        }
    }
    
    func goToUiSearchBarViewController() {
        if let uiSearchBarViewController = UIStoryboard(name: storyBoard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.uiSearchBarViewController.rawValue) as? UiSearchBarViewController {
            uiSearchBarViewController.coordinator = self
            navigationController?.pushViewController(uiSearchBarViewController, animated: true)
        }
    }
    
    func goToStackViewController() {
        if let stackViewController = UIStoryboard(name: storyBoard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.stackViewController.rawValue) as? StackViewController {
            stackViewController.coordinator = self
            navigationController?.pushViewController(stackViewController, animated: true)
        }
    }
    
    func goToTabBarViewController() {
        if let tabBarViewController = UIStoryboard(name: storyBoard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.tabBarViewController.rawValue) as? TabBarViewController {
            tabBarViewController.coordinator = self
            navigationController?.pushViewController(tabBarViewController, animated: true)
        }
    }
    
    func goToFirstViewController() {
        if let firstViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.firstViewController.rawValue) as? FirstViewController {
            firstViewController.coordinator = self
            navigationController?.pushViewController(firstViewController, animated: true)
        }
    }
    
    func goToSecondViewController() {
        if let secondViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.secondViewController.rawValue) as? SecondViewController {
            secondViewController.coordinator = self
            secondViewController.presentationStyle = AppConstants.ShowTitle
            secondViewController.hiddenStatus = true
            navigationController?.show(secondViewController, sender: self)
        }
    }
    
    func goToSecondViewAsPresent() {
        if let secondViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.secondViewController.rawValue) as? SecondViewController {
            secondViewController.coordinator = self
            secondViewController.presentationStyle = AppConstants.presentTitle
            navigationController?.present(secondViewController, animated: true)
        }
    }
    
    func goToSecondViewAsShowDetail() {
        if let secondViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.secondViewController.rawValue) as? SecondViewController {
            secondViewController.coordinator = self
            secondViewController.presentationStyle = AppConstants.showDetailTitle
            navigationController?.showDetailViewController(secondViewController, sender: self)
        }
    }
    
    func goToSecondViewAsPopover( sender: UIButton) {
        if let secondViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.secondViewController.rawValue) as? SecondViewController {
            secondViewController.modalPresentationStyle = .popover
            secondViewController.popoverPresentationController?.permittedArrowDirections = .down
            secondViewController.popoverPresentationController?.sourceView = sender
            secondViewController.presentationStyle = AppConstants.popoverTitle
            navigationController?.present(secondViewController, animated: true)
        }
    }
    
    func goToThirdViewController() {
        if let thirdViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.thirdViewController.rawValue) as? ThirdViewController {
            thirdViewController.coordinator = self
            thirdViewController.delegate = navigationController?.topViewController as? FirstViewController
            navigationController?.pushViewController(thirdViewController, animated: true)
        }
    }
    
    func goToFourthViewController(closure: @escaping (String) -> Void) {
        if let fourthViewController = UIStoryboard(name: storyBoard.uiNavigationController.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.fourthViewController.rawValue) as? FourthViewController {
            fourthViewController.coordinator = self
            fourthViewController.colourTitle = closure
            navigationController?.pushViewController(fourthViewController, animated: true)
        }
    }
    
    func goToAssignedParkingViewController() {
        if let assignedParkingViewController = UIStoryboard(name: storyBoard.parkingLotBook.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.assignedParkingViewController.rawValue) as? AssignedParkingViewController {
            assignedParkingViewController.coordinator = self
            navigationController?.pushViewController(assignedParkingViewController, animated: true)
        }
    }
    
    func goToParkingDetailsViewController(_ data: ParkingDetailModel) {
        if let parkingDetailsViewController = UIStoryboard(name: storyBoard.parkingLotBook.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.parkingDetailsViewController.rawValue) as? ParkingDetailsViewController {
            parkingDetailsViewController.coordinator = self
            parkingDetailsViewController.parkingDataCollection = data
            navigationController?.pushViewController(parkingDetailsViewController, animated: true)
        }
    }
    
    func goToParkingLotViewController() {
        if let parkingLotViewController = UIStoryboard(name: storyBoard.parkingBooking.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.parkingLotViewController.rawValue) as? ParkingLotViewController {
            parkingLotViewController.coordinator = self
            navigationController?.pushViewController(parkingLotViewController, animated: true)
        }
    }
    
    func goToWebServiceViewController() {
        if let webServiceViewController = UIStoryboard(name: storyBoard.webService.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.webServiceViewController.rawValue) as? WebServiceViewController {
            webServiceViewController.coordinator = self
            navigationController?.pushViewController(webServiceViewController, animated: true)
        }
    }
    
    func goToEmployeeViewController() {
        if let employeeViewController = UIStoryboard(name: storyBoard.webService.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.employeeViewController.rawValue) as? EmployeeViewController {
            employeeViewController.coordinator = self
            navigationController?.pushViewController(employeeViewController, animated: true)
        }
    }
    
    func goToUserProfileViewController() {
        if let userProfileViewController = UIStoryboard(name: storyBoard.webService.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.userProfileViewController.rawValue) as? UserProfileViewController {
            userProfileViewController.coordinator = self
            navigationController?.pushViewController(userProfileViewController, animated: true)
        }
    }
    
    func goToUserDetailsViewController(userData: Profile) {
        if let userDetailsViewController = UIStoryboard(name: storyBoard.webService.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.userDetailsViewController.rawValue) as? UserDetailsViewController {
            userDetailsViewController.coordinator = self
            userDetailsViewController.userData = userData
            navigationController?.pushViewController(userDetailsViewController, animated: true)
        }
    }
    
    func goToUploadImageViewController() {
        if let uploadImageViewController = UIStoryboard(name: storyBoard.webService.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.uploadImageViewController.rawValue) as? UploadImageViewController {
            uploadImageViewController.coordinator = self
            navigationController?.pushViewController(uploadImageViewController, animated: true)
        }
    }
    
    func goToStartupViewController() {
        if let startupViewController = UIStoryboard(name: storyBoard.webService.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerName.startupViewController.rawValue) as? StartupViewController {
            startupViewController.coordinator = self
            navigationController?.pushViewController(startupViewController, animated: true)
        }
    }
}
