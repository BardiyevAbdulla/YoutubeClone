//
//  View.swift
//  YoutebeClone
//
//  Created by admin on 11/14/22.
//


import UIKit

extension UIView{
    func Anchor(top:NSLayoutYAxisAnchor? = nil,
                left:NSLayoutXAxisAnchor? = nil,
                bottom:NSLayoutYAxisAnchor? = nil,
                right:NSLayoutXAxisAnchor? = nil,
                paddingTop:CGFloat = 0,
                paddingLeft:CGFloat = 0,
                paddingBottom:CGFloat = 0,
                paddingRight:CGFloat = 0,
                height:CGFloat? = nil,
                width:CGFloat? = nil){
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let width = width{
            widthAnchor.constraint(equalToConstant: width).isActive = true
           
        }
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    func CenterX(inView view:UIView){
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func CenterY(inView view:UIView){
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

