//
//  AssignedParkingViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/06/23.
//

import UIKit

class AssignedParkingViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var tblViewParkinglot: UITableView!
    
    //MARK: - Variables
    weak var coordinator: AppCoordinator?
    private var parkingDataCollection = ParkingDetailModel.getParkingDetails()
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension AssignedParkingViewController {
    func setupView() {
        tblViewParkinglot.register(UINib(nibName: AppConstants.parkingDetailTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.parkingDetailTableViewCell)
    }
}

//MARK: - UITableViewDataSource
extension AssignedParkingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        parkingDataCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewParkinglot.dequeueReusableCell(withIdentifier: AppConstants.parkingDetailTableViewCell, for: indexPath) as? ParkingDetailTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureCell(data: parkingDataCollection[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension AssignedParkingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblViewParkinglot.deselectRow(at: indexPath, animated: true)
        coordinator?.goToParkingDetailsViewController(parkingDataCollection[indexPath.row])
    }
}
