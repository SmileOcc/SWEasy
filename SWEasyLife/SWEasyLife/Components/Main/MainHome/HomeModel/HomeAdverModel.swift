//
//  HomeAdverModel.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class HomeAdverModel: BaseModel {

    var idx: NSString?
    var endTime: NSString?
    var imgPath: NSString?
    var index: NSString?
    var objId: NSString?
    var startTime: NSString?
    var title: NSString?
    var type: NSString?
    var url: NSString?
    
    func initModelData(dic: NSDictionary?) {
        if dic != nil{
//            if dic! is NSDictionary  {
                self.idx =       dic!["id"] as? NSString
                self.endTime =   dic!["endTime"] as? NSString
                self.imgPath =   dic!["imgPath"] as? NSString
                self.index =     dic!["index"] as? NSString
                self.objId =     dic!["objId"] as? NSString
                self.startTime = dic!["startTime"] as? NSString
                self.title =     dic!["title"] as? NSString
                self.type =      dic!["type"] as? NSString
                self.url =       dic!["url"] as? NSString

//            }
            
        }
    }
}
