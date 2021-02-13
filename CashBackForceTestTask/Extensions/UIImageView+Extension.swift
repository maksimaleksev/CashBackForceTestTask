//
//  UIImageView+Extension.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func webImage(_ imageURL: String, placeHolder: UIImage? = nil) {
        
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: imageURL)) {
            self.image = cachedImage
            return
        }
        
        self.image = placeHolder
        
        NetworkDataFetcher.shared.getWebImage(from: imageURL) { image in
            
            DispatchQueue.main.async {
                guard let image = image else { return }
                self.image = image
            }
            
        }
    }
}
