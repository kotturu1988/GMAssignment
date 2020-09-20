//
//  GitHubAPI.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation

enum GitHubAPI {
    case repositories
}

// Endpoint definition
extension GitHubAPI : APIEndPointType{
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .repositories:
            return "/repos/kotturu1988/GMAssignment/commits"
        }
    }
    
    
}
