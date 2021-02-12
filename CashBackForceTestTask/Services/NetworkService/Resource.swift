//
//  Resource.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation

struct Resource<T: Decodable> {
    
    private let scheme: String = "https"
    private var host: String
    private var path: String
    
    var urlString: String {
        return self.scheme + "://" + self.host + "/" + self.path
    }
    
    init(host: String, path: String) {
        self.host = host
        self.path = path
    }
    
}
