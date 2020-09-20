//
//  CommitsTableViewCell.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import UIKit

class CommitsTableViewCell: UITableViewCell {
    
    public static let reuseIdentifier = "commitCellID"
    
    // Table view cell UI Elements
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var commitHashLabel: UILabel!
    @IBOutlet weak var commitMsgLabel: UILabel!
    @IBOutlet weak var commitDate: UILabel!
    
    // Appending values to UI elements in Tableview Cell
    public var viewModel : CommitsTableViewCellModel?{
        didSet{
            guard let viewModel = viewModel else {
                return
            }
            viewModel.resizeImage(imageView: avatarImgView)
            authorNameLabel.text = viewModel.authorName
            commitHashLabel.text =  "Commit: \(viewModel.sha)"
            commitMsgLabel.text = viewModel.commitMessage
            commitDate.text = viewModel.date
            avatarImgView.image = viewModel.avatar
        }
    }

}
