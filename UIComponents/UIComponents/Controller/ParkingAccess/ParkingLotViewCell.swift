//
//  ParkingLotViewCell.swift
//  UIComponents
//
//  Created by Aniket Kadia on 02/06/23.
//

import UIKit

class ParkingLotViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblParkingLotName: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var playPauseview: UIStackView!
    @IBOutlet weak var btnPlayPause: UIButton!
    
    //MARK: - Variables
    var delegate: ParkingState?
}

//MARK: - IBAction Methods
extension ParkingLotViewCell {
    @IBAction func tapOnStart(sender: AnyObject) {
        delegate?.tapStartButton(cell: self)
    }
    
    @IBAction func tapOnStop(sender: AnyObject) {
        delegate?.tapStopButton(cell: self)
    }
    
    @IBAction func tapPlayPauseButton(sender: AnyObject) {
        delegate?.tapPlayPauseButton(cell: self)
    }
}

//MARK: - Configure Cell
extension ParkingLotViewCell {
    func configureCell(indexPath: IndexPath) {
        let parkingData = ParkingLotModel.getDataParkingPlots()
        lblParkingLotName.text =  parkingData[indexPath.row].parkingLotName
        btnStart.isHidden = parkingData[indexPath.row].startButtonStatus
        if parkingData[indexPath.row].isAway {
            btnPlayPause.setImage(UIImage(systemName: AppConstants.circlePauseIcon), for: .normal)
        } else {
            btnPlayPause.setImage(UIImage(systemName: AppConstants.circlePlayIcon), for: .normal)
        }
        playPauseview.isHidden = parkingData[indexPath.row].playPauseviewStatus
    }
}

//MARK: - Protocol ParkingState
protocol ParkingState {
    func tapStartButton(cell: UITableViewCell)
    func tapStopButton(cell: UITableViewCell)
    func tapPlayPauseButton(cell: UITableViewCell)
}
