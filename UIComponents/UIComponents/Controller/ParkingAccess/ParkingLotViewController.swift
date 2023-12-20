//
//  parkingLotViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 02/06/23.
//

import UIKit

class ParkingLotViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblParkingDetails: UITableView!
    @IBOutlet weak var segmentParking: UISegmentedControl!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    var isAllocate: Bool = false
    var parkingStartScreen = true
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
    }
}

//MARK: - Setup View
extension ParkingLotViewController {
    func setupview() {
        tblParkingDetails.dataSource = self
        tblParkingDetails.delegate = self
        tblParkingDetails.register(UINib(nibName: AppConstants.parkingLotViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.parkingLotViewCell)
        tblParkingDetails.register(UINib(nibName: AppConstants.timesheetViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.timesheetViewCell)
        tblParkingDetails.allowsSelection = false
        segmentParking.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        tblParkingDetails.sectionHeaderTopPadding = CGFloat(AppConstants.zeroConstantValue)
    }
}

//MARK: - IBAction Methods
extension ParkingLotViewController {
    @IBAction func changeParkingSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case AppConstants.zeroIndexComponents:
            parkingStartScreen = true
            tblParkingDetails.reloadData()
        case AppConstants.firstIndexComponents:
            parkingStartScreen = false
            tblParkingDetails.reloadData()
        default:
            return
        }
    }
}

//MARK: - UITableViewDataSource
extension ParkingLotViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if parkingStartScreen {
            return ParkingLotModel.getDataParkingPlots().count
        } else {
            return ParkingLotModel.getDataTimeSheetData().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if parkingStartScreen {
            guard let cell = tblParkingDetails.dequeueReusableCell(withIdentifier: AppConstants.parkingLotViewCell, for: indexPath) as? ParkingLotViewCell
            else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.configureCell(indexPath: indexPath)
            return cell
        } else {
            guard let cell = tblParkingDetails.dequeueReusableCell(withIdentifier: AppConstants.timesheetViewCell, for: indexPath) as? TimesheetViewCell
            else {
                return UITableViewCell()
            }
            cell.configureCell(indexpath: indexPath)
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension ParkingLotViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray6
        
        if parkingStartScreen {
            let labelLeft = UILabel()
            labelLeft.translatesAutoresizingMaskIntoConstraints = false
            labelLeft.text = AppConstants.parkingLotName
            labelLeft.font = UIFont.boldSystemFont(ofSize: CGFloat(AppConstants.fontSize))
            headerView.addSubview(labelLeft)
            
            let labelRight = UILabel()
            labelRight.translatesAutoresizingMaskIntoConstraints = false
            labelRight.text = AppConstants.action
            labelRight.font = UIFont.boldSystemFont(ofSize: CGFloat(AppConstants.fontSize))
            headerView.addSubview(labelRight)
            
            NSLayoutConstraint.activate([
                labelLeft.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                labelLeft.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: CGFloat(AppConstants.leadingAnchorConstantParkingLot)),
                labelRight.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                labelRight.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: CGFloat(AppConstants.trailingAnchorConstantParkingLot))
            ])
            return headerView
        } else {
            let headerView = UIView()
            headerView.backgroundColor = .systemGray6
            
            let labelLeft = UILabel()
            labelLeft.translatesAutoresizingMaskIntoConstraints = false
            labelLeft.text = AppConstants.parkingName
            labelLeft.font = UIFont.boldSystemFont(ofSize: CGFloat(AppConstants.fontSize))
            headerView.addSubview(labelLeft)
            
            let labelRight = UILabel()
            labelRight.translatesAutoresizingMaskIntoConstraints = false
            labelRight.text = AppConstants.date
            labelRight.font = UIFont.boldSystemFont(ofSize: CGFloat(AppConstants.fontSize))
            headerView.addSubview(labelRight)
            
            let labelCenter = UILabel()
            labelCenter.translatesAutoresizingMaskIntoConstraints = false
            labelCenter.text = AppConstants.startTime
            labelCenter.font = UIFont.boldSystemFont(ofSize: CGFloat(AppConstants.fontSize))
            headerView.addSubview(labelCenter)
            
            NSLayoutConstraint.activate([
                labelLeft.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                labelLeft.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: CGFloat(AppConstants.labelLeftleadingAnchorParkingLot)),
                labelCenter.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: CGFloat(AppConstants.labelCenterCenterXAnchorParkingLot)),
                labelCenter.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                labelRight.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                labelRight.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: CGFloat(AppConstants.labelRightTrailingAnchorParkingLot))
            ])
            return headerView
        }
    }
}

//MARK: - confirm MyCellDelegate
extension ParkingLotViewController: ParkingState {
    func tapStartButton(cell: UITableViewCell) {
        if !isAllocate {
            if let index = tblParkingDetails.indexPath(for: cell) {
                ParkingLotModel.parkingPlots[index.row].startButtonStatus = !ParkingLotModel.parkingPlots[index.row].startButtonStatus
                ParkingLotModel.parkingPlots[index.row].playPauseviewStatus = !ParkingLotModel.parkingPlots[index.row].playPauseviewStatus
                tblParkingDetails.reloadData()
                isAllocate = true
            }
        } else {
            var alertParkingNotAllot = UIAlertController(title: AppConstants.parkingNotAvailable, message: AppConstants.alertMessageAlreadyParkingAlloted, preferredStyle: .alert)
            alertParkingNotAllot.addAction(UIAlertAction(title: AppConstants.ok, style: .cancel))
            self.present(alertParkingNotAllot, animated: true)
        }
    }
    
    func tapStopButton(cell: UITableViewCell) {
        if let index = tblParkingDetails.indexPath(for: cell) {
            ParkingLotModel.parkingPlots[index.row].startButtonStatus = !ParkingLotModel.parkingPlots[index.row].startButtonStatus
            ParkingLotModel.parkingPlots[index.row].playPauseviewStatus = !ParkingLotModel.parkingPlots[index.row].playPauseviewStatus
            tblParkingDetails.reloadData()
            isAllocate = false
        }
    }
    
    func tapPlayPauseButton(cell: UITableViewCell) {
        if let index = tblParkingDetails.indexPath(for: cell) {
            ParkingLotModel.parkingPlots[index.row].isAway = !ParkingLotModel.parkingPlots[index.row].isAway
            tblParkingDetails.reloadData()
        }
    }
}
