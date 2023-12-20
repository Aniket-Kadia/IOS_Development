//
//  TimesheetViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 02/06/23.
//

import UIKit

class TimesheetViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblParkingLotName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!

    //MARK: - Configure Cell
    func configureCell(indexpath: IndexPath) {
        let parkingSheetData = ParkingLotModel.getDataTimeSheetData()
        lblParkingLotName.text = parkingSheetData[indexpath.row].parkingLotName
        lblDate.text = parkingSheetData[indexpath.row].date
        lblTime.text = parkingSheetData[indexpath.row].time
    }
}
