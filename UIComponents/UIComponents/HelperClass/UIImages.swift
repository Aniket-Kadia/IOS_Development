//
//  UIImages.swift
//  UIComponents
//
//  Created by Aniket Kadia on 09/05/23.
//

import Foundation
import UIKit

//MARK: UIImage
extension UIImage {
    static func named(_ name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage()
    }
    static let characterMonk = UIImage(named: "character_monk")
    static let characterWizard = UIImage(named: "character_wizard")
    static let bmw = UIImage(named: "bmw")
    static let ford = UIImage(named: "ford")
    static let jeep = UIImage(named: "jeep")
    static let tesla = UIImage(named: "tesla")
    static let lamborghini = UIImage(named: "lamborghini")
    static let rollsRoyce = UIImage(named: "rollsRoyce")
    static let volkswagen = UIImage(named: "volkswagen")
    static let location = UIImage(named: "location")
    static let boldICON = UIImage(named: "boldICON")
    static let italicIcon = UIImage(named: "italicIcon")
    static let cart = UIImage(named: "cart")
    static let exclamationmark = UIImage(named: "exclamationmark")
    
    static let parkingPlace1 = UIImage(named: "parkingPlace1")
    static let parkingPlace2 = UIImage(named: "parkingPlace2")
    static let parkingPlace3 = UIImage(named: "parkingPlace3")
    static let userProfile = UIImage(named: "userProfile")
    static let parkingPlaceDetail1 = UIImage(named: "parkingPlaceDetail1")
    static let parkingPlaceDetail2 = UIImage(named: "parkingPlaceDetail2")
    static let elctric = UIImage(named: "elctric")
    static let inAndOut = UIImage(named: "inAndOut")
    static let outdoorLot = UIImage(named: "outdoorLot")
    static let overnightParking = UIImage(named: "overnightParking")
    static let paybyPlate = UIImage(named: "paybyPlate")
    static let termsOfService = UIImage(named: "termsOfService")
    static let valet = UIImage(named: "valet")
    static let attendant1 = UIImage(named: "attendant1")
    static let attendant2 = UIImage(named: "attendant2")
    static let attendant3 = UIImage(named: "attendant3")
    static let attendant4 = UIImage(named: "attendant4")
    static let maintenance = UIImage(named: "maintenance")
    static let supervisor = UIImage(named: "supervisor")
    static let pause = UIImage(systemName: "pause.circle")
    static let play = UIImage(systemName: "play.circle")
}
