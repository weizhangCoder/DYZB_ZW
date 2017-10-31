//
//  GameViewModel.swift
//  DYZB_ZW
//
//  Created by 张三 on 24/10/17.
//  Copyright © 2017年 jyall. All rights reserved.
//

import UIKit

class GameViewModel: BaseViewModel {
    lazy var games : [GameModel] = [GameModel]()
    
}

extension GameViewModel{

    func loadAllGameData(finishedCallBack :@escaping () -> ()){
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
            guard let resultDict = result as? [String : Any] else{ return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            
            for dict in dataArray{
                
                self.games.append(GameModel(dict: dict))
            }
            
            finishedCallBack()
            
        }
        
    }

}
