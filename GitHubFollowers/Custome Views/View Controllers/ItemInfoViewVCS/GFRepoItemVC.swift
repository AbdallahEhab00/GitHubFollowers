//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 01/06/2022.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItemRepo()
    }
    
    private func configureItemRepo(){
        itemInfoViewOne.set(itemInfoType: .repo, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroungColor: .systemPurple, title: "GitHub Profile")
    }
}
