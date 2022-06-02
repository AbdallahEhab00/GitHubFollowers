//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 19/05/2022.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject{
    func didRequestFollowers(for username:String)
}

class UserInfoVC: UIViewController {
    
    let headerView            = UIView()
    let viewItemOne           = UIView()
    let viewItemTwo           = UIView()
    let dateLabel             = GFBodyLabel(textAlignment: .center)
    var viewItems:[UIView]    = []
    
    var username: String!
    weak var delegate: UserInfoVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func getUserInfo(){
        NetworkManager.shared.getUser(for: username) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let user):
                DispatchQueue.main.async {self.configureUIElemnt(user: user) }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "somthing Went Wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureUIElemnt(user:User){
        
        let followersItem = GFFollowerItemVC(user: user)
        followersItem.delegate = self
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: GFRepoItemVC(user: user) , to: self.viewItemOne)
        self.add(childVC: followersItem, to: self.viewItemTwo)
        self.dateLabel.text  = "GitHub since \(user.createdAt.ConvertToDisplayFormate())"
    }
    
    func layoutUI(){
        let padding: CGFloat  = 20
        viewItems = [headerView,viewItemOne,viewItemTwo,dateLabel]
        for itemView in viewItems {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
    
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            viewItemOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            viewItemOne.heightAnchor.constraint(equalToConstant: 160),
            
            viewItemTwo.topAnchor.constraint(equalTo: viewItemOne.bottomAnchor, constant: padding),
            viewItemTwo.heightAnchor.constraint(equalToConstant: 160),
            
            dateLabel.topAnchor.constraint(equalTo: viewItemTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func add(childVC:UIViewController , to containerView:UIView){
        
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
   @objc private func dismissVC(){
        dismiss(animated: true)
    }


}


extension UserInfoVC: GFFollowerItemVCDelegate {
    func didTapGetFollowers(for user: User) {
        guard  user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "User dose not have any followers yet", buttonTitle: "OK")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
    
}
