//
//  ControllerIdentifiersModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 27/05/23.
//

import UIKit

struct ControllerDataModel {
    var title: String
    var viewControllerName: ViewControllerName
}

struct ControllerIdentifiersModel {
    var storyBoardName: storyBoard
    var viewControllersName: [ControllerDataModel]
    
    static func getViewControllers(filterStroyBoard: storyBoard) -> [ControllerDataModel] {
        let data = [ControllerIdentifiersModel(storyBoardName: .main,
                                          viewControllersName: [ControllerDataModel(title: "AutoLayout Screen", viewControllerName: .autoLayoutViewController),
                                                                ControllerDataModel(title: "UIView", viewControllerName: .uiViewController),
                                                                ControllerDataModel(title: "UIControl", viewControllerName: .uiControlViewController),
                                                                ControllerDataModel(title: "UIScrollView", viewControllerName: .uiScrollViewController),
                                                                ControllerDataModel(title: "UINavigation", viewControllerName: .uiNavigationViewController),
                                                                ControllerDataModel(title: "ParkingDetailsScreen", viewControllerName: .assignedParkingViewController),
                                                                ControllerDataModel(title: "Parking Access Screen", viewControllerName: .parkingLotViewController),
                                                                ControllerDataModel(title: "Web Services", viewControllerName: .webServiceViewController)]),
                    ControllerIdentifiersModel(storyBoardName: .uiView,
                                          viewControllersName: [ControllerDataModel(title: "UILabel", viewControllerName: .labelDemoViewController),
                                                                ControllerDataModel(title: "UIProgressView", viewControllerName: .progressViewController),
                                                                ControllerDataModel(title: "WKWebView", viewControllerName: .activityIndicatorAndWebViewController),
                                                                ControllerDataModel(title: "UISearchBar", viewControllerName: .uiSearchBarViewController),
                                                                ControllerDataModel(title: "StckView", viewControllerName: .stackViewController),
                                                                ControllerDataModel(title: "UITabBar", viewControllerName: .tabBarViewController)]),
                    ControllerIdentifiersModel(storyBoardName: .uiScrollView,
                                          viewControllersName: [ControllerDataModel(title: "UITextView", viewControllerName: .textViewDemoViewController),
                                                                ControllerDataModel(title: "UIScrollView", viewControllerName: .scrollViewDemoViewController),
                                                                ControllerDataModel(title: "UITableView", viewControllerName: .tableViewDemoViewController),
                                                                ControllerDataModel(title: "UITableViewDelegates", viewControllerName: .tableViewdelegatesViewController),
                                                                ControllerDataModel(title: "UITable: Cart", viewControllerName: .cartTableViewController),
                                                                ControllerDataModel(title: "UITable: JobProfiles", viewControllerName: .jobProfileTableViewController),
                                                                ControllerDataModel(title: "UICollectionView", viewControllerName: .collectionViewDemoViewController)]),
                    ControllerIdentifiersModel(storyBoardName: .uiControl,
                                          viewControllersName: [ControllerDataModel(title: "UIButton", viewControllerName: .buttonDemoViewController),
                                                                ControllerDataModel(title: "UITextField", viewControllerName: .textFieldDemoViewController),
                                                                ControllerDataModel(title: "UISwitch", viewControllerName: .switchDemoViewController),
                                                                ControllerDataModel(title: "UISlider", viewControllerName: .sliderDemoViewController),
                                                                ControllerDataModel(title: "UISegmentedControl", viewControllerName: .segmentedControlViewController),
                                                                ControllerDataModel(title: "UIPageControl", viewControllerName: .pageControlViewController),
                                                                ControllerDataModel(title: "UIStepper", viewControllerName: .stepperDemoViewController)]),
                    ControllerIdentifiersModel(storyBoardName: .uiNavigationController,
                                          viewControllersName: [ControllerDataModel(title: "UIImagePicker", viewControllerName: .imagePickerDemoViewController),
                                                                ControllerDataModel(title: "PHPicker", viewControllerName: .phPickerDemoViewController),
                                                                ControllerDataModel(title: "Navigation", viewControllerName: .firstViewController)])]
        
        switch filterStroyBoard {
        case .main:
            return data[0].viewControllersName
        case .uiView:
            return data[1].viewControllersName
        case .uiScrollView:
            return data[2].viewControllersName
        case .uiControl:
            return data[3].viewControllersName
        case .uiNavigationController:
            return data[4].viewControllersName
        case .parkingLotBook:
            return data[5].viewControllersName
        case .parkingBooking:
            return data[5].viewControllersName
        default:
            return data[0].viewControllersName
        }
    }
}
