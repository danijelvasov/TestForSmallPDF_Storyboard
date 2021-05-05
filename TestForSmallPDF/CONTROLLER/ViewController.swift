//
//  ViewController.swift
//  TestForSmallPDF
//
//  Created by Danijel Vasov on 4/28/21.
//  Copyright © 2021 Danijel Vasov. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    //MARK: - vars & consts
    var users = [User]()
    var currentPage = 1
    
    //MARK: - Outlets
    @IBOutlet weak var tbUsers: UITableView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tbUsers.delegate = self
        self.tbUsers.dataSource = self
        
        getUsersData()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    //MARK: - Private methods
    fileprivate func getUsersData(){
        let urlString = NetworkServices.getAPIUrlString(page: currentPage)
        NetworkServices.getUsers(with: urlString, completion: {[weak self] users in
            self?.users = users
            DispatchQueue.main.async{
                self?.tbUsers.reloadData()
            }
        })
    }
    
    fileprivate func loadMoreData(){
        currentPage += 1
        let urlString = NetworkServices.getAPIUrlString(page: currentPage)
        NetworkServices.getUsers(with: urlString) {[weak self] moreUsers in
            if let currentList = self?.users {
            self?.users = currentList + moreUsers
            DispatchQueue.main.async{
                self?.tbUsers.reloadData()
            }
            }
        }
    }
    
    fileprivate func navigateToDetailVCFor(user: User) {
        if let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            detailsVC.user = user
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    

    
}


//MARK: - Tableview methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tbUsers.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell {
        
            let user = users[indexPath.row]
            cell.setupCellWithData(user: user)
            
            cell.onCellTapped = {[weak self] in
                self?.navigateToDetailVCFor(user: user)
            }
            
            return cell
            
        } else {return UITableViewCell()}
    }
    
    //detect when the user reached near bottom:
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 5 == users.count {
            self.loadMoreData()
        }
    }
    
    
}
