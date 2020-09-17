//
//  Response.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation

struct APIResponse {
    fileprivate var data : Data
    init(data:Data) {
        self.data = data
    }
}

extension APIResponse {
    public func decode<T:Codable>(_ type:T.Type)->T?{
        
        let jsonDecoder = JSONDecoder()
        do{
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        }catch let error{
            print(error.localizedDescription)
            return nil
        }
    }
    
}
