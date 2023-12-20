//
//  Organization.swift
//  UIComponents
//
//  Created by Aniket Kadia on 24/05/23.
//

import Foundation

struct Organization {
    var category: String
    var taskName: [String]
        
    static func getTaskDetails() -> [Organization] {
        return [Organization(category: "IOS", taskName: ["IOS task 1","IOS task 2","IOS task 3"]),
                Organization(category: "Android", taskName: ["Android task 1","Android task 2","Android task 3"])]
    }
}
