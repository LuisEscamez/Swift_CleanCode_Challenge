//
//  SportPlayersMappers.swift
//  SwiftChallenge
//
//  Created by Luis on 17/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation


struct SportsMapper {
    
    static func mapViewModel(_ businessModel: SportDataOut?) -> Sport {
        return Sport(playersList: PlayersMapper.mapMultipleViewModel(businessModel?.playersList), listType: businessModel?.listType, sportTitle: businessModel?.sportTitle)
    }
}

struct PlayersMapper {
    
    static func mapViewModel(_ businessModel: PlayerDataOut?) -> Player {
        return Player(name: businessModel?.name, surname: businessModel?.surname, imageURL: businessModel?.imageURL, birthDate: businessModel?.birthDate?.toDate(from: .spanishDateFormat))
    }
    
    static func mapMultipleViewModel(_ businessModel: [PlayerDataOut]?) -> [Player] {
        guard let playersList = businessModel else { return [Player]() }
        return playersList.map { (player) -> Player in
            PlayersMapper.mapViewModel(player)
        }
    }
}
