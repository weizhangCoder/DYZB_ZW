//
//  PageTitleView.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/7/27.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

// MARK:- 代理
protocol PageTitleViewDelegate :class{
    func pageTitleView(_ titleView :PageTitleView, selectedIndex :Int)

}
//// MARK:- 定义常量


private let KScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)






class PageTitleView: UIView {
    fileprivate var currentIndex :Int = 0
    fileprivate var titles: [String]
    weak var delegate : PageTitleViewDelegate?
    
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
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(_:)))
            label.addGestureRecognizer(tapGes)
            
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
       firstLabel.textColor = RGBCOLOR(r: 255, 128, 0)
       firstLabel.textColor = UIColor.orange
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - KScrollLineH, width: firstLabel.frame.width, height: KScrollLineH)
    
    }
    
    

}

extension PageTitleView{
    @objc fileprivate func titleLabelClick(_ tapGes :UITapGestureRecognizer){
        
        guard let currentLabel = tapGes.view as? UILabel else { return }
        
        if currentLabel.tag == currentIndex {
            return
        }
        
        let oldLabel = titleLables[currentIndex]
        
        // 3.切换文字的颜色
        currentLabel.textColor = RGBCOLOR(r: kSelectColor.0, kSelectColor.1, kSelectColor.2)
        oldLabel.textColor = RGBCOLOR(r: kNormalColor.0, kNormalColor.1, kNormalColor.2)
        //4,.保存最新的下标
        currentIndex = currentLabel.tag;
        //5滚动条改变
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLineX
            
        }
        //6代理
        delegate?.pageTitleView(self, selectedIndex: currentIndex)
        
        
    
    }

}

// MARK:- 暴露在外部的方法
extension PageTitleView{
    
    func setTitleWithProgress(_ progress : CGFloat, sourceIndex :Int, targetIndex :Int){
        // 1.取出sourceLabel/targetLabel
        let sourceLabel = titleLables[sourceIndex]
        let targetLabel = titleLables[targetIndex]
        
        // 2.处理滑块的逻辑
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        // 3.颜色的渐变(复杂)
        // 3.1.取出变化的范围
        let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        
        // 3.2.变化sourceLabel
        sourceLabel.textColor = RGBCOLOR(r: kSelectColor.0 - colorDelta.0 * progress, kSelectColor.1 - colorDelta.1 * progress, kSelectColor.2 - colorDelta.2 * progress)
        
        // 3.2.变化targetLabel
        targetLabel.textColor = RGBCOLOR(r: kNormalColor.0 + colorDelta.0 * progress, kNormalColor.1 + colorDelta.1 * progress, kNormalColor.2 + colorDelta.2 * progress)

        
        // 4.记录最新的index
        currentIndex = targetIndex

        
    
    }

}

