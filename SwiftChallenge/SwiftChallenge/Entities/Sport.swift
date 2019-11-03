//
//  Sport.swift
//  SwiftChallenge
//
//  Created by Luis on 17/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation

// MARK: - Sport Entity
class Sport {
    
    var sportTitle: SportType?
    var playersList: [Player]?
    let listType: String?
    
    init(playersList: [Player]?, listType: String?, sportTitle: String?) {
        self.playersList = playersList
        self.listType = listType
        self.sportTitle = SportType(rawValue: sportTitle ?? "")
    }
}
