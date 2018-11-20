//
//  Post.swift
//  FeedSample
//
//  Created by Antoine Lamy on 2018-11-20.
//  Copyright © 2018 Antoine Lamy. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
