//
//  NetworkDataFetcher.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import Foundation
import Alamofire

class NetworkDataFetcher {

    static let shared = NetworkDataFetcher()
    
    private init () { }
    
    func fetchData <T:Decodable>(from resource: Resource<T>, completion: @escaping (Result<[T], Error>) -> ()) {
        
        AF.request(resource.urlString).response { response in
                    
            switch response.result {
            
            case .success(let data):
                guard let data = data else { return }
                do {
                    let items = try JSONDecoder().decode([T].self, from: data)
                    completion(.success(items))
                    
                } catch let jsonError {
                    completion(.failure(jsonError))
                    
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}


