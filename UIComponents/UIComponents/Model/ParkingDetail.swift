//
//  ParkingDetailsModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/06/23.
//

import Foundation

struct AmenitiesModel {
    var amenitiesIcon: String
    var amenitiesName: String
}

struct AttendantsModel {
    var profilePicture: String
    var name: String
    var phoneNo: String
}

struct ParkingDetailModel {
    var placeImage: String
    var pincode: Int
    var title: String
    var address: String
    var detailPlaceImage: String
    var loacationId: String
    var parkingLotName: String
    var operatingHours: String
    var locationPhoneNo: String
    var amenitiesDetail: [AmenitiesModel]
    var attendant: [AttendantsModel]
    var supervisorProfile: String
    var supervisorName: String
    var supervisorPhoneNo: String
    var maintenanceProfile: String
    var maintenanceName: String
    var maintenancePhoneNo: String
    
    static var parkingDetails = [ParkingDetailModel(placeImage: "parkingPlace1",
                                                    pincode: 24582, title: "179 W Washington St. - Garage",
                                                    address: "1280, st. ME, DC Road, 20001",
                                                    detailPlaceImage: "parkingPlaceDetail1",
                                                    loacationId: "A101",
                                                    parkingLotName: "Alpha mall",
                                                    operatingHours: "6 AM to 11 PM",
                                                    locationPhoneNo: "245-854-2145",
                                                    amenitiesDetail: [AmenitiesModel(amenitiesIcon: "valet", amenitiesName: "valet"),
                                                                      AmenitiesModel(amenitiesIcon: "elctric", amenitiesName: "Electric Charging"),
                                                                      AmenitiesModel(amenitiesIcon: "overnightParking", amenitiesName: "Overnight Parking"),
                                                                      AmenitiesModel(amenitiesIcon: "paybyPlate", amenitiesName: "Pay-by-plate"),
                                                                      AmenitiesModel(amenitiesIcon: "outdoorLot", amenitiesName: "outdoor Lot"),
                                                                      AmenitiesModel(amenitiesIcon: "termsOfService", amenitiesName: "Terms Of Service"),
                                                                      AmenitiesModel(amenitiesIcon: "inAndOut", amenitiesName: "In And Out")],
                                                    attendant: [AttendantsModel(profilePicture: "attendant1", name: "James franco", phoneNo: "215-854-8542"),
                                                                AttendantsModel(profilePicture: "attendant2", name: "David Elsonbaty", phoneNo: "245-965-7125"),
                                                                AttendantsModel(profilePicture: "attendant3", name: "Ramon Bateman", phoneNo: "263-845-7458"),
                                                                AttendantsModel(profilePicture: "attendant4", name: "Spencer Horton", phoneNo: "215-854-8542")],
                                                    supervisorProfile: "supervisor",
                                                    supervisorName: "Joshua wilson",
                                                    supervisorPhoneNo: "215-854-8542",
                                                    maintenanceProfile: "maintenance",
                                                    maintenanceName: "Irvine Acosta",
                                                    maintenancePhoneNo: "215-854-8542"),
                                 ParkingDetailModel(placeImage: "parkingPlace2",
                                                    pincode: 24865, title: "55 W Rockefeller center",
                                                    address: "1280, st. ME, DC Road, 20001",
                                                    detailPlaceImage: "parkingPlaceDetail2",
                                                    loacationId: "B205",
                                                    parkingLotName: "Himalaya mall",
                                                    operatingHours: "5 AM to 2 AM",
                                                    locationPhoneNo: "245-456-7853",
                                                    amenitiesDetail: [AmenitiesModel(amenitiesIcon: "valet", amenitiesName: "valet"),
                                                                      AmenitiesModel(amenitiesIcon: "elctric", amenitiesName: "Electric Charging"),
                                                                      AmenitiesModel(amenitiesIcon: "overnightParking", amenitiesName: "Overnight Parking"),
                                                                      AmenitiesModel(amenitiesIcon: "paybyPlate", amenitiesName: "Pay-by-plate"),
                                                                      AmenitiesModel(amenitiesIcon: "outdoorLot", amenitiesName: "outdoor Lot"),
                                                                      AmenitiesModel(amenitiesIcon: "termsOfService", amenitiesName: "Terms Of Service"),
                                                                      AmenitiesModel(amenitiesIcon: "inAndOut", amenitiesName: "In And Out")],
                                                    attendant: [AttendantsModel(profilePicture: "attendant1", name: "James franco", phoneNo: "215-854-8542"),
                                                                AttendantsModel(profilePicture: "attendant2", name: "David Elsonbaty", phoneNo: "245-965-7125"),
                                                                AttendantsModel(profilePicture: "attendant3", name: "Ramon Bateman", phoneNo: "263-845-7458"),
                                                                AttendantsModel(profilePicture: "attendant4", name: "Spencer Horton", phoneNo: "215-854-8542")],
                                                    supervisorProfile: "supervisor",
                                                    supervisorName: "Mark wilson",
                                                    supervisorPhoneNo: "215-854-4998",
                                                    maintenanceProfile: "maintenance",
                                                    maintenanceName: "harry Acosta",
                                                    maintenancePhoneNo: "215-345-3345")]
    
    static func getParkingDetails() -> [ParkingDetailModel] {
        return parkingDetails
    }
}
