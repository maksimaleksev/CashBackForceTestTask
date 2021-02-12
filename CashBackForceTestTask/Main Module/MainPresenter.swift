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
    var cellNumbers: Int { get }
    var mainTitle: String { get }
    
    init (_ view: MainViewProtocol)
    
    func getViewModel(for row:Int) -> PhotoViewModel
    func startPresenting()
    
}

class MainPresenter: MainPresenterProtocol {
    
    //MARK: - Properties
    internal weak var view: MainViewProtocol!
    
    internal var interactor: MainInteractorProtocol!
    
    var router: MainRouterProtocol!
    
    private var photos: [PhotoViewModel] = []
    
    var mainTitle: String = "Photos"
    
    var cellNumbers: Int {
        return photos.count
    }
    
    //MARK: - Init
    required init(_ view: MainViewProtocol) {
        self.view = view
    }
    
    //MARK: - Methods
    
    func getViewModel(for row: Int) -> PhotoViewModel {
        return photos[row]
    }
    
    func startPresenting() {
        
        self.interactor.getPhotoData { [weak self] gettedPhotos in
            guard let self = self, let gettedPhotos = gettedPhotos else { return }
            self.photos = gettedPhotos
            self.view.updateTableViewData()
        }
        
    }
}
