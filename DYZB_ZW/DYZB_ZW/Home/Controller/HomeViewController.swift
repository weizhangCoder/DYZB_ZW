//
//  HomeViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/26.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

private var KTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    //懒加载
    fileprivate lazy var pageTitleView :PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y:0, width: KscreenW, height: KTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()//闭包
//
    fileprivate lazy var pageContentView:PageContentView = { [weak self] in
        let pageContentFrame = CGRect(x: 0, y: KTitleViewH, width: KscreenW, height:
            KscreenH - KNavBarH - KTitleViewH - KTabBarH)
        var childvcs = [UIViewController]()
        childvcs.append(RecommendViewController())
        childvcs.append(GameViewController())
        childvcs.append(AmuseViewController())
        childvcs.append(FunnyViewController())
        
        let collection = PageContentView(frame: pageContentFrame, childVcs: childvcs
            , parentViewController: self)
        collection.delegate = self
        return collection
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupUI()
    
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
        
        //2.添加TitleView
        view.addSubview(pageTitleView)
        //3 ,添加ContentView
        view.addSubview(pageContentView)
        

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

// MARK:- PageTitleViewDelegate 代理
extension HomeViewController :PageTitleViewDelegate{

    func pageTitleView(_ titleView: PageTitleView, selectedIndex: Int) {
        print(titleView,selectedIndex)
        
        pageContentView.setCurrentIndex(selectedIndex)
    }

}


extension HomeViewController : PageContentViewDelegate{
    
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}


