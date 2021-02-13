//
//  PersistanceStoreManager.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 13.02.2021.
//

import UIKit
import CoreData

class PersistantStoreManager {
    
    static let shared =  PersistantStoreManager()
    
    private let appdelegate: AppDelegate
    
    private let context: NSManagedObjectContext
    
    private init() {
        self.appdelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appdelegate.persistentContainer.viewContext
    }
    
    //Write data in storage
    private func write() {
        do {
            try context.save()
        } catch {
            print("Write Error: \(error)")
        }
    }
    
    //Save data
    func save(photos: [PhotoViewModel]) {
        
        photos.forEach {[write] photo in
            let newPhoto = PhotoStorage(context: context)
            newPhoto.photoTitle = photo.photoTitle
            newPhoto.imageUrl = photo.imageUrl
            newPhoto.thumbinalUrl = photo.thumbinalUrl
            write()
        }
        
    }
    
    //Remove all data
    func removePhotos() {
        
        let request: NSFetchRequest<PhotoStorage> = PhotoStorage.fetchRequest()
        
        do {
            let cachedPhotos = try context.fetch(request)
            
            for cachedPhoto in cachedPhotos {
                context.delete(cachedPhoto)
            }
            
        } catch {
            print("Error while Photo storage request: \(error.localizedDescription)")
        }
        
        self.write()
    }
    
    //Get data from storage
    func getCachedPhotos() -> [PhotoViewModel] {
        
        var photosVM: [PhotoViewModel] = []
        
        let request: NSFetchRequest<PhotoStorage> = PhotoStorage.fetchRequest()
        
        do {
            
            let cachedPhotos = try context.fetch(request)
            photosVM = cachedPhotos.map {
                return PhotoViewModel(photoTitle: $0.photoTitle ?? "",
                                      imageUrl: $0.imageUrl ?? "",
                                      thumbinalUrl: $0.thumbinalUrl ?? "")
                
            }
            
        } catch {
            print("Error while Photo storage request: \(error.localizedDescription)")
        }
        
        return photosVM
    }
    
}
