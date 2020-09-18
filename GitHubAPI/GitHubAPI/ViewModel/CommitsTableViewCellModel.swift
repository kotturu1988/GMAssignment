//
//  CommitsTableViewCellModel.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/18/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation

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
}



