//
//  CollectionCycleCell.swift
//  DYZB_ZW
//
//  Created by 张三 on 26/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   
    }
    // MARK: 定义模型属性
    var cycleModel : CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let iconURL = URL(string: cycleModel?.pic_url ?? "")!
            
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "Img_default"))
        }
    }
}
