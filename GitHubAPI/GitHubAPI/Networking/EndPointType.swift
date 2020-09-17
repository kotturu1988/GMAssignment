//
//  EndPointType.swift
//  GitHubAPI
//
//  Created by AKMac on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation

protocol APIEndPointType {
    var baseURL: URL { get }
    var path: String { get }
}
