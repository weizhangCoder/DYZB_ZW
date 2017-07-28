//
//  PageTitleView.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/27.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit


//// MARK:- 定义常量

private let KScrollLineH : CGFloat = 2
private let KNormalColor : (CGFloat,CGFloat,CGFloat) = (85,85,85)
private let KSelectColor : (CGFloat,CGFloat,CGFloat) = (255,128,0)


class PageTitleView: UIView {
    
    fileprivate var titles: [String]
    
     // MARK:- 懒加载属性
    fileprivate lazy var titleLables : [UILabel] = [UILabel]()
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()

    init(frame: CGRect,titles: [String]) {
        self.titles = titles
        super.init(frame:frame)
        //设置UI界面
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension PageTitleView {
    
    fileprivate func setupUI(){
        //1.添加UISrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        //2.添加对应的label
        setupTitleLabels()

        //3.添加底线和滑块的滚动
        setupBotttomLineAndScrollLine()
        
        
        
    
    }
    
    fileprivate func setupTitleLabels(){
        let labelY : CGFloat = 0
        let labelW : CGFloat = frame.width / CGFloat(self.titles.count)
        let labelH : CGFloat = frame.height - KScrollLineH
        
        for (index,title) in self.titles.enumerated() {
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.boldSystemFont(ofSize: 16.0)
            label.textAlignment = .center
            let labelX :CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLables.append(label)
            //给label 添加手势
            label.isUserInteractionEnabled = true
//            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self)
            
//            label.addGestureRecognizer(tapGes)
            
        }
    }
    
    fileprivate func setupBotttomLineAndScrollLine(){
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        guard let firstLabel = titleLables.first else {
            return;
        }
//        firstLabel.textColor = UIColor(r: KSelectColor.0,g: KSelectColor.1,b: KSelectColor.2)
       firstLabel.textColor = UIColor.orange
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - KScrollLineH, width: firstLabel.frame.width, height: KScrollLineH)
    
    }
    
    

}
