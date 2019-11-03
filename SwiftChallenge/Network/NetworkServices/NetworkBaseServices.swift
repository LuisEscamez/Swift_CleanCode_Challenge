//
//  NetworkBaseServices.swift
//  SwiftChallenge
//
//  Created by Luis on 18/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import Alamofire


class NetworkBaseService: NetworkServiceProtocol {
    
    var path: String { return "" }
    
    var url: String { return "\(NetworkConfigInfo().baseURL)/\(path)"}
    
    var type: HTTPMethod { return HTTPMethod.get }
    
    var encoding: ParameterEncoding { return JSONEncoding.default }
}

enum NetworkService {
    
    class SportsService: NetworkBaseService {
        override final var path: String { return "66851" }
    }
}
