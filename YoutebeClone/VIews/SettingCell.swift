//
//  SettingCell.swift
//  YoutebeClone
//
//  Created by admin on 11/17/22.
//

import UIKit

class SettingCell: UICollectionViewCell {
    let nameLabel : UILabel = {
        let lb = UILabel()
        lb.text = "settting"
        lb.font = .systemFont(ofSize: 13)
        return lb
    }()
    let iconImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "gearshape.fill")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    override var isHighlighted: Bool{
        didSet{
            
            backgroundColor = isHighlighted ?  .darkGray : .white
            nameLabel.textColor = isHighlighted ? .white : .black 
            iconImageView.tintColor = isHighlighted ? .white : .black
        }
    }
    var setting:setting?{
        didSet{
            nameLabel.text = setting?.name
            if let imageName = setting?.imageName{
                iconImageView.image = UIImage(systemName:imageName)
            }
            
        }
    }
    func setupViews(){
        addSubview(nameLabel)
        addSubview(iconImageView)
        nameLabel.Anchor(top: self.topAnchor,left: self.leftAnchor,bottom: self.bottomAnchor,right: self.rightAnchor,paddingLeft: 90)
        iconImageView.Anchor(left: self.leftAnchor,paddingLeft: 20,height: 30,width: 30)
        iconImageView.CenterY(inView: self)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
