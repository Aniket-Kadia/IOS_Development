//
//  Enumeration.swift
//  UIComponents
//
//  Created by Aniket Kadia on 16/05/23.
//

import Foundation

enum CountryEnum: Int {
    case all
    case asia
    case europe
}

enum Places: Int {
    case Home
    case College
    case Simform
}

enum storyBoard: String {
    case main = "Main"
    case uiView = "UIView"
    case uiScrollView = "UIScrollView"
    case uiControl = "UIControl"
    case uiNavigationController = "UINavigationController"
    case uiScreen = "UIScreen"
    case parkingLotBook = "ParkingLotBook"
    case parkingBooking = "ParkingBooking"
    case webService = "WebService"
}

enum ViewControllerName: String {
    case mainViewController = "MainViewController"
    case uiViewController = "UiViewController"
    case uiScrollViewController = "UiScrollViewController"
    case uiControlViewController = "UiControlViewController"
    case uiNavigationViewController = "UiNavigationViewController"
    case autoLayoutViewController = "AutoLayoutViewController"
    case labelDemoViewController = "LabelDemoViewController"
    case progressViewController = "ProgressViewController"
    case activityIndicatorAndWebViewController = "ActivityIndicatorAndWebViewController"
    case uiSearchBarViewController = "UiSearchBarViewController"
    case stackViewController = "StackViewController"
    case tabBarViewController = "TabBarViewController"
    case textViewDemoViewController = "TextViewDemoViewController"
    case scrollViewDemoViewController = "ScrollViewDemoViewController"
    case tableViewDemoViewController = "TableViewDemoViewController"
    case tableViewdelegatesViewController = "TableViewdelegatesViewController"
    case cartTableViewController = "CartTableViewController"
    case jobProfileTableViewController = "JobProfileTableViewController"
    case collectionViewDemoViewController = "CollectionViewDemoViewController"
    case buttonDemoViewController = "ButtonDemoViewController"
    case textFieldDemoViewController = "TextFieldDemoViewController"
    case switchDemoViewController = "SwitchDemoViewController"
    case sliderDemoViewController = "SliderDemoViewController"
    case segmentedControlViewController = "SegmentedControlViewController"
    case pageControlViewController = "PageControlViewController"
    case stepperDemoViewController = "StepperDemoViewController"
    case imagePickerDemoViewController = "ImagePickerDemoViewController"
    case phPickerDemoViewController = "PhPickerDemoViewController"
    case firstViewController = "FirstViewController"
    case secondViewController = "SecondViewController"
    case thirdViewController = "ThirdViewController"
    case fourthViewController = "FourthViewController"
    case assignedParkingViewController = "AssignedParkingViewController"
    case parkingDetailsViewController = "ParkingDetailsViewController"
    case parkingLotViewController = "ParkingLotViewController"
    case webServiceViewController = "WebServiceViewController"
    case employeeViewController = "EmployeeViewController"
    case userProfileViewController = "UserProfileViewController"
    case userDetailsViewController = "UserDetailsViewController"
    case uploadImageViewController = "UploadImageViewController"
    case startupViewController = "StartupViewController"
}

enum colourGroup: Int {
    case green
    case yellow
}

enum LoginSignupFields: String {
    case email = "email"
    case passwod = "password"
}
