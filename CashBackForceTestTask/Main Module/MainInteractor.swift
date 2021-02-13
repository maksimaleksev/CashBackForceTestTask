//
//  MainInteractor.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

protocol MainInteractorProtocol: class {
    
    var presenter: MainPresenterProtocol! { get }
    var cacheIsEmpty: Bool { get }
    
    init(_ presenter: MainPresenterProtocol)
    
    func getWebPhotoData(completion: @escaping ([PhotoViewModel]?) -> ())
    func getCachedPhotoData() -> [PhotoViewModel]
    func saveDataToCache(data: [PhotoViewModel])
    
}


class MainInteractor: MainInteractorProtocol {

    //MARK: - Properties
    internal weak var presenter: MainPresenterProtocol!
    var cacheIsEmpty: Bool
    
    //MARK: - Init
    required init(_ presenter: MainPresenterProtocol) {
        self.presenter = presenter
        self.cacheIsEmpty = PersistantStoreManager.shared.getCachedPhotos().isEmpty
    }
    
    //MARK: - Methods
    
    func getWebPhotoData(completion: @escaping ([PhotoViewModel]?) -> ()) {
        
        let resource = Resource<PhotoResponse>(host: "jsonplaceholder.typicode.com", path: "photos")
        
        NetworkDataFetcher.shared.fetchData(from: resource) { result in
            
            switch result {
            
            case .success(let data):
                let photoData = data.map { return PhotoViewModel(model: $0)}
                completion(photoData)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    
    func getCachedPhotoData() -> [PhotoViewModel] {
        PersistantStoreManager.shared.getCachedPhotos()
    }
    
    func saveDataToCache(data: [PhotoViewModel]) {
        PersistantStoreManager.shared.removePhotos()
        PersistantStoreManager.shared.save(photos: data)
    }

}
