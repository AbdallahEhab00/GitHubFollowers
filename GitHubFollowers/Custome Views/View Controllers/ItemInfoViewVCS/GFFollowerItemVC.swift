//
//  GFFollowerItemVC.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 01/06/2022.
//

import UIKit

protocol GFFollowerItemVCDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}


class GFFollowerItemVC: GFItemInfoVC{
    
   weak var delegate: GFFollowerItemVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFollowerItem()
    }
    
    private func configureFollowerItem(){
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroungColor: .systemGreen, title: "Get Followers")
    }
    
    override func didTapActionButton() {
        delegate.didTapGetFollowers(for: user)
    }
}
