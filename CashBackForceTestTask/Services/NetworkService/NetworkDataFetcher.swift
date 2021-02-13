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
    
    private func fetchDataImage(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            print("Invalid image data URL")
            return
        }
        
        DispatchQueue.global(qos: .utility).async {
            do {
                let data: Data = try Data(contentsOf: url)
                completion(.success(data))
                
            } catch {
                completion(.failure(error))
            }
        }
        
    }
    
    func getWebImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        fetchDataImage(from: urlString) { result in
            switch result {
            
            case .success(let imageData):
                let image = UIImage(data: imageData)
                completion(image)
            case .failure(let error):
                print("Error while getting image from web: \(error.localizedDescription)")
            }
        }
    }
    
}


