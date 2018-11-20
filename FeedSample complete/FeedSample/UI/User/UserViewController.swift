//
//  UserViewController.swift
//  FeedSample
//
//  Created by Antoine Lamy on 2018-11-20.
//  Copyright © 2018 Antoine Lamy. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    var user: User! = nil

    private var mainView: UserView { return view as! UserView }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User Details"

        mainView.nameLabel.text = user.name
        mainView.emailLabel.text = user.email
        mainView.phoneLabel.text = user.phone
        mainView.websiteLabel.text = user.website
    }
}
