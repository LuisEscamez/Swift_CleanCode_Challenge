//
//  GeneralManager.swift
//  SwiftChallenge
//
//  Created by Luis Escamez on 21/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation

class GeneralManager {
    
    static func customPrint(_ item: Any) {
        #if DEBUG
        print(item)
        #endif
    }
}
