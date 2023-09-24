//
//  ParkingLotModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 02/06/23.
//

import Foundation
struct TimeSheetModel {
    var parkingLotName: String
    var date: String
    var time: String
}

struct ParkingLotModel {
    var parkingLotName: String
    var startButtonStatus: Bool
    var playPauseviewStatus: Bool
    var isAway: Bool
    static var parkingPlots = [ParkingLotModel(parkingLotName: "Parking Lot 1", startButtonStatus: false, playPauseviewStatus: true, isAway: true),
                               ParkingLotModel(parkingLotName: "Parking Lot 2", startButtonStatus: false, playPauseviewStatus: true, isAway: true),
                               ParkingLotModel(parkingLotName: "Parking Lot A", startButtonStatus: false, playPauseviewStatus: true, isAway: true),
                               ParkingLotModel(parkingLotName: "Parking Lot B", startButtonStatus: false, playPauseviewStatus: true, isAway: true),
                               ParkingLotModel(parkingLotName: "Parking Lot 3", startButtonStatus: false, playPauseviewStatus: true, isAway: true),
                               ParkingLotModel(parkingLotName: "Parking Lot C", startButtonStatus: false, playPauseviewStatus: true, isAway: true)]
    static var timeSheetData = [TimeSheetModel(parkingLotName: "Parking Lot 1", date: "June 2, 2023", time: "09: 05 AM"),
                                TimeSheetModel(parkingLotName: "Parking Lot 2", date: "June 2, 2023", time: "11: 55 AM"),
                                TimeSheetModel(parkingLotName: "Parking Lot A", date: "June 2, 2023", time: "03: 40 PM"),
                                TimeSheetModel(parkingLotName: "Parking Lot B", date: "June 2, 2023", time: ""),
                                TimeSheetModel(parkingLotName: "Parking Lot 3", date: "June 2, 2023", time: ""),
                                TimeSheetModel(parkingLotName: "Parking Lot c", date: "June 2, 2023", time: "")]
    static func getDataParkingPlots() -> [ParkingLotModel] {
        return parkingPlots
    }
    
    static func getDataTimeSheetData() -> [TimeSheetModel] {
        return timeSheetData
    }
}
