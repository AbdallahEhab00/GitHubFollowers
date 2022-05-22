//
//  Followers.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 14/05/2022.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
