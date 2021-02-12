//
//  DetailInteractor.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation

protocol DetailInteractorProtocol: class {
    
    var presenter: DetailPresenterProtocol! { get }
    init(_ presenter: DetailPresenterProtocol)
}

class DetailInteractor: DetailInteractorProtocol {
    
    //MARK: - Properties
    internal weak var presenter: DetailPresenterProtocol!
    
    //MARK: - Init
    required init(_ presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    //MARK: - Methods   
    
}
