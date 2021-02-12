//
//  DetailViewController.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

protocol DetailViewProtocol: class {
    var presenter: DetailPresenterProtocol! { get set }
    var configurator: DetailConfiguratorProtocol { get }
}


class DetailViewController: UIViewController {

    //MARK: - Properties
    var presenter: DetailPresenterProtocol!
    var configurator: DetailConfiguratorProtocol = DetailConfigurator()
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBActions

    //MARK: - Methods
}

//MARK: - Detail View Protocol
extension DetailViewController: DetailViewProtocol{ }
