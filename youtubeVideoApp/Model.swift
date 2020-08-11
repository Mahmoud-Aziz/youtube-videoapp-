import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        
        //Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //Get a URLSession shared object
        let session = URLSession.shared
        
        //get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if there were any errors
            if error != nil || data == nil{
                return
            }
            
            do {
                //parsing data into video objects
                let decoder = JSONDecoder()
                //tell if there is a date found in iso8601 format, convert it into date object
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
               
                if response.items != nil {
                    //call the "videosreturned" method of the delegate
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                dump(response)
            }
            catch {
            
            }
        }
        //Kick off the task
        dataTask.resume()
    }
}
