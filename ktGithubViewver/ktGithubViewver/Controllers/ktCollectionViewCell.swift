//
//  ktCollectionViewCell.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/30/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import UIKit

class ktCollectionViewCell: UICollectionViewCell {
    var repoNameLabel = UILabel()
    var repoFullNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(repoNameLabel)
        self.addSubview(repoFullNameLabel)
        
        repoNameLabel.textColor = .white
        repoFullNameLabel.textColor = .white
        
        repoNameLabel.font = .ktTextStyle2
        repoFullNameLabel.font = .ktTextStyle2
        repoFullNameLabel.adjustsFontSizeToFitWidth = true
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        repoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        repoFullNameLabel.translatesAutoresizingMaskIntoConstraints = false

        repoNameLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        repoNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        repoNameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        
        repoFullNameLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        repoFullNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        repoFullNameLabel.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true

    }
}
