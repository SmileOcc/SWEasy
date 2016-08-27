//
//  ELBookLayout.swift
//  SWEasyLife
//
//  Created by occ on 16/7/27.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

private let PageWidth: CGFloat = k_SCREEN_WIDE - 100
private let PageHeight: CGFloat = k_SCREEN_HEIGHT - 64 - 49 - 80


class ELBookLayout: BaseCollectionViewFlowLayout {

    var numberOfItems = 0

    override func prepareLayout() {
        super.prepareLayout()
        collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        numberOfItems = collectionView!.numberOfItemsInSection(0)
        collectionView?.pagingEnabled = true
    }

    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake((CGFloat(numberOfItems / 2)) * collectionView!.bounds.width, collectionView!.bounds.height)
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var array: [UICollectionViewLayoutAttributes] = []
        for i in 0 ... max(0, numberOfItems - 1) {
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            
            // 注意一下 attributes 是否存在
            let attributes: UICollectionViewLayoutAttributes? = layoutAttributesForItemAtIndexPath(indexPath)
            if attributes != nil {
                array += [attributes!]
            }
        }
        return array
    }

    
    //MARK: attribute logic helpers
    func getFrame(collectionView: UICollectionView) -> CGRect {
        var frame = CGRect()
        
        frame.origin.x = (collectionView.bounds.width / 2) - (PageWidth / 2) + collectionView.contentOffset.x
        frame.origin.y = (collectionViewContentSize().height - PageHeight) / 2
        frame.size.width = PageWidth
        frame.size.height = PageHeight
        
        return frame
    }

    
    func getRatio(collectionView: UICollectionView, indexPath: NSIndexPath) -> CGFloat {
        
        //this ensures that pages next to each other are sticked together. to form a double sided page.
        let page = CGFloat(indexPath.item - indexPath.item % 2) * 0.5
        
        var ratio: CGFloat = -0.5 + page - (collectionView.contentOffset.x / collectionView.bounds.width)
        
        
        if ratio > 0.5 {
            ratio = 0.5 + 0.1 * (ratio - 0.5)
            
        }
        
        if ratio < -0.5 {
            ratio = -0.5 + 0.1 * (ratio + 0.5)
        }
        
        return ratio
    }

    
    func getAngle(indexPath: NSIndexPath, ratio: CGFloat) -> CGFloat {
        // Set rotation
        var angle: CGFloat = 0
        
        //1
        if indexPath.item % 2 == 0 {
            //2
            // The book's spine is on the left of the page
            angle = (1-ratio) * CGFloat(-M_PI_2)
        }
        //3
        if indexPath.item % 2 == 1 {
            //4
            // The book's spine is on the right of the page
            angle = (1 + ratio) * CGFloat(M_PI_2)
        }
        //5
        // Make sure the odd and even page don't have the exact same angle
        angle += CGFloat(indexPath.row % 2) / 1000
        //6
        return angle
    }
    
    func makePerspectiveTransform() -> CATransform3D {
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -2000;
        return transform;
    }

    func getRotation(indexPath: NSIndexPath, ratio: CGFloat) -> CATransform3D {
        //1
        var transform = makePerspectiveTransform()
        //2
        let angle = getAngle(indexPath, ratio: ratio)
        //3
        transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        return transform
    }

    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        // Create layout attributes object
        let layoutAttributes:UICollectionViewLayoutAttributes? = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        // Set initial frame - align the page's edge to the spine
        let frame = getFrame(collectionView!)
        layoutAttributes!.frame = frame
        
        let ratio = getRatio(collectionView!, indexPath: indexPath)
        
        // Back-face culling - display only front-face pages.
        if ratio > 0 && indexPath.item % 2 == 1
            || ratio < 0 && indexPath.item % 2 == 0 {
            // Make sure the cover is always visible
            if indexPath.row != 0 {
                return nil
            }
        }
        
        // Apply rotation transform
        let rotation = getRotation(indexPath, ratio: min(max(ratio, -1), 1))
        layoutAttributes!.transform3D = rotation
        
        // Make sure the cover is always above page 1 to avoid flickering when closing the book
        if indexPath.row == 0 {
            layoutAttributes!.zIndex = Int.max
        }
        
        return layoutAttributes
    }

}
