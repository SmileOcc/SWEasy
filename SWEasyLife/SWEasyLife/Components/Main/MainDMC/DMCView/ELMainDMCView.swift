//
//  ELMainDMCView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/20.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

let reuseIdentifier = "collCell"

class ELMainDMCView: BaseView,UICollectionViewDelegate,UICollectionViewDataSource{

    var storeDatas : NSDictionary?
    var dmcDatas : NSDictionary {
        set{
            storeDatas = newValue
            if storeDatas != nil {
                initDatas(storeDatas!)
            }
        }
        get {
            return self.storeDatas!
        }
    }
    
    
    var storeImageDatas: NSArray?
    var imageDatas: NSArray {
        set {
            storeImageDatas = newValue
            if storeImageDatas != nil {
                self.collectionView?.reloadData()
            }
        }
        get {
            return self.storeImageDatas!
        }
    }
    
    
    var collectionView : ELCollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    // MARK: initView
    
    func initViews() {
        
        let layout = LineLayout()
        self.collectionView = ELCollectionView(frame: CGRectMake(0, 0, k_SCREEN_WIDE, 200), collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.registerClass(ImageTextCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.addSubview(collectionView!)
        
        
    }
    
    func initDatas(dataDic: NSDictionary) {
        
    }
    
    
    
    // MARK: collectionView delegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if storeImageDatas != nil {
            return storeImageDatas!.count
        }
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ImageTextCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ImageTextCell
        cell.contentView.backgroundColor = k_COLORRANDOM
        if self.storeImageDatas?.count > indexPath.row {
            
            cell.imageStr = self.storeImageDatas![indexPath.row] as? NSString
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("select : \(indexPath.row)")
    }
    
}


class ImageTextCell: UICollectionViewCell {
    
    var imageView: UIImageView?
    
    var imageStr: NSString? {
        didSet {
            self.imageView!.image = UIImage(named: self.imageStr as! String)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = UIImageView()
        self.addSubview(self.imageView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


class LineLayout: UICollectionViewFlowLayout {
    
    var itemW: CGFloat = 100
    var itemH: CGFloat = 100
    
    lazy var inset: CGFloat = {
        //这样设置，inset就只会被计算一次，减少了prepareLayout的计算步骤
        return(self.collectionView?.bounds.width ?? 0) * 0.5
    }()
    
    override init() {
        super.init()
        
        self.itemSize = CGSizeMake(itemW, itemH)
        self.scrollDirection = .Horizontal
        self.minimumLineSpacing = 0.7 * itemW
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     返回true只要显示的边界发生改变就重新布局:(默认是false)
     内部会重新调用prepareLayout和调用
     layoutAttributesForElementsInRect方法获得部分cell的布局属性
     */
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        print(newBounds)
        return true
    }
    
    /**
     用来计算出rect这个范围内所有cell的UICollectionViewLayoutAttributes，
     并返回。
     */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        //取出rect范围内所有的UICollectionViewLayoutAttributes，然而
        //我们并不关心这个范围内所有的cell的布局，我们做动画是做给人看的，
        //所以我们只需要取出屏幕上可见的那些cell的rect即可
        
        print("layoutAttributesForElementsInRect==\(rect)")
        let array = super.layoutAttributesForElementsInRect(rect)
        
        //可见矩陈
        let visiableRect = CGRectMake(self.collectionView!.contentOffset.x, self.collectionView!.contentOffset.y, self.collectionView!.frame.width, self.collectionView!.frame.height)
        
        //接下来的计算是为了动画效果
        let maxCenterMargin = self.collectionView!.bounds.width * 0.5 + itemW * 0.5
        
        //获得collectionVIew中央的X值(即显示在屏幕中央的X)
        let centerX = self.collectionView!.contentOffset.x + self.collectionView!.frame.size.width * 0.5
        
        for attributes in array! {
            
            //如果不在屏幕上，直接跳过
            if !CGRectIntersectsRect(visiableRect, attributes.frame) {
                continue
            }
            let scale = 1 + (0.8 - abs(centerX - attributes.center.x) / maxCenterMargin)
            attributes.transform = CGAffineTransformMakeScale(scale, scale)
        }
        return array
    }
    
    /**
     用来设置collectionView停止滚动那一刻的位置
     
     - parameter proposedContentOffset: 原本collectionView停止滚动那一刻的位置
     - parameter velocity:              滚动速度
     
     - returns: 最终停留的位置
     */
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint) -> CGPoint {
       
        //实现这个方法的目的是：当停止滑动，时刻有一张图片是位于屏幕最中央的。
        let lastRect = CGRectMake(proposedContentOffset.x, proposedContentOffset.y, self.collectionView!.frame.width, self.collectionView!.frame.height)
        
        //获得collectionVIew中央的X值(即显示在屏幕中央的X)
        let centerX = proposedContentOffset.x + self.collectionView!.frame.width * 0.5
        
        //这个范围内所有的属性
        let array = self.layoutAttributesForElementsInRect(lastRect)
        
        //需要移动的距离
        var adjustOffsetX = CGFloat(MAXFLOAT)
        for attri in array! {
            if abs(attri.center.x - centerX) < abs(adjustOffsetX) {
                adjustOffsetX = attri.center.x - centerX
            }
        }
        
        return CGPointMake(proposedContentOffset.x + adjustOffsetX, proposedContentOffset.y)
        
    }
    override func prepareLayout() {
        //设置边距(让第一张图片与最后一张图片出现在最中央)
        //let inset = (self.collectionView?.bounds.width ?? 0) * 0.5 - self.itemSize.width * 0.5
        self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
    }
}
