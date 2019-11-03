//
//  SportsDataOut.swift
//  SwiftChallenge
//
//  Created by Luis on 17/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation


// MARK:- Sport Model
struct SportDataOut: Decodable {
    
    let playersList: [PlayerDataOut]?
    let listType: String?
    let sportTitle: String?
    
    private enum DecodingKeys: String, CodingKey {
        case players = "players"
        case type = "type"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        self.playersList = try container.decodeIfPresent(Array.self, forKey: .players)
        self.listType = try container.decodeIfPresent(String.self, forKey: .type)
        self.sportTitle = try container.decodeIfPresent(String.self, forKey: .title)
    }
}

// MARK:- Player Model
struct PlayerDataOut: Decodable {
    
    let imageURL: String?
    let surname: String?
    let name: String?
    let birthDate: String?
    
    private enum DecodingKeys: String, CodingKey {
        case image = "image"
        case surname = "surname"
        case name = "name"
        case date = "date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        self.imageURL = try container.decodeIfPresent(String.self, forKey: .image)
        self.surname = try container.decodeIfPresent(String.self, forKey: .surname)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.birthDate = try container.decodeIfPresent(String.self, forKey: .date)
    }
}
