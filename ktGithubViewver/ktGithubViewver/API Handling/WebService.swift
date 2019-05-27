//
//  WebService.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/25/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation

enum Path {
    case Repos
    case Contributors( owner: String, repo: String )
    
}

typealias ServiceCallback = ( Data?, Error? ) -> Void

protocol WebService {
    func call(path: Path, callback: @escaping ServiceCallback)
}
protocol HasWebService {
    var webService: WebService { get }
}
