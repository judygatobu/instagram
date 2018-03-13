//
//  PostInsta.swift
//  instagram
//
//  Created by Judy Gatobu on 3/13/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//


//
import Foundation
import UIKit
import Parse

class PostInsta {
    
    var media : PFFile!
    var author: PFUser
    var caption: String
    var likesCount: Int
    var commentsCount: Int
    var profilePict : PFFile!
    
    
    //init using variable
    init(media: PFFile!, author: PFUser, caption: String, likesCount:Int, commentsCount: Int) {
        
        
        self.media =  media
        self.author = author
        self.caption = caption
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        
        
    }
    
    
    
    
    //init using the diff variable
    init(pfObject: PFObject) {
        self.media =  pfObject["media"] as! PFFile
        self.author = pfObject["author"] as! PFUser
        self.caption = pfObject["caption"] as! String
        self.likesCount = pfObject["likesCount"] as! Int
        self.commentsCount = pfObject["commentsCount"] as! Int
        
    }
    
    
    func LoadPostParse() -> PFObject {
        let postObject = PFObject(className: "Post")
        postObject["media"] = self.media
        postObject["author"]  = self.author
        postObject["caption"] = self.caption
        postObject["likesCount"]  = self.likesCount
        postObject["commentsCount"] = self.commentsCount
        
        return postObject
    }
    
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        // use subclass approach
        let post = Post()
        
        // Add relevant fields to the object
        post.media = getPFFileFromImage(image: image)! // PFFile column type
        post.author = PFUser.current()! // Pointer column type that points to PFUser
        post.caption = caption!
        post.likesCount = 0
        post.commentsCount = 0
        
        // Save object (following function will save the object in Parse asynchronously)
        post.saveInBackground(block: completion)
    }
    
    /**
     Method to convert UIImage to PFFile
     
     - parameter image: Image that the user wants to upload to parse
     
     - returns: PFFile for the the data in the image
     */
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
    
}

