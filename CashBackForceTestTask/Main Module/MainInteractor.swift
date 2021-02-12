//
//  MainInteractor.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation

protocol MainInteractorProtocol: class {
    
    var presenter: MainPresenterProtocol! { get }
    init(_ presenter: MainPresenterProtocol)
}


class MainInteractor: MainInteractorProtocol {

    //MARK: - Properties
    internal weak var presenter: MainPresenterProtocol!
    
    //MARK: - Init
    required init(_ presenter: MainPresenterProtocol) {
    }
    
    //MARK: - Methods
}
