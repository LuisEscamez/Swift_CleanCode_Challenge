//
//  ErrorEntity.swift
//  SwiftChallenge
//
//  Created by Luis Escamez on 21/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation

class ErrorEntity: Error {
    
    public static let defaultErrorCode = -1
    
    var errorCode: Int = -1
    var errorDescription: String?
    
    init(errorCode: Int = defaultErrorCode) {
        self.errorCode = errorCode
    }
    
    init(errorCode: Int = defaultErrorCode, errorDescription: String? = nil) {
        self.errorCode = errorCode
        self.errorDescription = errorDescription
    }
}
