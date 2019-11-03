//
//  ImageCacheManager.swift
//  SwiftChallenge
//
//  Created by Luis Escamez on 22/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import UIKit

class ImageCacheManager {
    
    static let  shared = ImageCacheManager()
    
    let imageCache = NSCache<NSString, UIImage>()
    
    
    func getImage(for key: String) -> UIImage? {
        return imageCache.object(forKey: key as NSString)
    }
    
    func saveImage(_ image: UIImage, for key: String)  {
        imageCache.setObject(image, forKey: key as NSString)
    }
}
