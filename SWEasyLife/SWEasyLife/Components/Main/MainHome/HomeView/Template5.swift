//
//  Template5.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class Template5: TemplateBase,UICollectionViewDataSource,UICollectionViewDelegate{

    var datas: NSMutableArray? = NSMutableArray()
    
    
    var collectionTemplate5: BaseCollectionView?
    var layout:UICollectionViewFlowLayout?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.greenColor().CGColor
        self.layer.borderWidth = 2
        
        k_TemplateH = k_SCREEN_WIDE * 2
        self.initViews()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func initViews() {
        self.backgroundColor = UIColor.grayColor()
        
        layout = UICollectionViewFlowLayout()
        layout!.itemSize.width = 100
        layout!.itemSize.height = 140
        layout!.scrollDirection = .Vertical
        
        collectionTemplate5 = BaseCollectionView(frame: CGRectZero, collectionViewLayout: layout!)
        collectionTemplate5!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "temple5CellId")
        collectionTemplate5!.delegate = self
        collectionTemplate5!.dataSource = self
        collectionTemplate5?.pagingEnabled = true
        self.addSubview(collectionTemplate5!)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("temple5CellId", forIndexPath: indexPath)
        cell.backgroundColor = colorRandom()
        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)
        
        if collectionTemplate5 != nil {
            layout?.itemSize.width = CGRectGetWidth(self.frame) - 20
            layout?.itemSize.height = 50
            
            collectionTemplate5?.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)
            collectionTemplate5?.contentSize = CGSizeMake(0, k_TemplateH)
        }
    }

}
