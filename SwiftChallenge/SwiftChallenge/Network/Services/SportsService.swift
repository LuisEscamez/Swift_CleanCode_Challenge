//
//  SportsService.swift
//  SwiftChallenge
//
//  Created by Luis on 18/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//
import Foundation
import RxSwift
import Alamofire

class SportsService: SportsRepositoryProtocol {
    
    func getSports() -> Observable<[Sport]> {

        let service = NetworkService.SportsService()

        return NetworkRestClient.shared.restClient.request(service.type, service.url, headers: nil).validateBody().responseData()
            .map({ (response, data) -> [Sport] in
                return try self.decodeFrom(received: data).map({ (sport) -> Sport in
                    SportsMapper.mapViewModel(sport)
                })
            }).subscribeOn(MainScheduler.instance)
    }
}

fileprivate extension SportsService {
    
    func decodeFrom(received data: Data) throws -> [SportDataOut] {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode([SportDataOut].self, from: data)
    }
}
