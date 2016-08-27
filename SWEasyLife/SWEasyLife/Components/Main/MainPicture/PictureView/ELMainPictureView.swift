//
//  ELMainCarView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/20.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELMainPictureView: BaseView,UICollectionViewDelegate,UICollectionViewDataSource {

    var pictureListModel: ELMainPictureListModel? {
        didSet{
            if pictureCollectionView != nil {
                pictureCollectionView?.reloadData()
            }
        }
    }
    var pictureCollectionView: BaseCollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        
        let viewLayout = ELPictureCollectionLayout()
        viewLayout.itemSize.height = 230
        viewLayout.itemSize.width = k_SCREEN_WIDE
        
        pictureCollectionView = BaseCollectionView(frame: self.bounds, collectionViewLayout: viewLayout)
        pictureCollectionView!.delegate = self
        pictureCollectionView!.dataSource = self
        self.addSubview(pictureCollectionView!)
        
        pictureCollectionView!.registerClass(ELMainPictureCollectionCell.self, forCellWithReuseIdentifier: "pictureCollectionCellID")
    }
    
    // Mark - set
    
    
    // Mark - delegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.pictureListModel != nil {
            return (self.pictureListModel!.datas.count)
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pictureCollectionCellID", forIndexPath: indexPath)
        cell.backgroundColor = colorRandom()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
    }
    
    
}
