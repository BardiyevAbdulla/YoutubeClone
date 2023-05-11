//
//  APIModel.swift
//  YoutebeClone
//
//  Created by admin on 11/16/22.
//

import Foundation

//struct Model:Codable{
//    let title:String?
//    let number_of_views:Int?
//    let thumbnail_image_name:String?
//    let duration:Int?
//    let channel:Channel?
//    
//    
//    enum Coding:String,CodingKey {
//    case title = "title"
//    case number_of_views = "number_of_views"
//    case thumbnail_image_name = "thumbnail_image_name"
//    case duration = "duration"
//    case channel = "channel"
//        
//    }
//    init(from decoder: Decoder) throws {
//        let value  = try decoder.container(keyedBy: Coding.self)
//        title = try value.decode(String.self, forKey: .title)
//        number_of_views = try value.decode(Int.self, forKey: .number_of_views)
//        thumbnail_image_name = try value.decode(String.self, forKey: .thumbnail_image_name)
//        duration = try value.decode(Int.self, forKey: .duration)
//        channel = try value.decode(Channel.self, forKey: .channel)
//    }
//    
//    struct Channel:Codable{
//    let name:String?
//        let profile_image_name:String?
//        
//        enum Coding:String,CodingKey {
//            case name = "name"
//            case profile_image_name = "profile_image_name"
//        }
//        init(from decoder: Decoder) throws {
//            let value = try decoder.container(keyedBy: Coding.self)
//            name = try value.decode(String.self, forKey: .name)
//            profile_image_name = try value.decode(String.self, forKey: .profile_image_name)
//        }
//    }
//}
