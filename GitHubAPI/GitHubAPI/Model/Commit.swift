//
//  Commit.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation

struct Commit : Codable{
    
    enum RootKeys: String, CodingKey{
        case sha, commit, committer
    }
    enum CommitKeys : String, CodingKey{
        case commitMessgae = "message", author = "author"
    }
    enum AuthorKeys : String, CodingKey{
           case name = "name", date = "date"
    }
    enum CommiterKeys : String, CodingKey{
        case avatar_url = "avatar_url"
    }

    let sha : String
    let commitMessage : String
    let authorName : String
    let date : String
    let avatar_url : String

}

extension Commit{
    init(from decoder: Decoder) throws {
        // Decoding the JSON and initializing model
        let container = try decoder.container(keyedBy: RootKeys.self)
        sha = try container.decode(String.self, forKey: .sha)

        let commitContainer = try container.nestedContainer(keyedBy: CommitKeys.self, forKey: .commit)
        commitMessage = try commitContainer.decode(String.self, forKey: .commitMessgae)

        let authorContainer = try commitContainer.nestedContainer(keyedBy: AuthorKeys.self, forKey: .author)
        authorName = try authorContainer.decode(String.self, forKey: .name)
        
        date = try authorContainer.decode(String.self, forKey: .date)

        let commiterContainer = try container.nestedContainer(keyedBy: CommiterKeys.self, forKey: .committer)
        avatar_url = try commiterContainer.decode(String.self, forKey: .avatar_url)
    }
}
