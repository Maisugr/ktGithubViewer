//
//  ktDataManager.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/25/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation
import UIKit

typealias DataCallBack = ( String?, Error? ) -> Void
typealias RepoCallBack = ( Array<Repo>?, Error? ) -> Void

protocol HasDataManager {
    var dataManager: DataManager { get }
}

//MARK: - DataManager Interface Protocol

protocol DataManager  {
    var repos : Array<Repo> { get }
    var dataUpdateCallback: DataCallBack? { get set }
    
    func getRepos(callBack: @escaping RepoCallBack)
    func getImageData(url: URL, completion: @escaping (UIImage?,URL?, Error?) -> Void)
}


class NPDataManager : DataManager {
    
    //MARK: - Injected Dependency Protocol
    
    typealias Dependencies = HasWebService
    
    //MARK: - Private Properties
    
    private var imageCache = NSCache<NSString, UIImage>()
    
    //MARK: - Public Properties
    
    var dependencies : Dependencies?
    
    var dataUpdateCallback: DataCallBack?
    
    //MARK: - Designated Initializer
    
    var repos : [Repo] = []
    
    func getRepos(callBack: @escaping RepoCallBack) {
        self.dependencies?.webService.call(path: .Repos, callback: { (json, error) in
            let decoder = JSONDecoder()
            let container = try! decoder.decode(Container.self, from: json!)
            self.repos = container.items
            callBack(self.repos, error)
        })
    }
    
    func getImageData(url: URL, completion: @escaping (UIImage?,URL?, Error?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, url, nil)
        } else {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil,url,error)
                    
                } else if let data = data, let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image,url,nil)
                } else {
                    completion(nil,url, NSError(domain: url.absoluteString, code: 1001))
                }
                }.resume()
        }
    }
}

