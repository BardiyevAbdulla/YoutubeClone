//
//  FeedCell.swift
//  YoutebeClone
//
//  Created by admin on 11/17/22.
//


import UIKit


class FeedCell:UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var list:[Video]?
    let cellId = "cellId"
    
    lazy var collectionView: UICollectionView = {
        let reflesh = UIRefreshControl()
        reflesh.addTarget(self, action: #selector(onreflesh), for: .valueChanged)
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.refreshControl = reflesh
        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        for item in contentView.subviews{
            item.removeFromSuperview()
        }
        setupViews()
        
    }
    @objc func onreflesh(_ ref:UIRefreshControl){
       print(12345654)
        ref.endRefreshing()
    }
    func fetchVideos(){
      
            APICaller.shared.fetchHome { videos in
                self.list = videos
               
            }
        
        
        self.collectionView.reloadData()
    }
    func setupViews(){
       
      fetchVideos()
        //contentView.addSubview(collectionView)
        addSubview(collectionView)
        collectionView.frame = CGRect(x: 0, y: 60, width: self.frame.width, height: self.frame.height-61)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MyCollectionViewCell else {return UICollectionViewCell()}
        cell.video = list?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: self.frame.width, height: height+16+88)
    }
    
}
