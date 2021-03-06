//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 12/05/2022.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor:UIColor , title:String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure(){
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
    }
    
    func set(backgroungColor:UIColor ,title:String){
        self.backgroundColor = backgroungColor
        self.setTitle(title, for: .normal)
    }
    

}
