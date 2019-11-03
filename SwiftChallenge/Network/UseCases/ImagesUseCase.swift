//
//  ImagesUseCase.swift
//  SwiftChallenge
//
//  Created by Luis on 21/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import RxSwift

class ImagesUseCase {
    
    private let service: ImagesRepositoryProtocol?
    private let disposeBag = DisposeBag()
    
    init(service: ImagesRepositoryProtocol?) {
        self.service = service
    }
    
    func execute(url: URL, onSuccess succeed: @escaping (UIImage) -> Void){
        
        let imageCacheManager = ImageCacheManager.shared
        if let cachedImage = imageCacheManager.getImage(for: url.absoluteString) {
            succeed(cachedImage)
        } else {
            service?.getImage(from: url).subscribe(onNext: { (image) in
                if let image = image {
                    imageCacheManager.saveImage(image, for: url.absoluteString)
                    succeed(image)
                }
            }, onError: { (error) in
                GeneralManager.customPrint(error)
            }).disposed(by: disposeBag)
        }
    }
}

