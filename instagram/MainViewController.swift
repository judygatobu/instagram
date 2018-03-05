//
//  MainViewController.swift
//  instagram
//
//  Created by Judy Gatobu on 2/26/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func logOut() {
        // Logout the current user
        PFUser.logOutInBackground(block: { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successful loggout")
                // Load and show the login view controller
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "PUT_YOUR_LOGIN_VC_ID_HERE")
                self.window?.rootViewController = loginViewController
            }
        })
    }
            func refresh(){
                let query = PFQuery(className: "Post")
                query.order(byDescending: "createdAt")
                query.includeKey("author")
                query.limit = 20
                
                query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
                    if let posts = posts {
                        //do something with the data fetched
                        self.posts = posts
                        self.tableView.reloadData()
                    } else {
                        print(error?.localizedDescription)
                    }
                }
            
            }
            func pullToRefresh(_ refreshController: UIRefreshControl) {
                refresh()
                tableView.reloadData()
                refreshController.endRefreshing()
            }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?)
            {
                let cell = sender as! UITableViewCell
                if let indexPath = tableView.indexPath(for: cell){
                let post = posts[indexPath.row]
                let detailVC = segue.destination as! DetailViewController
                    
                    detailVC.posts = post
                }
            }
            
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
   
            }
        }
    


