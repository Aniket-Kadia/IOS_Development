//
//  UISearchBarViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 10/05/23.
//

import UIKit

class UiSearchBarViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tblViewCountry: UITableView!
    
    //MARK: - Variables
    var filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .all)
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
    }
}

//MARK: - Setup View
extension UiSearchBarViewController {
    func setupview() {
        searchBar.delegate = self
        searchBar.showsScopeBar = true
    }
}

//MARK: - UITableViewDataSource
extension UiSearchBarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { filterCountry.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewCountry.dequeueReusableCell(withIdentifier: AppConstants.uiSearchBarCellForCountry, for: indexPath)
        cell.textLabel?.text = filterCountry[indexPath.row]
        return cell
    }
}

//MARK: - UISearchBarDelegate
extension UiSearchBarViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            switch (searchBar.selectedScopeButtonIndex) {
            case CountryEnum.asia.rawValue : filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .asia)
            case CountryEnum.europe.rawValue: filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .europe)
            default: filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .all)
            }
        } else {
            switch (searchBar.selectedScopeButtonIndex) {
            case CountryEnum.asia.rawValue: filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .asia).filter{ $0.contains(searchText)}
            case CountryEnum.europe.rawValue: filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .europe).filter{ $0.contains(searchText)}
            default: filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .all).filter{ $0.contains(searchText)}
            }
        }
        tblViewCountry.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch (selectedScope) {
        case CountryEnum.asia.rawValue: filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .asia)
        case CountryEnum.europe.rawValue: filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .europe)
        default: filterCountry = CountryResponseModel.getCountryWithContinents(caseval: .all)
        }
        tblViewCountry.reloadData()
    }
}
