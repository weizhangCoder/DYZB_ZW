//
//  RecommendViewController.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/7.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit






class RecommendViewController: BaseAnchorViewController{
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
    }
    
    
 
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RecommendViewController :UICollectionViewDelegateFlowLayout{
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            
            return prettyCell
        } else{
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1 {
            return CGSize(width: KNormalItemW, height: KPrettyItemH)
        }
        return CGSize(width: KNormalItemW, height: KNormalItemH)
    }


}



    
