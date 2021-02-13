//
//  MainRouter.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

protocol MainRouterProtocol {
    
    var viewController: MainViewController! { get }
    
    init(_ viewController: MainViewController)
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class MainRouter: MainRouterProtocol {
    
    //MARK: - Properties
    var viewController: MainViewController!
    
    //MARK: - Init
    required init(_ viewController: MainViewController) {
        self.viewController = viewController
    }
    
    //MARK: - Methods
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == String(describing: DetailViewController.self) {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            guard let selectedRow = viewController.tableView.indexPathForSelectedRow?.row else { return }
            let viewModel = viewController.presenter.getWebViewModel(for: selectedRow)
            detailVC.configurator.configure(detailVC, viewModel: viewModel)
            
        }
    }
}
