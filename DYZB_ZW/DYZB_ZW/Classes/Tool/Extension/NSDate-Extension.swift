//
//  NSDate-Extension.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/26.
//  Copyright © 2017年 jyall. All rights reserved.
//

import Foundation

extension Date{
    static func getCurrentTime() -> String{
        let nowDate = Date()

        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
    
}
