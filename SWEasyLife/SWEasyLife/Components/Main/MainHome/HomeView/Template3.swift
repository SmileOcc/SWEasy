//
//  Template3.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class Template3: TemplateBase {

    var datas: NSMutableArray? = NSMutableArray()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        k_TemplateH = 120
        self.initViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func initViews() {
        self.backgroundColor = UIColor.grayColor()

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)
        
        
    }
    

}
