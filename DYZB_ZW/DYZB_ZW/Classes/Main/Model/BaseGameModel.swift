//
//  BaseGameModel.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/25.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class BaseGameModel: NSObject {
    
    var tag_name: String = ""
    var icon_url: String = ""
    
    
    override init(){
    
    }
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

}
