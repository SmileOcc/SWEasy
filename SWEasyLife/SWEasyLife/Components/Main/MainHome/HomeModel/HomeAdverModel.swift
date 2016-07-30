//
//  HomeAdverModel.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class HomeAdverModel: BaseModel {

    var idx:          NSString?
    var templateType: NSString?
    var index:        NSString?
    var name:         NSString?
    var number:       NSString?
    var advers:       NSArray?

    
    func initModelData(dic: NSDictionary?) {
        if dic != nil {
            
            self.idx =             dic!["id"] as? NSString
            self.templateType =    dic!["templateType"] as? NSString
            self.index =           dic!["index"] as? NSString
            self.name =            dic!["name"] as? NSString
            self.number =          dic!["number"] as? NSString
            
            let adverts = dic!["adverts"] as? NSArray
            if adverts != nil {
                let tempAdvers = NSMutableArray()
                adverts?.enumerateObjectsUsingBlock({ (obj, index, stop) in
                    let adv:advModel = advModel()
                        adv.initModelData(obj as? NSDictionary)
                    tempAdvers.addObject(adv)
                })
                
                self.advers = NSArray(array: tempAdvers)
            }
        }
    }
}

class advModel: BaseModel {
    
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
