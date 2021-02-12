//
//  DetailRouter.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

protocol DetailRouterProtocol: class {
    
    var viewController: DetailViewController! { get }
    init(_ viewController: DetailViewController)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class DetailRouter: DetailRouterProtocol {
    
    //MARK: - Properties
    var viewController: DetailViewController!
    
    //MARK: - Init
    required init(_ viewController: DetailViewController) {
        self.viewController = viewController
    }
    
    //MARK: - Methods
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
