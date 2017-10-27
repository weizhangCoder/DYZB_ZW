//
//  RecommendCycleView.swift
//  DYZB_ZW
//
//  Created by 张三 on 26/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {
    var cycleTimer : Timer?
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var cycleModels : [CycleModel]?{
        didSet{
            // 1.刷新collectionView
            collectionView.reloadData()
            // 2.设置pageControl个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            // 3.默认滚动到中间某一个位置
            let indexpath = IndexPath(item: (cycleModels?.count ?? 0) * 10, section: 0)
            collectionView.scrollToItem(at: indexpath, at: .left, animated: false)

            // 4.添加定时器
            removerCycleTimer()
            addCycleTimer()
            
        }
    }

    override func awakeFromNib() {
        autoresizingMask = UIViewAutoresizing()
        //注册cell
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
        
        collectionView.backgroundColor = UIColor.red
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
    
}

extension RecommendCycleView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CollectionCycleCell
//        cell.cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        cell.cycleModel = cycleModels![(indexPath as NSIndexPath).item % cycleModels!.count]
        
        return cell
    }
}

extension RecommendCycleView{
    class func recommendCycleView() -> RecommendCycleView{
        
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
    
}

extension RecommendCycleView :UICollectionViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        pageControl.currentPage = Int(offsetX/scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removerCycleTimer()
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        addCycleTimer()
    }
    
}

extension RecommendCycleView{
    fileprivate func addCycleTimer(){
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
        
    }
    fileprivate func removerCycleTimer(){
        cycleTimer?.invalidate()
        cycleTimer = nil
        
    }
    
    @objc fileprivate func scrollToNext(){
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = collectionView.bounds.width + currentOffsetX
        collectionView.setContentOffset(CGPoint(x:offsetX,y:0), animated: true)
    }
    
    
}
