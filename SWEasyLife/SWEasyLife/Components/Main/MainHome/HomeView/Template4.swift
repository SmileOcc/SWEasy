//
//  Template4.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class Template4: TemplateBase {

    var datas: NSMutableArray? = NSMutableArray()
    
    var tempView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.orangeColor().CGColor
        self.layer.borderWidth = 2

        k_TemplateH = 120
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func initViews() {
        self.backgroundColor = UIColor.purpleColor()
        
        tempView = UIImageView(frame: CGRectZero)
        self.addSubview(tempView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)
        
        if self.adverModel?.advers?.count > 0 {
            let model = self.adverModel!.advers!.objectAtIndex(0) as! advModel
            
            tempView?.image = UIImage(named: model.imgPath as! String)
            tempView!.frame = CGRectMake(10, 10, CGRectGetWidth(self.frame) - 20, CGRectGetHeight(self.frame) - 20)

        }        
    }

}
