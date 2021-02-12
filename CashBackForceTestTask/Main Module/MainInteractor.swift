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
    
    func getPhotoData(completion: @escaping ([PhotoViewModel]?) -> ())
    
}


class MainInteractor: MainInteractorProtocol {

    //MARK: - Properties
    internal weak var presenter: MainPresenterProtocol!
    
    //MARK: - Init
    required init(_ presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    //MARK: - Methods
    
    func getPhotoData(completion: @escaping ([PhotoViewModel]?) -> ()) {
        
        let resource = Resource<PhotoResponse>(host: "jsonplaceholder.typicode.com", path: "photos")
        
        NetworkDataFetcher.shared.fetchData(from: resource) { result in
            
            switch result {
            
            case .success(let data):
                let photoData = data.map { return PhotoViewModel(photoTitle: $0.title,
                                                                 imageUrl: $0.url,
                                                                 thumbinalUrl: $0.thumbnailUrl)}
                completion(photoData)
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
            
        }
    }
}
