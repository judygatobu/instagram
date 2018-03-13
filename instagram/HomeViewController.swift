//
//  HomeViewController.swift
//  instagram
//
//  Created by Judy Gatobu on 3/11/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    
    @IBOutlet weak var tableView: UITableView!
    var postArr = [PostInsta]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        fetch()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! PostTableViewCell
    
        
        let currentPost = postArr[indexPath.row]
        
        cell.caption.text = currentPost.caption
        cell.userNameLabel.text = currentPost.author.username
        
        if let PostImage = currentPost.media{
            
            PostImage.getDataInBackground(block: { (imageData, error) -> Void in
                if let PostImageData = imageData {
                    cell.postImage.image = UIImage(data:PostImageData)
                }
            })
        }
        
        
        
    
    return cell
    }
    
    
    
    func fetch() {
        
      

        let query = PFQuery(className:"Post")
        query.cachePolicy = PFCachePolicy.networkElseCache
        query.addDescendingOrder("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        
        self.postArr.removeAll(keepingCapacity: true)
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts,error) -> Void in
            
            if let error = error {
                print("Error: \(error) \(error.localizedDescription)")
                return
            }
            
            if let objects = posts {
                
                for (index, object) in objects.enumerated() {
                    // Convert PFObject into Trip object
                    let onePost = PostInsta(pfObject: object)
                    self.postArr.append(onePost)
                    self.tableView.reloadData()
                    
                }
                
            }
            
            
        }

        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  postArr != nil   {
            return postArr.count
        }
        return 0
       
        
        
        
        
    }



    @IBAction func onTapLogOut(_ sender: Any) {

        PFUser.logOutInBackground { (error) in
       
      
    self.performSegue(withIdentifier: "LogOutSeague", sender: self)
        }
    }
    
    

}
