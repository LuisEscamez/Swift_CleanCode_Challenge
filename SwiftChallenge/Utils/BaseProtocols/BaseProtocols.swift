//
//  BaseProtocols.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkConfigProtocol {
    var baseURL: String { get }
}

protocol NetworkServiceProtocol {
    var path: String { get }
    var url: String { get }
    var type: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

protocol BaseInterfaceToViewModelProtocol: class {
    func interfaceIsLoaded()
}

protocol AppImagesProtocol {
    
    static var notFoundImage: UIImage { get }
}
