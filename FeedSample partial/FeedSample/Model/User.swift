//
//  User.swift
//  FeedSample
//
//  Created by Antoine Lamy on 2018-11-20.
//  Copyright © 2018 Antoine Lamy. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}
