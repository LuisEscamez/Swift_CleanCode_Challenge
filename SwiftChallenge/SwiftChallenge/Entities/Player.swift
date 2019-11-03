//
//  Player.swift
//  SwiftChallenge
//
//  Created by Luis on 17/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit

// MARK: - Player Entity
class Player {
    
    let name: String?
    let surname: String?
    let imageURL: String?
    var playerImage: UIImage?
    let birthDate: Date?
    
    init(name: String?, surname: String?, imageURL: String?, birthDate: Date?) {
        self.name = name
        self.surname = surname
        self.imageURL = imageURL
        self.birthDate = birthDate
    }
}
