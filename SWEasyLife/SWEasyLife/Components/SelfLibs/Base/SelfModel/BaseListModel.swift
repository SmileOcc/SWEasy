//
//  BaseListModel.swift
//  SWEasyLife
//
//  Created by occ on 16/8/27.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

//enum RequestResultState {
//    case Success
//    case Fail
//    case Error
//    case Error2
//}

typealias RequestResultBlock = (isSuccessed:Bool, datas:AnyObject?, error:NSError!) -> Void

class BaseListModel: BaseModel {

    // Mark - 公有
    var page:    NSInteger? = 0
    var total:   NSInteger? = 0
    var datas:   NSMutableArray = NSMutableArray()
    var resultBlock: RequestResultBlock?
    
    // Mark - 状态
    var requestState: Bool?
    var requestData:  AnyObject?
    var requestError: NSError?
    
    // Mark - 公有方法
    func refresh() {
        self.loadFirstTime(true)
    }
    
    func loadMore() {
        self.loadFirstTime(false)
    }
    
    func more() -> Bool {
        
        if datas.count < total {
            return true
        }
        
        return false
    }
    
    // Mark - 加载处理
    func loadFirstTime(firstTime: Bool) {
        

    }
    
}
