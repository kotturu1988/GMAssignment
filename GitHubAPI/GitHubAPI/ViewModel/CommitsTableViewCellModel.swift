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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        
        let convertedDate = dateFormatter.date(from: commit.date)
        dateFormatter.dateFormat = "EEE, MMM d, yyyy - h:mm a"
        dateFormatter.timeZone = NSTimeZone.local
        
        let timeStamp = dateFormatter.string(from:convertedDate!)
        
        return "\(timeStamp)"
    }
    var avatar : UIImage{
        // Converting Image url to data
        guard let imageURL = URL(string: commit.avatar_url) else { return UIImage() }
        let imageData = try! Data(contentsOf: imageURL)
        
        return UIImage(data: imageData) ?? UIImage()
    }
    
    // Circular image view
    func resizeImage(imageView: UIImageView){
        imageView.layer.cornerRadius = (imageView.frame.size.width ) / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
    }
}



