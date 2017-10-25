//
//  BaseViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/27.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
        
        
    }

   

}


extension BaseViewController{
    func setupUI(){
        
    }
    
}
