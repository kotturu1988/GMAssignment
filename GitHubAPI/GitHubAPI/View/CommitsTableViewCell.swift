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

    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var commitHashLabel: UILabel!
    @IBOutlet weak var commitMsgLabel: UILabel!
    
    @IBOutlet weak var commitDate: UILabel!
    public var viewModel : CommitsTableViewCellModel?{
        didSet{
            guard let viewModel = viewModel else {
                return
            }
            authorNameLabel.text = viewModel.authorName
            commitHashLabel.text =  "Commit: \(viewModel.sha)"
            commitMsgLabel.text = viewModel.commitMessage
            commitDate.text = viewModel.date
        }
    }

}
