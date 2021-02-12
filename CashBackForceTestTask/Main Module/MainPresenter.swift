//
//  MainPresenter.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation

protocol MainPresenterProtocol: class {
    
    var view: MainViewProtocol! { get }
    var interactor: MainInteractorProtocol! { get set }
    var router: MainRouterProtocol! { get set }
    init (_ view: MainViewProtocol)
    
}

class MainPresenter: MainPresenterProtocol {
    
    //MARK: - Properties
    internal weak var view: MainViewProtocol!
    
    internal var interactor: MainInteractorProtocol!
    
    var router: MainRouterProtocol!
    
    //MARK: - Init
    required init(_ view: MainViewProtocol) {
        self.view = view
    }
    
    //MARK: - Methods   
}
