//
//  CommitsTableViewCellModel.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/18/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation
import UIKit

class CommitsTableViewCellModel{
    private let commit : Commit
    
    init(commit:Commit) {
        self.commit = commit
    }
    
    var sha : String{
        return commit.sha
    }
    var commitMessage : String{
        return commit.commitMessage
    }
    var  authorName : String{
        return commit.authorName
    }
    var  date : String{
        return commit.date
    }
    var avatar : UIImage{
        guard let imageURL = URL(string: commit.avatar_url) else { return UIImage() }
        let imageData = try! Data(contentsOf: imageURL)
        
        return UIImage(data: imageData) ?? UIImage()
    }
    
    func resizeImage(imageView: UIImageView){
        imageView.layer.cornerRadius = (imageView.frame.size.width ) / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
    }
}



