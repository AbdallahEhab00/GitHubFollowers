//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 13/05/2022.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section { case main}
    
    var username : String!
    var followers: [Follower] = []
    var filterdFollowers: [Follower] = []
    var page                  = 1
    var hasMoreFollowers      = true
    var isSearching           = false
    
    var collectionView: UICollectionView!
    var dataSource:  UICollectionViewDiffableDataSource<Section, Follower>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureCollectionView()
        getFollowers(for: username, page: page)
        configureDiffableDataSource()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView(){
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(view: view))
        view.addSubview(collectionView)
        collectionView.delegate        = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        
    }
    
    func configureSearchController(){
        let searchController                    = UISearchController()
        searchController.searchResultsUpdater   = self
        searchController.searchBar.delegate     = self
        searchController.searchBar.placeholder  = "search fo a username"
        navigationItem.searchController         = searchController
    }
   
    
    func getFollowers(for username:String,page:Int){
        showLoadingView()
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else {return}
            self.dismissLoadingView()
            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                self.followers.append(contentsOf: followers)
                print(followers.count)
                if followers.isEmpty{
                    let message = "This user has No followers yet , Go and follow him 😁"
                    DispatchQueue.main.async {  self.showEmptyState(for: message, in: self.view) }
                    return
                }
                self.updateData(follower: followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Operation Faild", message:error.rawValue, buttonTitle: "Ok")
                
            }
        }
        
    }
    
    func configureDiffableDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
     
    }
    
    func updateData(follower:[Follower]){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(follower)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }

}

extension FollowersListVC : UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.height
        
        if offsetY > contentHeight-height {
            guard hasMoreFollowers else {return}
            page += 1
            getFollowers(for: username, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray     = isSearching ? filterdFollowers : followers
        let followers       = activeArray[indexPath.item]
        let UserInfoVC      = UserInfoVC()
        UserInfoVC.username = followers.login
        let navController  = UINavigationController(rootViewController: UserInfoVC)
        present(navController, animated: true)
    }
    
}

extension FollowersListVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        isSearching = true
        guard let filter = searchController.searchBar.text , !filter.isEmpty else {return}
        
        filterdFollowers = followers.filter { $0.login.uppercased().contains(filter.uppercased())}
        updateData(follower: filterdFollowers)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(follower: followers)
    }
    
    
}
