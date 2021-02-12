//
//  DetailPresenter.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation

protocol DetailPresenterProtocol: class {
    var view: DetailViewProtocol! { get }
    var interactor: DetailInteractorProtocol! { get set }
    var router: DetailRouterProtocol! { get set }
    init (_ view: DetailViewProtocol)
}

class DetailPresenter: DetailPresenterProtocol {
    
    //MARK: - Properties
    internal weak var view: DetailViewProtocol!
    
    internal var interactor: DetailInteractorProtocol!
    
    var router: DetailRouterProtocol!
    
    //MARK: - Init
    required init(_ view: DetailViewProtocol) {
        self.view = view
    }
    
    //MARK: - Methods
}
