//
//  MenuBar.swift
//  YoutebeClone
//
//  Created by admin on 11/15/22.
//

import UIKit

class MenuBar: UIView {
    
    var viewController: ViewController?
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        cv.register(MenuCell.self, forCellWithReuseIdentifier: "MenuCell")
        cv.delegate = self
        cv.dataSource = self
        cv.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .bottom)
        return cv
    }()
    
    var images = [
        UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "flame.fill")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "play.rectangle.fill")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysTemplate)]
    var list = [UIImage(named: "fire")?.withRenderingMode(.alwaysTemplate)]
    
     var leftBarAnchor: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        collectionView.Anchor(top: self.topAnchor,left: self.leftAnchor,bottom: self.bottomAnchor,right: self.rightAnchor)
        setupHorizontalBar()
    }
    func setupHorizontalBar(){
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = .white
        addSubview(horizontalBarView)
        leftBarAnchor = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        leftBarAnchor?.isActive = true
        
        horizontalBarView.Anchor(bottom: self.bottomAnchor, height: 4)
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
       
       
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MenuBar:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        viewController?.scrollToMenu(Index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell else{return UICollectionViewCell()}
        cell.setupViews(image: (images[indexPath.row]?.withTintColor(UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)))!)
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


class MenuCell: UICollectionViewCell {
    var image:UIImageView = {
        let image = UIImageView()
        image.tintColor = UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        return image
    }()
    override var isSelected: Bool{
        didSet{
            image.tintColor = isSelected ? UIColor.white :  UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func setupViews(image:UIImage){
        self.image.image = image
        contentView.addSubview(self.image)
        self.image.Anchor(height: 28, width: 28)
        self.image.CenterX(inView: self)
        self.image.CenterY(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
