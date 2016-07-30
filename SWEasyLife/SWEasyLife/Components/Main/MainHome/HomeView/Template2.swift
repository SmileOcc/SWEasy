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
        
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
     
     *     *
     *     *
     * * * *

    */
    
    func initViews() {
        
        for i in 0...7 {
            
            let tempView = UIView(frame: CGRectZero)
            tempView.backgroundColor = colorRandom()
            self.addSubview(tempView)
            
            let w = i < 4 ? CGRectGetWidth(self.frame) / 2.0 : CGRectGetWidth(self.frame) / 4.0
            let h = i < 4 ? CGRectGetHeight(self.frame) * 0.3 : CGRectGetHeight(self.frame) * 0.4
            let x = i < 4 ? w * CGFloat(i % 2) : w * CGFloat(i % 4)
            let y = i < 4 ? h * CGFloat(i / 2) : CGRectGetHeight(self.frame) * 0.6
            
            tempView.frame = CGRectMake(x, y, w, h)
        }
    }
    
    
    var datas: NSMutableArray? = NSMutableArray()
    
    
    override func templateHeight() -> CGFloat {
        return 190
    }


}
