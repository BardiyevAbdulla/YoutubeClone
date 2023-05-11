//
//  SettingsLauncher.swift
//  YoutebeClone
//
//  Created by admin on 11/16/22.
//

import UIKit
struct setting{
    let name:String
    let imageName:String
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}
class SettingsLauncher: NSObject,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    var homeController : ViewController?
   
    
    let blackView = UIView()
    let cellHeight:CGFloat = 50
   lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
       cv.register(SettingCell.self, forCellWithReuseIdentifier: "SettingCell")
       cv.delegate = self
       cv.dataSource = self
        cv.backgroundColor = .white
        return cv
    }()
    let list :[setting] = [setting(name: "Settings", imageName: "gearshape.fill"),
                           setting(name: "Term & privacy policy", imageName: "exclamationmark.lock.fill"),
                           setting(name: "Send Feedback", imageName: "exclamationmark.bubble.fill"),
                           setting(name: "Help", imageName: "questionmark.circle.fill"),
                           setting(name: "Switch account", imageName: "person.crop.circle.fill"),
                           setting(name: "Cancel", imageName: "x.square")]
     func showSetting(){
        if let window = UIApplication.shared.keyWindow{
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hundleDismiss)))
            blackView.backgroundColor = UIColor(white: 1, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(collectionView)
            let height:CGFloat = CGFloat(list.count)*cellHeight
            let y = window.frame.height - height - 15
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
                self.blackView.alpha = 1
                
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: height)
            }
            
           
        }
        
    }
    @objc func hundleDismiss(){
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.cellHeight)
            }
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingCell", for: indexPath) as? SettingCell else{return UICollectionViewCell()}
        cell.setupViews()
        cell.setting = list[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        hundleDismiss()
        let setting = list[indexPath.row]
        if setting.name != "Cancel"{
            homeController?.showControllerForSetting(setting:setting)
            
        }
    }
}
