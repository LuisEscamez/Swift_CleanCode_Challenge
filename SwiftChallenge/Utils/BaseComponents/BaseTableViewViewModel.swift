//
//  BaseTableViewViewModel.swift
//  SwiftChallenge
//
//  Created by Luis on 21/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewViewModel: BaseViewModel {
    
    private let imageUseCase: ImagesUseCase?
    let imageCache = NSCache<NSString, UIImage>()
    
    init(imageUseCase: ImagesUseCase) {
        self.imageUseCase = imageUseCase
    }
    
    func obtainImageFor(key: String, cell: PlayerTableViewCell, completion: @escaping (UIImage) -> Void) {
        if let url = URL(string: key) {
            self.imageUseCase?.execute(url: url, onSuccess: { (image) in
                completion(image)
            })
        }
    }
}
