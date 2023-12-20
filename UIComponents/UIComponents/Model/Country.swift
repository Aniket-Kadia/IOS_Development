//
//  Country.swift
//  UIComponents
//
//  Created by Aniket Kadia on 10/05/23.
//

import Foundation
struct CountryResponseModel {
    var continents: String
    var country: [String]
    
    static func getCountryWithContinents(caseval: CountryEnum) -> [String] {
        let countryCollection = [CountryResponseModel(continents: "Asia", country: ["India","Pakistan","China","Nepal","Bangaldesh"]),CountryResponseModel(continents: "Europe", country: ["denmark","UK","Finland","France","Germany","Italy"])]
        switch caseval {
        case .all: return countryCollection[0].country + countryCollection[1].country
        case .asia: return countryCollection[0].country
        case .europe: return countryCollection[1].country
        }
    }
}
