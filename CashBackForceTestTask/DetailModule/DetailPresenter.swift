//
//  DetailPresenter.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

protocol DetailPresenterProtocol: class {
    var view: DetailViewProtocol! { get }
    var interactor: DetailInteractorProtocol! { get set }
    var router: DetailRouterProtocol! { get set }
    var viewModel: PhotoViewModel { get }
    var detailTitle: String { get }
    
    init (_ view: DetailViewProtocol, viewModel: PhotoViewModel)
    
    func copy(text: String?)
    func pasteText() -> String?
}

class DetailPresenter: DetailPresenterProtocol {
    
    //MARK: - Properties
    internal weak var view: DetailViewProtocol!
    
    internal var interactor: DetailInteractorProtocol!
    
    var router: DetailRouterProtocol!
        
    var detailTitle: String = "Photo"
    
    var viewModel: PhotoViewModel
    
    //MARK: - Init
    required init(_ view: DetailViewProtocol, viewModel: PhotoViewModel) {
        self.view = view
        self.viewModel = viewModel
    }
    
    
    //MARK: - Methods
    
    func copy(text: String?) {
        guard let text = text else { return }
        UIPasteboard.general.string = text
    }
    
    func pasteText() -> String? {
        return UIPasteboard.general.string
    }

    
}
