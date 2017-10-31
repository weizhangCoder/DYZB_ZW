//
//  AmuseViewModel.swift
//  DYZB_ZW
//
//  Created by 张三 on 24/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class AmuseViewModel: BaseViewModel {

    func loadAmuseData (finishedCallback : @escaping () -> () ){
     loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
