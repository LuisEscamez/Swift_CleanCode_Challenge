//
//  SportsUseCase.swift
//  SwiftChallenge
//
//  Created by Luis on 20/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit
import RxSwift

class SportsUseCase {
    
    private let service: SportsRepositoryProtocol?
    private let disposeBag = DisposeBag()
    
    init(service: SportsRepositoryProtocol?) {
        self.service = service
    }
    
    func execute(onSuccess succeed: @escaping ([Sport]) -> Void, onFailure fail: @escaping (Error) -> Void){
        service?.getSports().subscribe(onNext: { ( sports) in
            succeed(sports)
        }, onError: { (error) in
            fail(error)
        }).disposed(by: disposeBag)
    }
}
