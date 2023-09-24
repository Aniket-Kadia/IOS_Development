//
//  UserProfileViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/07/23.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblUserDetails: UITableView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    var userProfileViewModel = UserProfileViewModel()
    private var user: [Profile] = []
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureListener()
    }
    
}

//MARK: - Setup View
extension UserProfileViewController {
    func setupView() {
        tblUserDetails.register(UINib(nibName: AppConstants.userProfileTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.userProfileTableViewCell)
        userProfileViewModel.getResponse(page: String(AppConstants.firstPage))
    }
}

//MARK: - IBAction Methods
extension UserProfileViewController {
    @IBAction func changePage(_ sender: UIPageControl) {
        switch sender.currentPage {
        case AppConstants.zeroIndexComponents: userProfileViewModel.getResponse(page: String(AppConstants.firstPage))
        case AppConstants.firstIndexComponents: userProfileViewModel.getResponse(page: String(AppConstants.secondPage))
        default: return
        }
    }
}

//MARK: - Configure Listener
extension UserProfileViewController {
    func configureListener() {
        userProfileViewModel.userData.bind { response in
            guard let response = response else { return }
            self.user = response
            self.tblUserDetails.reloadData()
        }
        
        userProfileViewModel.dataDeleteID.bind { [weak self] id in
            guard let self = self, let id = id else { return }
            self.user.remove(at: id - 1)
            self.tblUserDetails.reloadData()
        }
        
        userProfileViewModel.errorState.bind { [weak self] response in
            DispatchQueue.main.async {
                self?.showAlert(title: AppConstants.dataNotDeleted, message: AppConstants.dataNotDeletedMessage, actionTitles: [AppConstants.ok], actions: [nil])
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension UserProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblUserDetails.dequeueReusableCell(withIdentifier: AppConstants.userProfileTableViewCell, for: indexPath) as? UserProfileTableViewCell else {
            return UITableViewCell()
        }
        cell.configuration(userDetails: user[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension UserProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.goToUserDetailsViewController(userData: user[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userProfileViewModel.deleteUser(id: String(indexPath.row + 1))
        }
    }
}
