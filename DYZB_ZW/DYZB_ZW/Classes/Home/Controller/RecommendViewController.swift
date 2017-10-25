//
//  RecommendViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/7.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

private let kCycleViewH = KscreenW * 3 / 8
private let kGameViewH : CGFloat = 90




class RecommendViewController: BaseAnchorViewController{
    
   fileprivate lazy var recommenfVM : RecommendViewModel = RecommendViewModel()
    
  
    fileprivate lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: KscreenW, height: kGameViewH)
        return gameView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
    }
    

}
extension RecommendViewController{
    override func setupUI() {
        super.setupUI()
        
        
        // 3.将gameView添加collectionView中
        collectionView.addSubview(gameView)
        // 4.设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
    }
    
    
}
extension RecommendViewController{
    override func loadData() {
        baseVM = recommenfVM
        recommenfVM.requestData {
            // 1.展示推荐数据
            self.collectionView.reloadData()
            
            // 2.将数据传递给GameView
            var groups = self.recommenfVM.anchorGroups
            // 2.1.移除前两组数据
            groups.removeFirst()
            groups.removeFirst()
            // 2.2.添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            
            self.gameView.groups = groups;
//
            
        }
    }
    
}


extension RecommendViewController :UICollectionViewDelegateFlowLayout{
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            prettyCell.anchor = recommenfVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            return prettyCell
        } else{
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1 {
            return CGSize(width: KNormalItemW, height: KPrettyItemH)
        }
        return CGSize(width: KNormalItemW, height: KNormalItemH)
    }


}



    
