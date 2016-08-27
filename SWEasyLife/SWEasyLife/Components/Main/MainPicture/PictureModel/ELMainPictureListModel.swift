//
//  ELMainPictureListModel.swift
//  SWEasyLife
//
//  Created by occ on 16/8/27.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELMainPictureListModel: BaseListModel {
    
    override func loadFirstTime(firstTime: Bool) {
        
        //加载数据
        let homeDataPath = NSBundle.mainBundle().pathForResource("Picture", ofType: "plist")
        ELHttpRequest.sharedInstance.requestHomeDatas(url: homeDataPath, parmas: nil) { (isSuccessed, datas, error) in
            
            if (self.resultBlock != nil) {
                self.resultBlock!(isSuccessed: isSuccessed,datas: datas,error: error)
            }
        }
    }
    
    

}
