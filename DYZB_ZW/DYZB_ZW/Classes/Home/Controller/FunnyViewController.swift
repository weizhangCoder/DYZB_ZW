//
//  FunnyViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/7.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

private let kTopMargin : CGFloat = 8
class FunnyViewController: BaseAnchorViewController {

   fileprivate var funnyVM : FunnyViewModel  = FunnyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsetsMake(kTopMargin, 0, 0, 0)
    }



}

extension FunnyViewController{
    override func setupUI() {
        super.setupUI()
        
    }
    
}

extension FunnyViewController{
    override func loadData() {
        // 1.给父类中的ViewModel进行赋值
        baseVM = funnyVM
        
        funnyVM.loadFunnyData {
            
            self.collectionView.reloadData()
       
        }
    }
    
}
