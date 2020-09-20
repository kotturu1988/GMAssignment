//
//  CommitsTableViewModel.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation
import UIKit

class CommitsTableViewModel {
    private let networking = Networking()
    private var commits : [Commit]?
    
    // Calling API using Networking instance
    public func getCommits(completion:(()->Void)?){
        
        networking.callNetwork(endpoint: GitHubAPI.repositories, type: [Commit].self){[weak self] response in
            self?.commits = response
            completion?()
            
        }
    }
    
    //cell view model
    public func cellViewModel(index:Int) -> CommitsTableViewCellModel?{
        guard let commits = commits else {return nil}
        let commitsTableViewCellModel = CommitsTableViewCellModel(commit: commits[index])
        return commitsTableViewCellModel
    }
    
    // Total count of commits
    public var count : Int{
        return commits?.count ?? 0
    }
    
    // Custom gradient layer to setup background color
    func setBackgroundColor(view:UIView) -> CAGradientLayer{
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        let topColor: CGColor = UIColor(red: 65/255, green: 152/255, blue: 194/255, alpha: 1).cgColor
        
        let middleColor: CGColor = UIColor(red: 111/255, green: 161/255, blue: 181/255, alpha: 1).cgColor
        
        let bottomColor: CGColor = UIColor(red: 151/255, green: 167/255, blue: 174/255, alpha: 1).cgColor
        
        gradientLayer.colors = [topColor, middleColor, bottomColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        return gradientLayer                
    }
        
}
