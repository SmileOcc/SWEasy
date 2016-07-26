//
//  ELHttpRequest.swift
//  SWEasyLife
//
//  Created by occ on 16/7/25.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

typealias OnHttpListener = (isSuccessed:Bool, datas:AnyObject?, error:NSError!) -> Void

class ELHttpRequest: BaseModel {

    static let sharedInstance = ELHttpRequest()
    private override init() {} //error:This prevents others from using the default '()' initializer for this class.
    
    // MARK: 一级分类类目
    func requestCategoryFirst(url url:String, parmas: NSDictionary, listener:OnHttpListener ) {
        
        let dataDic = NSDictionary(contentsOfFile: url)
        if dataDic != nil {

            let datasArray = dataDic!["items"]
            if datasArray?.count > 0 {
                listener(isSuccessed: true, datas: datasArray!, error: nil)
            } else {
                listener(isSuccessed: false, datas: nil, error: nil)
            }
        } else {
            listener(isSuccessed: false, datas: nil, error: nil)
        }
    }
    
    // MARK: 首页数据
    func requestHomeDatas(url url:String?, parmas: NSDictionary?, listener:OnHttpListener) {
        
        let dataDic = NSDictionary(contentsOfFile: url!)
        if dataDic != nil {
            let datasArray = dataDic!["items"] as? NSArray
            if datasArray?.count > 0 {
                listener(isSuccessed: true, datas: datasArray!, error: nil)
            }else {
                listener(isSuccessed: false, datas: nil, error: nil)
            }
        }else {
            listener(isSuccessed: false, datas: nil, error: nil)
        }

    }
    
}
