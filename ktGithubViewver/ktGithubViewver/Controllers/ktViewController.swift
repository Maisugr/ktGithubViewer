//
//  ktViewController.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/30/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ktViewController: UICollectionViewController {
    
    var repos:[Repo] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(ktCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [UIColor.ktDark.cgColor, UIColor.ktTealish.cgColor]
        gradientLayer.endPoint = CGPoint(x: 1, y:0)
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.repos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ktCollectionViewCell
    
        // Configure the cell
        let repo = repos[indexPath.row]
        cell.repoNameLabel.text = repo.name
        cell.repoFullNameLabel.text = repo.full_name
        return cell
    }
}
