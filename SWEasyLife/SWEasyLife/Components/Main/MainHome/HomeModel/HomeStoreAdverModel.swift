//
//  HomeStoreAdverModel.swift
//  SWEasyLife
//
//  Created by occ on 16/7/30.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class HomeStoreAdverModel: BaseModel {

    //活动区集
    var adversDatas: NSMutableArray?
    
    var adversPage: NSInteger = 0
    
    var adversTotalPage: NSInteger = 0
    
    override init() {
        super.init()
        
        self.adversDatas = NSMutableArray()
        
    }
    

    //MARK: 数据处理
    func initDatas(datas: AnyObject?) {
        
        let items = datas as? NSArray
        if items?.count > 0 {
            
            items?.enumerateObjectsUsingBlock({ (obj, index, stop) in
                
                let adverModel = HomeAdverModel()
                adverModel.initModelData(obj as? NSDictionary)
                self.adversDatas?.addObject(adverModel)

            })
        }
    }

}
