//
//  CollectionGameCell.swift
//  DYZB_ZW
//
//  Created by 张三 on 25/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    // MARK: 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var baseGame : BaseGameModel?{
        didSet{
            titleLabel.text = baseGame?.tag_name
            
            if let iconURL = URL(string :baseGame?.icon_url ?? "") {
                iconImageView.kf.setImage(with: iconURL)
            }else{
                
                iconImageView.image = UIImage(named: "home_more_btn")
            }
            
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
