//
//  ELDMCBooksView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/26.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

let k_BookCellID = "BookCellID"

class ELDMCBooksView: BaseView ,UICollectionViewDelegate,UICollectionViewDataSource{


    var bookCollectionView: BaseCollectionView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initViews() {
        var layout = UICollectionViewFlowLayout()
        self.bookCollectionView = BaseCollectionView(frame: CGRectMake(0, 64, k_SCREEN_WIDE, k_SCREEN_HEIGHT-64), collectionViewLayout: layout)
        self.bookCollectionView?.delegate = self
        self.bookCollectionView?.dataSource = self
        self.bookCollectionView?.registerClass(ELBooksCollectionCell.self, forCellWithReuseIdentifier: k_BookCellID)
        self.addSubview(bookCollectionView!)
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(k_BookCellID, forIndexPath: indexPath)
        cell.backgroundColor = colorrandom()
        return cell
    }
}
