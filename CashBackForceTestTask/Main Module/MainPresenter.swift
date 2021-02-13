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
    var mode: VCMode { get }
    
    init (_ view: MainViewProtocol)
    
    func getWebViewModel(for row:Int) -> PhotoViewModel
    func startPresenting()
    
}

enum VCMode {
    case Web
    case Cached
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
    
    var mode: VCMode {
        
        if interactor.cacheIsEmpty {
            return .Web
        } else {
            return .Cached
        }
        
    }
    
    //MARK: - Init
    required init(_ view: MainViewProtocol) {
        self.view = view
    }
    
    //MARK: - Methods
    
    func getWebViewModel(for row: Int) -> PhotoViewModel {
        return photos[row]
    }
    
    
    func startPresenting() {
        
        switch mode {
        
        case .Web:
            self.loadWebData()
        case .Cached:
            self.photos = interactor.getCachedPhotoData()
            self.loadWebData()
        }
    }
    
    private func loadWebData() {
        self.interactor.getWebPhotoData { [weak self] webPhotos in
            guard let self = self, let webPhotos = webPhotos else { return }
            self.photos = webPhotos
            self.view.updateTableViewData()
            self.interactor.saveDataToCache(data: webPhotos)
        }
    }
}
