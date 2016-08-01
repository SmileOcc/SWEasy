//
//  TemplateBase.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class TemplateBase: BaseView {

    var k_TemplateH: CGFloat = 160.0
    var adverModel: HomeAdverModel? {
        
        didSet {
            self.layoutSubviews()
        }
    }

    func templateHeight() -> CGFloat {
        return k_TemplateH
    }
    
    func initViews() {}
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
