//
//  FeedClient+Utilities.swift
//  FeedSample
//
//  Created by Antoine Lamy on 2018-11-20.
//  Copyright © 2018 Antoine Lamy. All rights reserved.
//

import Foundation

extension FeedClient {
    enum HTTPMethod: String {
        case get = "GET"
        case head = "HEAD"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }

    enum FeedError: Error {
        case malformedJson
    }

    func createDataTask<DataType>(request: URLRequest, completion: @escaping (Result<DataType>) -> Void) -> URLSessionDataTask where DataType: Decodable {
        return session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                let result = Result<Data>.fromValue(data: data, error: error)

                switch result {
                case .failure(let resultError):
                    completion(Result<DataType>.failure(resultError))
                    return
                case .success(_):
                    do {
                        completion(Result.success(try result.decoded(as: DataType.self)))
                    } catch {
                        completion(Result.failure(FeedError.malformedJson))
                    }
                }
            }
        }
    }

    func createRequest(url: URL, httpMethod: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("FeedSample", forHTTPHeaderField: "User-Agent")
        return request as URLRequest
    }
}
