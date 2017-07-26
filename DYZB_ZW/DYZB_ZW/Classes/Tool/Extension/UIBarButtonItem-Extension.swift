//
//  UIBarButtonItem-Extension.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/26.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

extension UIBarButtonItem{

    // 便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName : String,highImageName:String = "",size : CGSize = CGSize.zero) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named:imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named:highImageName), for: .highlighted)
        }
        if size == CGSize.zero {
                btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin : CGPoint.zero,size : size)
        }
        
        self.init(customView : btn)
    }

}
