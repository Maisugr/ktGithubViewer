//
//  ktWebservice.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/25/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation


final class ktWebService : WebService {
    
    static let shared = ktWebService()
    
    private let queue : OperationQueue
    
    private let urlSession : URLSession
    
    private let urlSessionConfiguration : URLSessionConfiguration
    
    private var dataTask: URLSessionDataTask?
    
    private init() {
        queue = {
            let oq = OperationQueue()
            oq.qualityOfService = .userInitiated
            return oq
        }()
        
        urlSessionConfiguration = {
            let c = URLSessionConfiguration.default
            c.allowsCellularAccess = true
            c.httpCookieAcceptPolicy = .never
            c.httpShouldSetCookies = false
            c.requestCachePolicy = .reloadIgnoringLocalCacheData
            return c
        }()
        urlSession = URLSession(configuration: urlSessionConfiguration)
    }

    deinit {
        urlSession.finishTasksAndInvalidate()
    }
    
    func call(path: Path, callback: @escaping ServiceCallback) {
        
        dataTask = urlSession.dataTask(with: path.url) { data, response, error in
            defer { self.dataTask = nil }
            callback(data,error)
        }
        dataTask?.resume()
    }
    
    
}


extension Path {
    fileprivate var method: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    private var headers: [String: String] {
        var h: [String: String] = [:]
        
        switch self {
        default:
            h["Accept"] = "application/vnd.github.v3+json"
            h["Content-Type"] = "application/json; charset=utf-8"
        }
        
        return h
    }
    
    var url: URL {
        guard var url = URLComponents(string: "https://api.github.com") else { fatalError("Can't create base URL!") }

        switch self {
        case .Repos:
            url.path = "/search/repositories"
            url.queryItems = [URLQueryItem(name: "q", value: "language:Swift+is:public" ) ]
        case .Contributors(let owner, let repo):
            url.path = "repos/\(owner)/\(repo)/contributors"
        }
        
        return url.url!
    }
    
    var urlRequest: URLRequest {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { fatalError("Invalid URL") }
        
        guard let url = components.url else { fatalError("Invalid URL") }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers

        return request
    }
    
}

