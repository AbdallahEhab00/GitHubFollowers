//
//  GFItemInfoVC.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 01/06/2022.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackView        = UIStackView()
    let itemInfoViewOne  = GFItemInfoView()
    let itemInfoViewTwo  = GFItemInfoView()
    let actionButton     = GFButton()
    
    var user: User!
    
    init(user:User){
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundVC()
        layoutUI()
        configureStackView()
    }
    
   private func configureBackgroundVC(){
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }
    
    
   private func configureStackView(){
        stackView.axis          = .horizontal
        stackView.distribution  = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    
   private func layoutUI(){
        
        let padding: CGFloat = 20
        view.addSubview(stackView)
        view.addSubview(actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: padding+8),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    

}
