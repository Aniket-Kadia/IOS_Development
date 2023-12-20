//
//  ParkingDetailsViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/06/23.
//

import UIKit

class ParkingDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var imgViewPlace: UIImageView!
    @IBOutlet weak private var lblLoacationId: UILabel!
    @IBOutlet weak private var lblParkingLotName: UILabel!
    @IBOutlet weak private var lblOperatingHours: UILabel!
    @IBOutlet weak private var lblLocationPhoneNo: UILabel!
    @IBOutlet weak private var collectionviewAmenities: UICollectionView!
    @IBOutlet weak private var collectionViewAmenitiesHeight: NSLayoutConstraint!
    @IBOutlet weak private var tblViewAttendant: UITableView!
    @IBOutlet weak private var tblviewAttendantHeight: NSLayoutConstraint!
    @IBOutlet weak private var imgviewSupervisorProfile: UIImageView!
    @IBOutlet weak private var lblSupervisorName: UILabel!
    @IBOutlet weak private var lblSupervisorPhoneNo: UILabel!
    @IBOutlet weak private var imgviewMaintenanceProfile: UIImageView!
    @IBOutlet weak private var lblMaintenanceName: UILabel!
    @IBOutlet weak private var lblMaintenancePhoneNo: UILabel!
    @IBOutlet weak private var lblOne: UILabel!
    @IBOutlet weak private var lblTwo: UILabel!
    @IBOutlet weak private var lblthree: UILabel!
    
    //MARK: - Variables
    var parkingDataCollection: ParkingDetailModel?
    weak var coordinator: AppCoordinator?
    private var indexForDetails: IndexPath?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey], let newsize  = newvalue as? CGSize {
                DispatchQueue.main.async {
                    self.tblviewAttendantHeight.constant = newsize.height
                }
            }
        }
    }
}

//MARK: - Setup View
extension ParkingDetailsViewController {
    func setupView() {
        navigationController?.isNavigationBarHidden = true
        tblViewAttendant.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        if let parkingDataCollection {
            imgViewPlace.image = UIImage.named(parkingDataCollection.detailPlaceImage)
            lblLoacationId.text = parkingDataCollection.loacationId
            lblParkingLotName.text = parkingDataCollection.parkingLotName
            lblOperatingHours.text = parkingDataCollection.operatingHours
            lblLocationPhoneNo.text = parkingDataCollection.locationPhoneNo
            imgviewSupervisorProfile.image = UIImage.named(parkingDataCollection.supervisorProfile)
            lblSupervisorName.text = parkingDataCollection.supervisorName
            lblSupervisorPhoneNo.text = parkingDataCollection.supervisorPhoneNo
            imgviewMaintenanceProfile.image = UIImage.named(parkingDataCollection.maintenanceProfile)
            lblMaintenanceName.text = parkingDataCollection.maintenanceName
            lblMaintenancePhoneNo.text = parkingDataCollection.maintenancePhoneNo
        }
        collectionviewAmenities.register(UINib(nibName: AppConstants.amenitiesCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: AppConstants.amenitiesCollectionViewCell)
        tblViewAttendant.register(UINib(nibName: AppConstants.userTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.userTableViewCell)
        collectionViewAmenitiesHeight.constant = collectionviewAmenities.collectionViewLayout.collectionViewContentSize.height
        tblViewAttendant.allowsSelection = false
        lblOne.layer.cornerRadius = lblOne.frame.size.height / 2
        lblOne.layer.masksToBounds = true
        lblTwo.layer.cornerRadius = lblTwo.frame.size.height / 2
        lblTwo.layer.masksToBounds = true
        lblthree.layer.cornerRadius = lblthree.frame.size.height / 2
        lblthree.layer.masksToBounds = true
    }
}

//MARK: - IBAction Methods
extension ParkingDetailsViewController {
    @IBAction func tapOnBack(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        navigationController?.isNavigationBarHidden = false
    }
}

//MARK: - UICollectionViewDataSource
extension ParkingDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parkingDataCollection?.amenitiesDetail.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionviewAmenities.dequeueReusableCell(withReuseIdentifier: AppConstants.amenitiesCollectionViewCell, for: indexPath) as? AmenitiesCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        if let parkingDataCollection {
            cell.configureCell(data: parkingDataCollection.amenitiesDetail[indexPath.row])
        }
        return cell
    }
}

//MARK: - UITableViewDataSource
extension ParkingDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkingDataCollection?.attendant.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewAttendant.dequeueReusableCell(withIdentifier: AppConstants.userTableViewCell, for: indexPath) as? UserTableViewCell
        else {
            return UITableViewCell()
        }
        
        if let parkingDataCollection {
            cell.configureCell(data: parkingDataCollection.attendant[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ParkingDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionviewAmenities.frame.width / AppConstants.collectionviewAmenitiesWidth , height: AppConstants.collectionviewAmenitiesHeight)
    }
}
