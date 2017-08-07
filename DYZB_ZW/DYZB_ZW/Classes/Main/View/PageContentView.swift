//
//  PageContentView.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/7.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class PageContentView: UIView {
    fileprivate var childVcs : [UIViewController]
    fileprivate weak var parentViewController : UIViewController?
    
    //// MARK:- 懒加载Collotenction
    fileprivate lazy var collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self.bounds.size)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
    
    }()
    

    init(frame : CGRect ,childVcs:[UIViewController],parentViewController:UIViewController?) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame:frame)
        //设置UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//// MARK:- 设置界面

extension PageContentView{
    fileprivate func setupUI(){
        for childVc in childVcs {
            
        }
    
    }
}
