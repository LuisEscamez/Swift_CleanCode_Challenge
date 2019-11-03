//
//  ControlledError.swift
//  SwiftChallenge
//
//  Created by Luis Escamez on 21/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation

public class ControlledError: Error, Decodable {
    
    var status: String?
    var message: String?
    
    private enum StoreCodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StoreCodingKeys.self)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        message = try container.decodeIfPresent(String.self, forKey: .message)
    }
}
