//
//  GfAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 15/05/2022.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
   private let placeholderImage = UIImage(named: "avatar-placeholder")!
    let cache                   = NetworkManager.shared.chache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func getAvatarImage(for urlString:String){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey:cacheKey)  {
            self.image = image
            return
        }
        
        guard let imageUrl = URL(string: urlString) else { return}

        let task = URLSession.shared.dataTask(with: imageUrl) { [weak self] data, response, error in
            
            guard let self = self else {return}
            if error != nil {return}
            guard let response = response as? HTTPURLResponse ,response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else {return}
            
            self.cache.setObject(image , forKey: cacheKey)
            DispatchQueue.main.async { self.image = image   }
            
        }
       
        task.resume()
    }
    
    
}

