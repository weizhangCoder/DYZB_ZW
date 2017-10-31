//
//  CycleModel.swift
//  DYZB_ZW
//
//  Created by 张三 on 25/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    

    // 标题
    var title : String = ""
    // 展示的图片地址
    var pic_url : String = ""


    var anchor : AnchorModel?

    // 主播信息对应的字典
    var room : [String : NSObject]? {
        didSet{
            guard let room = room else {return;}
            anchor  = AnchorModel(dict: room)
        }

    }


     init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    

}
