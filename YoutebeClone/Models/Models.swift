//
//  Models.swift
//  YoutebeClone
//
//  Created by admin on 11/15/22.
//


import UIKit

//struct Video{
//    var mainImage:UIImage!
//    var chaneImage:UIImage!
//    var nameOfChanel:String!
//    var views:String!
//    init(mainImage: UIImage!, chaneImage: UIImage!, nameOfChanel: String!, views: String!) {
//        self.mainImage = mainImage
//        self.chaneImage = chaneImage
//        self.nameOfChanel = nameOfChanel
//        self.views = views
//    }
//    
//}

class Video:NSObject{
    
    @objc var thumbnail_image_name: String?
    @objc var title: String?
    @objc var number_of_views: NSNumber?
    @objc var uploadDate: NSDate?
    @objc dynamic var channel: Chanel?
    @objc var duration: NSNumber?
    

    
     init(dic:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dic)
         
         let dicCH = dic["channel"] as![String:Any]
         channel = Chanel(dic: dicCH)
         
         
    }
    
}
class Chanel:NSObject{
    @objc var name:String?
   @objc var profile_image_name:String?
     init(dic:[String:Any]) {
         super.init()
        setValuesForKeys(dic)
    }
}
