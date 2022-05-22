//
//  GFAlertVC.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 13/05/2022.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView   = UIView()
    let titLabel        = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel    = GFBodyLabel(textAlignment: .center)
    let actionButton    = GFButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle:   String?
    var alertMessage: String?
    var buttonTitle:  String?
    
    let padding: CGFloat = 20
    
    init(title:String,message:String,buttonTitle:String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle     = title
        self.alertMessage   = message
        self.buttonTitle    = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75 )
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    
    private func configureContainerView(){
        view.addSubview(containerView)
        containerView.backgroundColor     = .systemBackground
        containerView.layer.cornerRadius  = 16
        containerView.layer.borderWidth   = 2
        containerView.layer.borderColor   = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
    
    
    private func configureTitleLabel(){
        containerView.addSubview(titLabel)
        titLabel.text = alertTitle ?? "Somthing went Wrong"
        NSLayoutConstraint.activate([
            titLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    
    private func configureActionButton(){
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc private func dismissVC(){
        dismiss(animated:true)
    }
    
    
    private func configureMessageLabel(){
        containerView.addSubview(messageLabel)
        messageLabel.text           = alertMessage ?? "Unble to Complete Request"
        messageLabel.numberOfLines  = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titLabel.topAnchor, constant: padding),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: -padding),
            
            
        ])
    }
    

}
