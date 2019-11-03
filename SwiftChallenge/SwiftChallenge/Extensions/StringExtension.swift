//
//  StringExtensions.swift
//  SwiftChallenge
//
//  Created by Luis on 17/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(from format: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
}

extension Optional where Wrapped == String {
    
    func emptyIfNil() -> String {
        return self?.trimmingCharacters(in: .whitespaces) ?? ""
    }
}
