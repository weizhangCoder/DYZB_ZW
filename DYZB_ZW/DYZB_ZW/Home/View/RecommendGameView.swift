//
//  RecommendGameView.swift
//  DYZB_ZW
//
//  Created by 张三 on 24/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit
private let kGameCellID = "kGameCellID"
private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    
    var groups : [BaseGameModel]?{
        didSet{
            collectionView.reloadData()
        }
    }
    

    // MARK: 控件属性

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        // 让控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
           // 注册Cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        // 给collectionView添加内边距
        collectionView.contentInset = UIEdgeInsetsMake(0, kEdgeInsetMargin, 0, kEdgeInsetMargin)
        
        
    }

}

extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView{
        
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
    
}

extension RecommendGameView :UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        cell.baseGame = groups![indexPath.item]
        return cell;
    }
}
