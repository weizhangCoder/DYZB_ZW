//
//  HomeViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/26.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

private var KTitleViewH : CGFloat = 40

class HomeViewController: BaseViewController {
    //懒加载
    private lazy var pageTitleView :PageTitleView = {
        let titleFrame = CGRect(x: 0, y: 0, width: KscreenW, height: KTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
    
        return titleView
    }()//闭包

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupUI()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


extension HomeViewController{
    
    fileprivate func setupUI(){
        //1 设置导航栏
        setupNavigationBar()
        
        
        
    }
    
    fileprivate func setupNavigationBar(){
        //1 设置左边的导航栏
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        //2 设置右边边的导航栏
        let size = CGSize(width: 40, height: 40)
        let history = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [history,searchItem,qrcodeItem]
        
    
    }
    
}
