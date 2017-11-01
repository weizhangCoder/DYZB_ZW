//
//  BaseViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/27.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: 定义属性
    var contentView : UIView?
    
    fileprivate lazy var aninImageView : UIImageView = {
        let aninImageView = UIImageView(image: UIImage(named: "img_loading_1"))
        aninImageView.animationImages = [UIImage(named: "img_loading_1")!, UIImage(named: "img_loading_1")!]
        aninImageView.animationRepeatCount = LONG_MAX
        aninImageView.animationDuration = 0.5
        aninImageView.center = self.view.center
        aninImageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]

        return aninImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
        
        setupUI()
    }

   

}


extension BaseViewController{
    func setupUI(){
         // 1.隐藏内容的View
        contentView?.isHidden = true
        
        // 2.添加执行动画的UIImageView
        view.addSubview(aninImageView)
        
         // 3.给animImageView执行动画
        aninImageView.startAnimating()
        
        // 4.设置view的背景颜色
        view.backgroundColor = RGBCOLOR(r: 250, 250, 250)
        
    }
    
    
    func loadDataFinished(){
        
        aninImageView.stopAnimating()
        
        aninImageView.isHidden = true
        
        contentView?.isHidden = false
        
        
    }
    
}
