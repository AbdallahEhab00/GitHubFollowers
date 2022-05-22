//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 19/05/2022.
//

import UIKit

class UserInfoVC: UIViewController {
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
                
    }
    
   @objc private func dismissVC(){
        dismiss(animated: true)
    }


}