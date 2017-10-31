//
//  AmuseMenuViewCell.swift
//  DYZB_ZW
//
//  Created by 张三 on 27/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit
private let kGameCellID = "kGameCellID"
class AmuseMenuViewCell: UICollectionViewCell {
    
    var groups : [AnchorGroup]?{
        didSet {
            collectionView.reloadData()
        }
        
    }

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
              collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemW = collectionView.bounds.width / 4
        let itemH = collectionView.bounds.height / 2
        layout.itemSize = CGSize(width: itemW, height: itemH)
    }

}
extension AmuseMenuViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1.求出Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
        // 2.给Cell设置数据
        cell.baseGame = groups![indexPath.item]
        cell.clipsToBounds = true
        
        return cell
    }
}
