//
//  Template2.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit


class Template2: TemplateBase {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.purpleColor().CGColor
        self.layer.borderWidth = 2

        k_TemplateH = k_SCREEN_WIDE * 4 / 3.0

        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var datas: NSMutableArray? = NSMutableArray()

    
    /*
     
     *     *
     *     *
     * * * *

    */
    
    override func initViews() {
        self.backgroundColor = UIColor.purpleColor()

        for i in 0...7 {
            
            let tempView = UIImageView(frame: CGRectZero)
            tempView.tag = 1000 + i
            self.addSubview(tempView)
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)

        for i in 0...7 {
            let tempView = self.viewWithTag(1000 + i) as? UIImageView
            if tempView != nil && self.adverModel?.advers?.count > i{
                let model = self.adverModel!.advers!.objectAtIndex(i) as! advModel
                tempView?.image = UIImage(named: model.imgPath as! String)
                
                let w = i < 4 ? CGRectGetWidth(self.frame) / 2.0 : CGRectGetWidth(self.frame) / 4.0
                let h = i < 4 ? CGRectGetHeight(self.frame) * 0.3 : CGRectGetHeight(self.frame) * 0.4
                let x = i < 4 ? w * CGFloat(i % 2) : w * CGFloat(i % 4)
                let y = i < 4 ? h * CGFloat(i / 2) : CGRectGetHeight(self.frame) * 0.6
                
                tempView!.frame = CGRectMake(x, y, w, h)
            }
        }
        
    }

}
