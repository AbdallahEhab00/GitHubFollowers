//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 14/05/2022.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    private let baseURL = "https://api.github.com/users/"
    let chache          = NSCache<NSString,UIImage>()
    
    func getFollowers(for username:String , page:Int , completion:@escaping(Result<[Follower],GFError>)->Void){
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else{
            completion(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase //to can change nameing Json data in Model
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
              
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }

    
}
