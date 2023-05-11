//
//  ViewController.swift
//  YoutebeClone
//
//  Created by admin on 11/14/22.
//

import UIKit

class ViewController: UICollectionViewController {
    
   var titleLabel = UILabel()
    
    let titles = ["Home","Trending","Subscriptions","Acount"]
   lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.viewController = self
        return mb
    }()

   
    
    
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
       // navigationController?.hidesBarsOnSwipe = true
        setupCollectionView()
        
    }
    
    func setupCollectionView(){
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
        }
       
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: "TrendingCell")
        collectionView.register(SubscriptionCell.self, forCellWithReuseIdentifier: "SubscriptionCell")
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.isPagingEnabled = true
        setNavigationItem()
        setupMenuBar()
        setupNavBarButton()
    }
    func setNavigationItem(){
       
        titleLabel.frame = CGRect(x: 28, y: 8, width: UIScreen.main.bounds.size.width-28, height: 30)
        titleLabel.textColor = UIColor.white//(red:255, green:255, blue:255, alpha:1.0)
      
        titleLabel.text = "Home"

        self.navigationItem.titleView = titleLabel
    }
    func setupNavBarButton(){
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        searchImage?.withTintColor(.tintColor)
      
        let searchBarButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(hundlesearch))
        let moreButton = UIBarButtonItem(image: UIImage(named: "icons8-menu-vertical-30")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(hundleMore))
        navigationItem.rightBarButtonItems = [moreButton,searchBarButton]
        
    }
    
    @objc func hundlesearch(){
        
        scrollToMenu(Index: 2)
    }
    func scrollToMenu(Index:Int){
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: IndexPath(row: Index, section: 0), at:.centeredHorizontally , animated: true)
        collectionView.isPagingEnabled = true
    }
    
    lazy var a : SettingsLauncher = {
        let a = SettingsLauncher()
        a.homeController = self
        return a
    }()
    @objc func hundleMore(){
      
        a.showSetting()
        
    }
    func showControllerForSetting(setting:setting){
        let dummySettingViewController = UIViewController()
        dummySettingViewController.title = setting.name
        dummySettingViewController.view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        //navigationController?.navigationBar.titleTextAttributes = [NSColor:UIColor.white]
        navigationController?.pushViewController(dummySettingViewController, animated: true)
    }
    private func setupMenuBar(){
        view.addSubview(menuBar)
        menuBar.Anchor(top: view.topAnchor,left: view.leftAnchor,right: view.rightAnchor,height: 50)
    }
    
   
    

    
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! FeedCell
            cell.setupViews()
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionCell", for: indexPath) as! FeedCell
            cell.setupViews()
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! TrendingCell
            cell.setupViews()
            return cell
        }

   //     return collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index:Int = Int(targetContentOffset.pointee.x / self.view.frame.width)
        menuBar.collectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        titleLabel.text = titles[index]
        
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.leftBarAnchor?.constant = scrollView.contentOffset.x / 4
        
       
    }
}
