//
//  UIViewController+ext.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 13/05/2022.
//

import UIKit
import SafariServices
fileprivate var containerView: UIView!

extension UIViewController {
    
    func presentGFAlertOnMainThread(title:String,message:String,buttonTitle:String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func showLoadingView(){
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha           = 0
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator         = UIActivityIndicatorView(style: .large)
        activityIndicator.color       = .systemGreen
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    func presentSafariVC(url:URL){
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyState( for message:String , in View:UIView ){
        let emptyState    = GFEmptyStateView(message: message)
        emptyState.frame  = View.bounds
        view.addSubview(emptyState)
    }
    
}
