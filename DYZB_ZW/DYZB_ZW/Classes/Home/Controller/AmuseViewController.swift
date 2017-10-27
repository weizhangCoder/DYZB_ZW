//
//  AmuseViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/7.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit
private let kMenuViewH : CGFloat = 200
class AmuseViewController:  BaseAnchorViewController{
   fileprivate var amuseVM :AmuseViewModel = AmuseViewModel()
    fileprivate var amuseView : AmuseMenuView = {
        let amuseView = AmuseMenuView.amuseMenuView()
        amuseView.frame = CGRect(x: 0, y: -kMenuViewH, width: KscreenW, height: kMenuViewH)
        return amuseView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

}


extension AmuseViewController{
    
    override func setupUI() {
            super.setupUI()
        
        collectionView.addSubview(amuseView)
        
        collectionView.contentInset = UIEdgeInsetsMake(kMenuViewH, 0, 0, 0)
    }
    
}

extension AmuseViewController{
    
    override func loadData() {
        
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
            
            // 2.2.调整数据
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            self.amuseView.groups = tempGroups
            
        }
        
    }
    
}
