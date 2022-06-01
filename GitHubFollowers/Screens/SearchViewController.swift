//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 12/05/2022.
//

import UIKit

class SearchViewController: UIViewController {

    let logoImageView     = UIImageView()
    let usernameTextfield = GFTextField()
    let callActionButton  = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    let padding: CGFloat = 50
    var isUserEntered: Bool{  return !usernameTextfield.text!.isEmpty}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureUsernametextField()
        configureGetFollowersButton()
        dismissKeybordTabGestur()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func dismissKeybordTabGestur(){
        let tab = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tab)
    }
    
    
    @objc private func pushToFollowersList(){
        guard isUserEntered else {
            presentGFAlertOnMainThread(title: "Oops😰", message: "Please enter username First. we need to know who to look for. ", buttonTitle: "Ok")
            return
        }
        let followersList       = FollowersListVC()
        followersList.username  = usernameTextfield.text
        followersList.title     = usernameTextfield.text
        navigationController?.pushViewController(followersList, animated: true)
    }
    
    
    private func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    private func configureUsernametextField(){
        view.addSubview(usernameTextfield)
        usernameTextfield.delegate = self
        NSLayoutConstraint.activate([
            usernameTextfield.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: padding),
            usernameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            usernameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameTextfield.heightAnchor.constraint(equalToConstant: padding),
      
        ])
    }
    
    private func configureGetFollowersButton(){
        view.addSubview(callActionButton)
        callActionButton.addTarget(self, action: #selector(pushToFollowersList), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            callActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            callActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            callActionButton.heightAnchor.constraint(equalToConstant: padding)
        ])
    }
    


}


extension SearchViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushToFollowersList()
        return true
    }
}
