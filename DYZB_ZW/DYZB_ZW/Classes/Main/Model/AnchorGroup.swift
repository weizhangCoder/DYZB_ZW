//
//  AnchorGroup.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/25.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class AnchorGroup: BaseGameModel {
    
    var room_list :[[String : NSObject]]?{
        
        didSet{
            
            guard let room_list = room_list else {
                return
            }
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
            
        }
    
    
    }
    

    var icon_name : String = "home_header_normal"
    
    lazy var anchors : [AnchorModel] = [AnchorModel]()

}
