//
//  NetworkTools.swift
//  DYZB_ZW
//
//  Created by zhangwei on 17/8/25.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType{
    case get
    case post
}

class NetworkTools {
    //逃逸闭包几秒后才执行  所以  这样就需要显示的声明@escaping才能编译通过。  如果这个闭包是在函数执行完后才被调用，调用的地方超过了这函数的范围，所以叫逃逸闭包。
    
    class func requestData(_ type : MethodType ,URLString : String ,parameters : [String : Any]? = nil , finishedCallback :@escaping (_ result : Any)->()){
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        // 2.发送网络请求
       Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
        guard let result = response.result.value else{
            print(response.result.error ?? "")
            return
        }
        
        finishedCallback(result)
        
        }

    
    }

}
