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
        self.navigationItem.title = presenter.detailTitle
        self.urlLabel.isUserInteractionEnabled = true
        self.urlLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapUrlLabel)))
        self.setViewsData()
    }
    
    
    //MARK: - IBActions
    
    @IBAction func getPasteBoardText(_ seneder: UIButton) {
        guard let text = presenter.pasteText() else { return }
        print(text)
    }
    
    //MARK: - Methods
    
    private func setViewsData() {
        
        self.titleLabel.text = presenter.viewModel.photoTitle
        self.urlLabel.text = presenter.viewModel.imageUrl
        self.imageView.webImage(presenter.viewModel.imageUrl)
        
    }
    
    @objc func tapUrlLabel(gesture: UITapGestureRecognizer) {
        presenter.copy(text: urlLabel.text)
    }
    
}

//MARK: - Detail View Protocol
extension DetailViewController: DetailViewProtocol{ }




