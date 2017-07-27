//
//  UIColor-Extension.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/26.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

extension UIColor{
    
    class func hexInt(_ hexValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
                       
                       green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
                       
                       blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
                       
                       alpha: 1.0)
    }


}
