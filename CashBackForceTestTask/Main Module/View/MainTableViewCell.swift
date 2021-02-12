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
    
    @IBOutlet weak var resourceImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
}
