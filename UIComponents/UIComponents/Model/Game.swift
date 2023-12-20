//
//  Game.swift
//  UIComponents
//
//  Created by Aniket Kadia on 08/05/23.
//

import Foundation
import UIKit
struct Game {
    var name: String
    var image: UIImage
    var powers: String
    
    static func getGameDetails() -> [Game] {
        return [Game(name: "samurai", image: UIImage(named: "character_samurai") ?? UIImage(), powers: "Fly"),
                Game(name: "swordsman", image: UIImage(named: "character_swordsman") ?? UIImage(), powers: "Healing"),
                Game(name: "assasin", image: UIImage(named: "character_assasin") ?? UIImage(), powers: "Defence"),
                Game(name: "ninja", image: UIImage(named: "character_ninja") ?? UIImage(), powers: "Revive")]
    }
}
