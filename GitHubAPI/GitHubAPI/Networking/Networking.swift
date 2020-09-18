//
//  Networking.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import Foundation

struct Networking {
    func callNetwork<T:Codable>(endpoint: GitHubAPI,type:T.Type,completion: ((_ response: T) -> Void)?){
        
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString
        
        guard let urlRequest = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: urlRequest){ data,response, error in
            
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let data = data else {return}
            print(data)
            let response = APIResponse(data: data)
            guard let decodedData = response.decode(type)else {return}
            completion?(decodedData)
            
        }
        task.resume()
    }
}
