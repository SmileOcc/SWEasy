//
//  ELPictureCollectionLayout.swift
//  SWEasyLife
//
//  Created by occ on 16/8/27.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELPictureCollectionLayout: BaseCollectionViewFlowLayout {

    override init() {
        super.init()
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        self.minimumLineSpacing = 5
    }
}
