//
//  FeedClient.swift
//  FeedSample
//
//  Created by Antoine Lamy on 2018-11-20.
//  Copyright © 2018 Antoine Lamy. All rights reserved.
//

import Foundation

/*
 Documentation: https://jsonplaceholder.typicode.com
 */

class FeedClient {

    static let shared = FeedClient()
    private init() { }

    let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
    let session = URLSession(configuration: URLSessionConfiguration.default)

    func fetchPosts(completion: @escaping (Result<[Post]>) -> Void) {
        let request = createRequest(url: baseURL.appendingPathComponent("posts"), httpMethod: .get)
        let task = createDataTask(request: request, completion: completion)
        task.resume()
    }

    func fetchUser(userId: Int, completion: @escaping (Result<User>) -> Void) {
        let request = createRequest(url: baseURL.appendingPathComponent("users").appendingPathComponent("\(userId)"), httpMethod: .get)
        let task = createDataTask(request: request, completion: completion)
        task.resume()
    }
}
