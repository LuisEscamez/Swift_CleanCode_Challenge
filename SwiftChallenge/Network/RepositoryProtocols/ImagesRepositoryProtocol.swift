//
//  ImagesRepositoryProtocol.swift
//  SwiftChallenge
//
//  Created by Luis on 21/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import RxSwift

protocol ImagesRepositoryProtocol {
    func getImage(from url: URL) -> Observable<UIImage?>
}
