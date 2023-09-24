//
//  DynamicClass.swift
//  UIComponents
//
//  Created by Aniket Kadia on 04/07/23.
//

import Foundation
import UIKit
class Dynamic<T> {
    
    // MARK: Typealias
    typealias Listener = (T?) -> Void
    
    // MARK: Vars & Lets
    var listener: Listener?
    var value: T? {
        didSet {
            self.fire()
        }
    }
    
    // MARK: Initialisation
    init(_ v: T?) {
        value = v
    }
    
    // MARK: Public func
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

    func fire() {
        self.listener?(value)
    }
}
