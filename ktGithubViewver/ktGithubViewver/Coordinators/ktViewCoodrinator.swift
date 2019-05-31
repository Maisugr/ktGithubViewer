//
//  ktViewCoodrinator.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/29/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation
import UIKit

class ktViewCoordinator : NSObject {
    
    //MARK: - Injected Dependency Protocol
    
    typealias Dependencies = HasDataManager
    
    //MARK: - Public Properties
    
    let detailCoordiator : ktDetailCoordinator
    
    let rootViewController : ktViewController
    
    let dependencies : Dependencies
    
    private var repos : [Repo] = []
    
    //MARK: - Designated Initializer
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        self.detailCoordiator = ktDetailCoordinator(dependencies: dependencies)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        let width = floor((UIScreen.main.bounds.width - 40) / 2)
        layout.itemSize = CGSize(width: width, height: 60)
        self.rootViewController = ktViewController(collectionViewLayout: layout)
        super.init()
        self.rootViewController.collectionView.delegate = self
        self.getRepos()
    }
    
    func getRepos() {
        self.dependencies.dataManager.getRepos { (repos, error) in
            self.rootViewController.repos = repos ?? []
        }
    }
    

}

extension ktViewCoordinator : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.detailCoordiator.getContributors(repo: repos[indexPath.row])
    }
}
