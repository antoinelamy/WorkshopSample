//
//  PostCell.swift
//  FeedSample
//
//  Created by Antoine Lamy on 2018-11-20.
//  Copyright © 2018 Antoine Lamy. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    static let defaultReuseIdentifier: String = "PostCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
}
