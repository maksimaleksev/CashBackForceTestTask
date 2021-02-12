//
//  PhotoResponse.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation

struct PhotoResponse: Decodable {
    var title: String
    var url: String
    var thumbnailUrl: String
}
