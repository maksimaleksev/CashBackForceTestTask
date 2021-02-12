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
        
    }
}
