//
//  PostsViewController.swift
//  FeedSample
//
//  Created by Antoine Lamy on 2018-11-20.
//  Copyright © 2018 Antoine Lamy. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    private let userDetailsSegueIdentifier = "UserDetails"

    @IBOutlet weak var tableView: UITableView!

    private var selectedUser: User?
    private var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Posts"

        FeedClient.shared.fetchPosts { [weak self] (result: Result<[Post]>) in
            switch result {
            case .success(let posts):
                self?.posts = posts
            case .failure(_):
                print("Error occured")
            }
        }
    }

    private func navigateToUserDetails(user: User) {
        selectedUser = user
        performSegue(withIdentifier: userDetailsSegueIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == userDetailsSegueIdentifier, let userViewController = segue.destination as? UserViewController {
            userViewController.user = selectedUser
        }
    }
}

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.defaultReuseIdentifier) as! PostCell
        cell.titleLabel.text = post.title
        cell.bodyLabel.text = post.body
        return cell
    }
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let post = posts[indexPath.item]
        FeedClient.shared.fetchUser(userId: post.userId) { [weak self] (result: Result<User>) in
            switch result {
            case .success(let user):
                self?.navigateToUserDetails(user: user)
            case .failure(_):
                print("Failed to fetch user")
            }
        }
    }
}
