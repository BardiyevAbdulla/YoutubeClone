//
//  MyCollectionViewCell.swift
//  YoutebeClone
//
//  Created by admin on 11/14/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var video: Video? {
        didSet{
            labelTitle.text = video?.title
            if let str = video?.thumbnail_image_name{
                
                thumbnailImageView.load(UrlString: str)
            }
            if let str = video?.channel?.profile_image_name{
                
                userProfileImageView.load(UrlString: str)
            }
            if let  chanelName = video?.channel?.name,let numberOfviews = video?.number_of_views {
                let number = NumberFormatter()
                number.numberStyle = .decimal
                subtitleTextView.text = "\(chanelName) * \(String(describing: number.string(from: numberOfviews as NSNumber)!)) * 2 years ago"
            }
           
        }
       
    }
    
    var thumbnailImageView:UIImageView = {
       let iv = UIImageView()
        
        return iv
    }()
    var userProfileImageView:UIImageView = {
       let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 22
        return iv
    }()
    let separatorView:UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return vw
    }()
    
    let labelTitle : UILabel = {
        let lb = UILabel()
       
        return lb
    }()
    
    let subtitleTextView : UITextView = {
        let lb = UITextView()
        lb.textContainerInset = UIEdgeInsets(top: -2, left: -4, bottom: 0, right: 0)
        lb.textColor = .lightGray
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    
    func initValue(model:Video){
        thumbnailImageView.image = UIImage(named:model.thumbnail_image_name!)
        userProfileImageView.image =  UIImage(named:(model.channel?.profile_image_name)!)
        labelTitle.text = model.title
        subtitleTextView.text = model.channel?.name
    }
  override init(frame: CGRect) {
        super.init(frame: frame)
      for item in contentView.subviews{
          item.removeFromSuperview()
      }
        setupView()
    }
    func setupView(){
       addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(subtitleTextView)
        addSubview(labelTitle)
        thumbnailImageView.Anchor(top: topAnchor,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingTop: 16,paddingLeft: 16,paddingBottom: 68,paddingRight: 16)
        separatorView.Anchor(left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,height: 2)
        userProfileImageView.Anchor(left: leftAnchor,bottom: bottomAnchor,paddingTop: 8,paddingLeft: 16,paddingBottom: 16,paddingRight: 8,height: 44,width: 44)
        labelTitle.Anchor(top:thumbnailImageView.bottomAnchor,left: userProfileImageView.rightAnchor,right: rightAnchor,paddingTop: 8,paddingLeft: 8,paddingRight: 16,height: 20)
        subtitleTextView.Anchor(top:labelTitle.bottomAnchor,left: userProfileImageView.rightAnchor,right: rightAnchor,paddingTop: 4,paddingLeft: 8,paddingRight: 16,height: 33)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
