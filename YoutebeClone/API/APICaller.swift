//
//  APICaller.swift
//  YoutebeClone
//
//  Created by admin on 11/16/22.
//

import Foundation
import UIKit

class APICaller {
    
    static let shared = APICaller()
    
    private init() {
        
    }
    func fetchHome(completion : @escaping ([Video]?) -> Void){
        fetchit(urlString: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json", completion: completion)
    }
    func fetchTrending(completion : @escaping ([Video]?) -> Void){
        fetchit(urlString: "https://s3-us-west-2.amazonaws.com/youtubeassets/trending.json", completion: completion)
    }
    func fetchSubspriction(completion : @escaping ([Video]?) -> Void){
        fetchit(urlString: "https://s3-us-west-2.amazonaws.com/youtubeassets/subscriptions.json", completion: completion)
    }
    
    
    func fetchit(urlString:String , completion : @escaping ([Video]?) -> Void){
        let request = URLRequest(url: URL(string: urlString)!)
       // request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { Data, Request, error in

            if error != nil{
                print(error ?? "")
                
                completion(nil)
                return
            }
           
            do {
                if let json = try JSONSerialization.jsonObject(with: Data!,options: .mutableContainers)as? [[String:AnyObject]]{
                    let vi = json.map {
                        return Video(dic: $0)
                    }
                    DispatchQueue.global().async {
                        completion(vi)
                    }
                    
                }
                
               
               
                
            }catch{print(error)
                completion(nil)
                return
            }

            
        }.resume()
    }
   static func getImage(str:String?) -> UIImage?{
       var  im : UIImage?
       if let str = str{
           DispatchQueue.global().async {
               
                URLSession.shared.dataTask(with: URL(string: str)!) { Data, Request, error in
                    if error != nil{
                       
                        return
                        
                    }
                    
                    im = UIImage(named: "aiface")
                    im = UIImage(data: Data!)
                   
                   
                    
                }.resume()
              
           }
            
        }
       return im
    }
}
