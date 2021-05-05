//
//  NetworkServices.swift
//  TestForSmallPDF
//
//  Created by Danijel Vasov on 4/28/21.
//  Copyright © 2021 Danijel Vasov. All rights reserved.
//

import Foundation

struct NetworkServices {
    
    static let decoder = JSONDecoder()
    
    
    static func getAPIUrlString(page: Int) -> String {
        return "https://randomuser.me/api?page=\(page)&results=20"
    }
    
    
    static func getUsers(with urlString: String, completion: @escaping([User])->Void) {
        guard let usersUrl = URL(string: urlString) else {return}

        let task = URLSession.shared.dataTask(with: usersUrl) {(data, response, error) in
            if error != nil {//we can present popup in this case
                return 
            }
            
            guard let data = data else { return }
            
            if let responseJson = try? decoder.decode(JSONResults.self, from: data) {
                completion(responseJson.results)
            }
            
        }
        task.resume()
    }
}
