//
//  Constants.swift
//  SwiftChallenge
//
//  Created by Luis on 17/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation

struct Constants {
    
}

enum FailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
}

enum DateFormat: String {
    case americanDateFormat = "yyyy/MM/dd"
    case spanishDateFormat = "dd/MM/yyyy"
}

enum SportType: String, CaseIterable {
    case footBall = "Football"
    case tennis = "Tennis"
    case gold = "Golf"
    case formula1 = "Formula 1"
}
