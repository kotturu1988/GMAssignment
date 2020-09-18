//
//  CommitsTableViewModel.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation

class CommitsTableViewModel {
    private let networking = Networking()
    private var commits : [Commit]?
    public func getCommits(completion:(()->Void)?){
        
        networking.callNetwork(endpoint: GitHubAPI.repositories, type: [Commit].self){[weak self] response in
            self?.commits = response
            completion?()
            
        }
    }
}
