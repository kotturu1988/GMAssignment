//
//  CommitsTableViewCell.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import UIKit

class CommitsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var commitHashLabel: UILabel!
    @IBOutlet weak var commitMsgLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
