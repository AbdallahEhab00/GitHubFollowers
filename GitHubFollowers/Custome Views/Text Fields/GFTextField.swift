//
//  GFTextField.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 12/05/2022.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        layer.cornerRadius        = 10
        layer.borderWidth         = 1
        layer.backgroundColor     = UIColor.systemGray4.cgColor
        
        
        adjustsFontSizeToFitWidth = true
        minimumFontSize           = 12
        textAlignment             = .center
        textColor                 = .label
        tintColor                 = .label
        font                      = UIFont.preferredFont(forTextStyle: .title2)
        
        
        backgroundColor           = .tertiarySystemBackground
        autocorrectionType        = .no
        autocapitalizationType    = .none
        returnKeyType             = .go
        placeholder               = "Enter a username"

        
    }

}
