//
//  CollectionReusableView.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/29.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    // MARK:- 控件属性
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var moreBtn: UIButton!
    
    var group : AnchorGroup? {
        
        didSet{
            titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
    
    
}


extension CollectionHeaderView{

    class func collectionHeaderView() -> CollectionHeaderView{
    return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
}
