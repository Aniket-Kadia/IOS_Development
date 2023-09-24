//
//  Coordinator.swift
//  UIComponents
//
//  Created by Aniket Kadia on 30/05/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
}
