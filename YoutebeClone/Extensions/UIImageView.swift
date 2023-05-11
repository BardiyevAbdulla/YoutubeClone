//
//  UIImageView.swift
//  YoutebeClone
//
//  Created by admin on 11/16/22.
//

import UIKit

let imageCache = NSCache<NSURL, UIImage>()//<URL, UIImage>()
extension UIImageView{
    func load(UrlString:String){
        
        
        
        guard let url = URL(string: UrlString)
        else { return }
        if let imageFromCange = imageCache.object(forKey: url as NSURL){
            self.image = imageFromCange
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        let imageToCache = image
                        imageCache.setObject(imageToCache, forKey: url as NSURL)
                        self?.image = image
                    }
                }
            }
                
        }
    }
}
