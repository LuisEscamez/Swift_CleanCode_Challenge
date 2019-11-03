//
//  ImagesService.swift
//  SwiftChallenge
//
//  Created by Luis on 21/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import RxSwift

class ImagesService: ImagesRepositoryProtocol {
    
    
    func getImage(from url: URL) -> Observable<UIImage?> {
        
        return NetworkRestClient.shared.restClient.request(.get, url).validateBody().responseData()
            .map({ (response, data) -> UIImage? in
                guard let image = UIImage(data: data) else { return nil }
                return image
            }).subscribeOn(MainScheduler.instance)
    }
}
