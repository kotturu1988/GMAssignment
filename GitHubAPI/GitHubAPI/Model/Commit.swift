//
//  Commit.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation

struct Commit : Codable{
    let sha : String
    let message : String
    let committerName : String
}
