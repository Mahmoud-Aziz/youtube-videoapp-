
//
//  Model.swift
//  youtubeVideoApp
//
//  Created by Mahmoud Aziz on 8/10/20.
//  Copyright © 2020 Mahmoud Aziz. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        //create url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        
        //get URLSession object
        let session = URLSession.shared
        
        //get a data task from the URL object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                //parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                
                }
        }
        
        //kick off the task
        dataTask.resume()
        
    }
}
