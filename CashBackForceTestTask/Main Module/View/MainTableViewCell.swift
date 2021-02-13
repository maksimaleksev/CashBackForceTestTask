//
//  MainTableViewCell.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    static let reuseId = "MainTableViewCell"
        
    //MARK: - IBOutlets
    
    @IBOutlet weak var thumbinalImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumbinalImageView.image = nil
    }

    
    func setCellData(title: String, thumbUrl: String) {
        self.titleLabel.text = title
        self.thumbinalImageView.webImage(thumbUrl)
    }
}
