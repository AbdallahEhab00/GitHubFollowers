//
//  GFEmptyStateView.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 19/05/2022.
//

import UIKit

class GFEmptyStateView: UIView {

    let logoImage  = UIImageView()
    let messageLabel    = GFTitleLabel(textAlignment: .center, fontSize: 30)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init (message:String){
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    private func configure(){
        addSubview(messageLabel)
        addSubview(logoImage)
        
        messageLabel.textColor       = .secondaryLabel
        messageLabel.numberOfLines   = 3
        
        logoImage.image              = UIImage(named: "empty-state-logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 100),
            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: 190),
           
        ])
        
    }
}
