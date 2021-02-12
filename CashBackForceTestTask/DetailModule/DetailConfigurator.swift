//
//  DetailConfigurator.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation

protocol DetailConfiguratorProtocol: class {
    func configure(_ viewController: DetailViewController, photoViewModel: PhotoViewModel)
}

class DetailConfigurator: DetailConfiguratorProtocol {
    
    
    func configure(_ viewController: DetailViewController, photoViewModel: PhotoViewModel) {
        
        let presenter = DetailPresenter(viewController, photoViewModel: photoViewModel)
        let interactor = DetailInteractor(presenter)
        let router = DetailRouter(viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
