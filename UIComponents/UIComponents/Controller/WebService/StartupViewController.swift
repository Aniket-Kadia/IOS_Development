//
//  StartupViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 06/07/23.
//

import UIKit
import Alamofire

class StartupViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblStartupDetails: UITableView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    private var startupList = [Record]()
    private var startupTitle: String?
    private let startupViewModel = StartupViewModel()
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureListener()
    }
}

//MARK: - Setup View
extension StartupViewController {
    func setupView() {
        tblStartupDetails.register(UINib(nibName: AppConstants.startupTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.startupTableViewCell)
        startupViewModel.getStartupList(offset: 0)
    }
}


//MARK: - Configure Listener
extension StartupViewController {
    func configureListener() {
        startupViewModel.startupList.bind { [weak self] startupDetail in
            guard let startupDetail = startupDetail else { return }
            self?.startupList.append(contentsOf: startupDetail.records)
            self?.startupTitle = startupDetail.title
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self?.tblStartupDetails.reloadData()
                self?.tblStartupDetails.tableFooterView = nil
            })
        }
    }
}

//MARK: - UITableViewDataSource
extension StartupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        startupList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblStartupDetails.dequeueReusableCell(withIdentifier: AppConstants.startupTableViewCell, for: indexPath) as? StartupTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(startupDetail: startupList[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension StartupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == startupList.count - 1 {
            let cctivityIndicator = UIActivityIndicatorView()
            cctivityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 70)
            cctivityIndicator.startAnimating()
            tblStartupDetails.tableFooterView = cctivityIndicator
            startupViewModel.getStartupList(offset: startupList.count)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        return activityIndicator
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return startupTitle
    }
}
