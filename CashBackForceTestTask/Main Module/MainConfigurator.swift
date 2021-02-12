//
//  MainConfigurator.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation

protocol MainConfiguratorProtocol: class {
    func configure(_ viewController: MainViewController)
}

class MainConfigurator: MainConfiguratorProtocol {
    
    func configure(_ viewController: MainViewController) {
        let presenter = MainPresenter(viewController)
        let interactor = MainInteractor(presenter)
        let router = MainRouter(viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }

}
