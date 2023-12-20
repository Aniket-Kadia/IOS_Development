//
//  EmployeeViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 03/07/23.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var textEmployeeId: UITextField!
    @IBOutlet weak var lblTitleId: UILabel!
    @IBOutlet weak var lblTitleFirstName: UILabel!
    @IBOutlet weak var lblTitleLastName: UILabel!
    @IBOutlet weak var lblTitleEmail: UILabel!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    private let employeeViewModel = EmployeeViewModel()
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureListener()
    }
}

//MARK: - IBAction Methods
extension EmployeeViewController {
    @IBAction func tapOnSubmit(_ sender: UIButton) {
        getApiData()
    }
}

//MARK: - Setup View
extension EmployeeViewController {
    func getApiData() {
        guard let employeeID = textEmployeeId.text else {
            return
        }
        employeeViewModel.getResponse(employeeID: employeeID.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}

//MARK: - Configure Listener
extension EmployeeViewController {
    func configureListener() {
        employeeViewModel.employeeDetail.bind { response in
            DispatchQueue.main.async { [weak self] in
                guard let response = response, let self = self else { return }
                self.lblTitleId.isHidden = false
                self.lblTitleFirstName.isHidden = false
                self.lblTitleLastName.isHidden = false
                self.lblTitleEmail.isHidden = false
                if let id = response.id {
                    self.lblId.text = String(id)
                }
                self.lblFirstName.text = response.first_name
                self.lblLastName.text = response.last_name
                self.lblEmail.text = response.email
                guard let imageUrl = URL(string: (response.avatar)!) else {
                    return
                }
                DispatchQueue.global().async {
                    let image = try? Data(contentsOf: imageUrl)
                    DispatchQueue.main.async {
                        self.imgProfile.image = UIImage(data: image!)
                    }
                }
            }
        }
        
        employeeViewModel.errorState.bind {[weak self] response in
            DispatchQueue.main.async {
                self?.showAlert(title: AppConstants.dataNotFound, message: AppConstants.dataNotFoundMessage, actionTitles: [AppConstants.ok], actions: [nil])
            }
        }
    }
}
