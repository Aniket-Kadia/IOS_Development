//
//  StartupTableViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 06/07/23.
//

import UIKit

class StartupTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblIncubationCenter: UILabel!
    @IBOutlet weak var lblNameOfStartup: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblSector: UILabel!
    @IBOutlet weak var lblCompanyProfile: UILabel!
    
    //MARK: - View Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1
    }
    
    //MARK: - Configure Cell
    func configureCell(startupDetail: Record) {
        lblIncubationCenter.text = startupDetail.incubationCenter
        lblNameOfStartup.text = startupDetail.nameOfTheStartup
        lblLocation.text = startupDetail.locationOfCompany
        lblSector.text = startupDetail.sector
        lblCompanyProfile.text = startupDetail.companyProfile
    }
}
