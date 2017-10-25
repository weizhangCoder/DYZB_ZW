//
//  BaseAnchorViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/29.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

private let KItemMargin:CGFloat = 10
private let KHeaderViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
let kPrettyCellID = "kPrettyCellID"

let KNormalItemW = (KscreenW - 3 * KItemMargin)/2

let KNormalItemH = KNormalItemW * 3/4

let KPrettyItemH = KNormalItemW * 4/3


class BaseAnchorViewController: BaseViewController {
    
    var baseVM : BaseViewModel!
    lazy var collectionView : UICollectionView = { [unowned self] in
        let layout  = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = KItemMargin
        layout.itemSize = CGSize(width: KNormalItemW, height: KNormalItemH)
        layout.headerReferenceSize = CGSize(width: KscreenW, height: KHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: KItemMargin, bottom: 0, right: KItemMargin)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout :layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()

    }



}


extension BaseAnchorViewController{
    
    override func setupUI(){

        
        view.addSubview(collectionView)
        
      
        super.setupUI()
    }
    
    
}
extension BaseAnchorViewController{
    
    func loadData()  {
        
    }
    
}

// MARK:- 总收协议
extension BaseAnchorViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseVM.anchorGroups[section].anchors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        
        cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        headerView.group = baseVM.anchorGroups[indexPath.section]
        return headerView
    }
}

extension BaseAnchorViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
