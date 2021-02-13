//
//  PhotoViewModel.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

struct PhotoViewModel {
    
    var photoTitle: String
    var imageUrl: String
    var thumbinalUrl: String
    
    init(model: PhotoResponse) {
        self.photoTitle = model.title
        self.imageUrl = model.url
        self.thumbinalUrl = model.thumbnailUrl
    }
    
    init(photoTitle: String, imageUrl: String, thumbinalUrl: String) {
        self.photoTitle = photoTitle
        self.imageUrl = imageUrl
        self.thumbinalUrl = thumbinalUrl
        
    }
}

