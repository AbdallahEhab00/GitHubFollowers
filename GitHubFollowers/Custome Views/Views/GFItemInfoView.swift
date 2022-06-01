//
//  GFItemInfoView.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 01/06/2022.
//

import UIKit

enum itemInfoType{
    case repo,gists,followers,following
}

class GFItemInfoView: UIView {
    
    let sympolImageView  = UIImageView()
    let titleLabel       = GFTitleLabel(textAlignment: .left, fontSize: 20)
    let countLabel       = GFTitleLabel(textAlignment: .center, fontSize: 18)
    

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        let padding:CGFloat = 20
        self.addSubview(sympolImageView)
        self.addSubview(titleLabel)
        self.addSubview(countLabel)
        sympolImageView.translatesAutoresizingMaskIntoConstraints = false
        sympolImageView.contentMode  = .scaleAspectFill
        sympolImageView.tintColor    = .label
        
        NSLayoutConstraint.activate([
            sympolImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            sympolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            sympolImageView.widthAnchor.constraint(equalToConstant: 20),
            sympolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: sympolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: sympolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18),

        ])
    }
    
    func set(itemInfoType:itemInfoType,withCount count:Int){
        switch itemInfoType {
        case .repo:
            sympolImageView.image = UIImage(systemName: Constant.repo)
            titleLabel.text       = "Public Repo"
        case .gists:
            sympolImageView.image = UIImage(systemName: Constant.gists)
            titleLabel.text       = "Public Gists"
        case .followers:
            sympolImageView.image = UIImage(systemName: Constant.Followers)
            titleLabel.text       = "Followers"
        case .following:
            sympolImageView.image = UIImage(systemName: Constant.following)
            titleLabel.text       = "Following"
        }
        countLabel.text  = String(count)
    }
    
}
