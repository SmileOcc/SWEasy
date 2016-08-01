//
//  Template1.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class Template1: TemplateBase {

    var datas: NSMutableArray? = NSMutableArray()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        k_TemplateH = k_SCREEN_WIDE * 3 / 4
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    override func initViews() {
        self.backgroundColor = UIColor.blueColor()

        for i in 0...6 {
            
            let tempView = UIImageView(frame: CGRectZero)
            tempView.tag = 1000 + i
            self.addSubview(tempView)
            
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)
        
        
        for i in 0...6 {
            let tempView = self.viewWithTag(1000 + i) as? UIImageView
            if tempView != nil && self.adverModel?.advers?.count > i {
                let model = self.adverModel!.advers!.objectAtIndex(i) as! advModel
                tempView!.image = UIImage(named: (model.imgPath as? String)!)
                
                if i == 0 {
                    tempView!.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) / 2.0, CGRectGetWidth(self.frame) / 2.0)
                } else if i < 3 {
                    tempView!.frame = CGRectMake(CGRectGetWidth(self.frame) / 2.0, CGRectGetWidth(self.frame) / 4.0 * CGFloat(i / 2), CGRectGetWidth(self.frame) / 2.0, CGRectGetWidth(self.frame) / 4.0)
                } else {
                    tempView!.frame = CGRectMake(CGRectGetWidth(self.frame) / 4.0 * CGFloat(i-3), CGRectGetWidth(self.frame) / 2.0, CGRectGetWidth(self.frame) / 4.0, CGRectGetWidth(self.frame) / 4.0)

                }
            }
        }
        
    }


}
