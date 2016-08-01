//
//  Template3.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class Template3: TemplateBase,UICollectionViewDelegate,UICollectionViewDataSource {

    var datas: NSMutableArray? = NSMutableArray()
    
    var collectionTemplate3: BaseCollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.greenColor().CGColor
        self.layer.borderWidth = 2

        k_TemplateH = 150
        self.initViews()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func initViews() {
        self.backgroundColor = UIColor.grayColor()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize.width = 100
        layout.itemSize.height = 140
        layout.scrollDirection = .Horizontal
        
        collectionTemplate3 = BaseCollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionTemplate3!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "temple3CellId")
        collectionTemplate3!.delegate = self
        collectionTemplate3!.dataSource = self
        collectionTemplate3?.pagingEnabled = true
        self.addSubview(collectionTemplate3!)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("temple3CellId", forIndexPath: indexPath)
        cell.backgroundColor = colorRandom()
        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)
        
        if collectionTemplate3 != nil {
            collectionTemplate3?.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)
            collectionTemplate3?.contentSize = CGSizeMake(k_SCREEN_WIDE * 3, 0)
        }
    }
    

}
