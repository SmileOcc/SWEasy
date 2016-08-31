//
//  Template8.swift
//  SWEasyLife
//
//  Created by occ on 16/8/30.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class Template8: TemplateBase {

    var datas: NSMutableArray? = NSMutableArray()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func templateHeight() -> CGFloat {
        return 250
    }
    
    override func initViews() {
        
        var x:CGFloat = 0.0
        var y:CGFloat = 0.0
        let space:CGFloat = 5.0
        let width = CGFloat(k_SCREEN_WIDE - space * 5) / 4.0
        
        for  i in 0...8 {
  
            x = width * CGFloat(i % 4) + CGFloat(i % 4) * space
            y = CGFloat(i / 4) * width
            
            let tempView = UIView(frame: CGRectMake(x,y,width,width))
            tempView.backgroundColor = colorRandom()
            tempView.tag = 1000 + i
            self.addSubview(tempView)
        }
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for i in 0...8 {
            
            if self.datas?.count > i {
                
                let tempView = self.viewWithTag(1000 + i)

            }
            
        }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    }

}
