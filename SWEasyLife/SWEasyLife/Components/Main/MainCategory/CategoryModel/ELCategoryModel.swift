//
//  ELCategoryModel.swift
//  SWEasyLife
//
//  Created by occ on 16/7/25.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit



class ELCategoryModel: BaseModel {
    
    var name: NSString?
    var idx: NSString?
    
    func initDatas(dic: NSDictionary) {
        self.name = dic["name"] as? NSString
        self.idx = dic["idx"] as? NSString
    }
    
    
}
