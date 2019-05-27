//
//  AppDependency.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/26/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation

struct AppDependency: HasDataManager, HasWebService {
    
    //MARK: - Public Properties
    
    let dataManager: DataManager
    
    let webService: WebService
    
    //MARK: - Designated Initializer
    
    init(dataManager: DataManager, webService: WebService) {
        self.dataManager = dataManager
        self.webService = webService
    }
}
