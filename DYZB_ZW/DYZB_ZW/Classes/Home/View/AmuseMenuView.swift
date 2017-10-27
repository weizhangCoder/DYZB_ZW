//
//  AmuseMenuView.swift
//  DYZB_ZW
//
//  Created by 张三 on 27/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

private let kMenuCellID = "kMenuCellID"
class AmuseMenuView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var groups : [AnchorGroup]?{
        didSet {
            collectionView.reloadData()
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "AmuseMenuViewCell", bundle: nil), forCellWithReuseIdentifier: kMenuCellID)
        pageControl.isHidden = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        
    }
    
    
}


extension AmuseMenuView{
    
    class func amuseMenuView() -> AmuseMenuView{
       return Bundle.main.loadNibNamed("AmuseMenuView", owner: nil, options: nil)?.first as! AmuseMenuView
    }
    
}

extension AmuseMenuView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if groups == nil {
            return 0
        }
        let pageNum = Int(groups!.count - 1)/8 + 1
        pageControl.numberOfPages = pageNum
        pageControl.isHidden = (pageNum == 1)
        return pageNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMenuCellID, for: indexPath) as! AmuseMenuViewCell
        // 0页: 0 ~ 7
        // 1页: 8 ~ 15
        // 2也: 16 ~ 23
        
        let startIndex = indexPath.item * 0
        var endIndex = Int(indexPath.item + 1) * 8 - 1
        
        if endIndex > groups!.count - 1 {
            endIndex = groups!.count - 1
        }
        cell.groups = Array(groups![startIndex...endIndex])
        return cell
    }
}
extension AmuseMenuView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
}


