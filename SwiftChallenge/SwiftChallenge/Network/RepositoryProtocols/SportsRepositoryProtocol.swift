//
//  SportsRepositoryProtocol.swift
//  SwiftChallenge
//
//  Created by Luis on 18/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import RxSwift

protocol SportsRepositoryProtocol {
    func getSports() -> Observable<[Sport]>
}
