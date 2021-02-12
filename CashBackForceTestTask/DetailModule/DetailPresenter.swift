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
    var photoViewModel: PhotoViewModel { get }
    var detailTitle: String { get }
    
    init (_ view: DetailViewProtocol, photoViewModel: PhotoViewModel)
    
    
}

class DetailPresenter: DetailPresenterProtocol {
    
    //MARK: - Properties
    internal weak var view: DetailViewProtocol!
    
    internal var interactor: DetailInteractorProtocol!
    
    var router: DetailRouterProtocol!
    
    var photoViewModel: PhotoViewModel
    
    var detailTitle: String = "Photo"
    
    //MARK: - Init
    required init(_ view: DetailViewProtocol, photoViewModel: PhotoViewModel) {
        self.view = view
        self.photoViewModel = photoViewModel
        
    }
    
    //MARK: - Methods
}
