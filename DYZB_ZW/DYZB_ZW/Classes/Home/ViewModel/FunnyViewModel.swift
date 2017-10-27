//
//  FunnyViewModel.swift
//  DYZB_ZW
//
//  Created by 张三 on 24/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewModel {

}

extension FunnyViewModel{
    func loadFunnyData(finishedCallBack :@escaping () -> ()) {
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit" : 30, "offset" : 0], finishedCallback: finishedCallBack)
    }
    
}
