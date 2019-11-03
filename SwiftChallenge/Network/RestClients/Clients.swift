//
//  Clients.swift
//  SwiftChallenge
//
//  Created by Luis on 18/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

class NetworkRestClient {
    
    static let shared = NetworkRestClient()
    private let sessionManager: SessionManager = {
        var headers = SessionManager.defaultHTTPHeaders
        headers.updateValue("application/json;charset=UTF-8", forKey: "Content-Type")
        headers.updateValue("no-cache", forKey: "Cache-Control")
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        configuration.timeoutIntervalForRequest = 45
        configuration.timeoutIntervalForResource = 45
        return SessionManager(configuration: configuration)
    }()
    
    var restClient: RxSwift.Reactive<SessionManager>
    
    private init() {
        self.restClient = sessionManager.rx
    }
}

extension ObservableType where Self.E == Alamofire.DataRequest {
    
    func validateBody() -> RxSwift.Observable<Self.E> {
        
        return validate { request,response,data in
            
            GeneralManager.customPrint("\r\nNetworkRestClient - url: \(String(describing: request?.url))")
            GeneralManager.customPrint("response: \(response.statusCode)")
            
            do {
                if  200...204 ~= response.statusCode {
                    return .success
                }else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let error = try decoder.decode(ControlledError.self, from: data)
                        return .failure(ErrorEntity(errorCode: ErrorEntity.defaultErrorCode, errorDescription: error.message))
                    }else {
                        return .failure(ErrorEntity(errorCode: ErrorEntity.defaultErrorCode))
                    }
                }
            } catch let error {
                return .failure(error)
            }
        }
    }
}
