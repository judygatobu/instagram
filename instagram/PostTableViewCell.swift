//
//  PostTableViewCell.swift
//  instagram
//
//  Created by Judy Gatobu on 3/11/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
