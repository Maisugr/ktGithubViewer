//
//  ktDetailCoordinator.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/31/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation


class ktDetailCoordinator {
    //MARK: - Injected Dependency Protocol
    
    typealias Dependencies = HasDataManager
    
    //MARK: - Public Properties
    
    let rootViewController : ktContributorsViewController
    
    let dependencies : Dependencies
    
    //MARK: - Designated Initializer
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        
        self.rootViewController = ktContributorsViewController(style: .plain)
    }
    
    func getContributors(repo : Repo) {
        self.dependencies.dataManager.getRepos { (repos, error) in
            
        }
    }
}
