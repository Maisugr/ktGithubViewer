//
//  ktAppCoordinator.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/29/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Main Coordinator

class ktAppCoordinator  {
    
    //MARK: - Public Properties
    
    let viewCoordinator : ktViewCoordinator
    
    let dependencies : AppDependency
    
    let rootViewController : UINavigationController
    
    //MARK: - Designated Initializer - Setup
    
    init() {
        let webService = ktWebService.shared
        let dataManager = ktDataManager()
        self.dependencies = AppDependency(dataManager: dataManager, webService: webService)
        dataManager.dependencies = self.dependencies
        self.viewCoordinator = ktViewCoordinator(dependencies: dependencies)
        self.rootViewController = UINavigationController(rootViewController: self.viewCoordinator.rootViewController)
        setupAppearance()
    }
    
    private func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .ktCornflower
        UICollectionView.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .ktTealishAlpha
        UICollectionViewCell.appearance().backgroundColor = .ktTealishAlpha
        UILabel.appearance().textColor = .white
        UILabel.appearance().font = .ktTextStyle
    }
}
