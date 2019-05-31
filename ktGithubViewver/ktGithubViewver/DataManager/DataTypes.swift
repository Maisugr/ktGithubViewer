//
//  DataTypes.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/25/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation

struct Container : Codable {
    let total : Int
    let incompleteResults : Bool
    let items: [Repo]
    
    enum CodingKeys : String, CodingKey {
        case total = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Repo : Codable {
    struct Owner : Codable {
        let login : String
        let id: Int
        let avatar_url : String?
    }
    
    let id : Int
    let name : String
    let full_name : String?
    let owner : Owner
    let description : String?
    let fork : Bool?
    let created_at : String
    let updated_at : String
    let pushed_at : String
    let homepage : String?
    let size : Int
    let stargazers_count : Int?
    let watchers_count : Int?
    let language : String?
    let forks_count : Int?
    let open_issues_count : Int?
    let master_branch : String?
    let score : Double?
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case full_name
        case owner
        case description
        case fork
        case created_at
        case updated_at
        case pushed_at
        case homepage
        case size
        case stargazers_count
        case watchers_count
        case language
        case forks_count
        case open_issues_count
        case master_branch
        case score
    }
    
}

