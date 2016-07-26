//
//  ELBooksLayout.swift
//  SWEasyLife
//
//  Created by occ on 16/7/26.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

private let PageWidth: CGFloat = 362
private let PageHeight: CGFloat = 568

class ELBooksLayout: UICollectionViewFlowLayout {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        scrollDirection = UICollectionViewScrollDirection.Horizontal
        itemSize = CGSizeMake(PageWidth, PageHeight)
        minimumLineSpacing = 10
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        //1
        collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        
        //2
        collectionView?.contentInset = UIEdgeInsets(
            top: 0,
            left: collectionView!.bounds.width / 2 - PageWidth / 2,
            bottom: 0,
            right: collectionView!.bounds.width / 2 - PageWidth / 2)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //1
        let array = super.layoutAttributesForElementsInRect(rect)
        
        for attributes in array! {
            let frame = attributes.frame
            let distance = abs(collectionView!.contentOffset.x + collectionView!.contentInset.left - frame.origin.x)
            let scale = 0.7 * min(max(1 - distance / (collectionView!.bounds.width), 0.75), 1)
            attributes.transform = CGAffineTransformMakeScale(scale, scale)
        }
        return array
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var newOffset = CGPoint()
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        let width = layout.itemSize.width + layout.minimumLineSpacing
        var offset = proposedContentOffset.x + collectionView!.contentInset.left
        
        if velocity.x > 0 {
            offset = width * ceil(offset / width)
        }
        
        if velocity.x == 0 {
            offset = width * round(offset / width)
        }
        
        if velocity.x < 0 {
            offset = width * floor(offset / width)
        }
        
        newOffset.x = offset - collectionView!.contentInset.left
        newOffset.y = proposedContentOffset.y
        
        return newOffset
    }
    
    
    
    
    
    
}
