//
//  ELBookCollectionCell.swift
//  SWEasyLife
//
//  Created by occ on 16/7/27.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELBookCollectionCell: BaseCollectionCell {


    var textLabel: UILabel?
    var imageView: UIImageView?
    
    var book: ELBookModel?
    var isRightPage: Bool = false
    var shadowLayer: CAGradientLayer = CAGradientLayer()

    override var bounds: CGRect {
        didSet {
            shadowLayer.frame = bounds
        }
    }

    var image: UIImage? {
        didSet {
            
            if imageView == nil {
                imageView = UIImageView(frame: CGRectZero)
                self.contentView.addSubview(imageView!)
            }
            imageView!.image = image!.imageByScalingAndCroppingForSize(bounds.size).imageWithRoundedCornersSize(20, corners:isRightPage ? [UIRectCorner.TopRight, UIRectCorner.BottomRight ]: [UIRectCorner.TopLeft, UIRectCorner.BottomLeft])
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textLabel = UILabel(frame: CGRectZero)
        self.contentView.addSubview(textLabel!)
        
        imageView = UIImageView(frame: CGRectZero)
        self.contentView.addSubview(imageView!)
        
        setupAntialiasing()
        initShadowLayer()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        textLabel?.frame = CGRectMake(40, 150 , 50, 50)
        textLabel?.backgroundColor = UIColor.redColor()
        self.imageView!.frame = CGRectMake(10, 10, self.bounds.size.width - 20, self.bounds.size.height - 20)
    }

    
    func setupAntialiasing() {
        layer.allowsEdgeAntialiasing = true
        imageView!.layer.allowsEdgeAntialiasing = true
    }
    
    func initShadowLayer() {
        let shadowLayer = CAGradientLayer()
        
        shadowLayer.frame = bounds
        shadowLayer.startPoint = CGPointMake(0, 0.5)
        shadowLayer.endPoint = CGPointMake(1, 0.5)
        
        self.imageView!.layer.addSublayer(shadowLayer)
        self.shadowLayer = shadowLayer
    }

    
    func getRatioFromTransform() -> CGFloat {
        var ratio: CGFloat = 0
        
        let rotationY = CGFloat(layer.valueForKeyPath("transform.rotation.y")!.floatValue!)
        if !isRightPage {
            let progress = -(1 - rotationY / CGFloat(M_PI_2))
            ratio = progress
        }
            
        else {
            let progress = 1 - rotationY / CGFloat(-M_PI_2)
            ratio = progress
        }
        
        return ratio
    }
    
    func updateShadowLayer(animated: Bool = false) {
        
        // Get ratio from transform. Check BookCollectionViewLayout for more details
        let inverseRatio = 1 - abs(getRatioFromTransform())
        
        if !animated {
            CATransaction.begin()
            CATransaction.setDisableActions(!animated)
        }
        
        if isRightPage {
            // Right page
            shadowLayer.colors = NSArray(objects:
                UIColor.darkGrayColor().colorWithAlphaComponent(inverseRatio * 0.45).CGColor,
                                         UIColor.darkGrayColor().colorWithAlphaComponent(inverseRatio * 0.40).CGColor,
                                         UIColor.darkGrayColor().colorWithAlphaComponent(inverseRatio * 0.55).CGColor
                ) as! [UIColor]
            shadowLayer.locations = NSArray(objects:
                NSNumber(float: 0.00),
                                            NSNumber(float: 0.02),
                                            NSNumber(float: 1.00)
                ) as? [NSNumber]
        } else {
            // Left page
            shadowLayer.colors = NSArray(objects:
                UIColor.darkGrayColor().colorWithAlphaComponent(inverseRatio * 0.30).CGColor,
                                         UIColor.darkGrayColor().colorWithAlphaComponent(inverseRatio * 0.40).CGColor,
                                         UIColor.darkGrayColor().colorWithAlphaComponent(inverseRatio * 0.50).CGColor,
                                         UIColor.darkGrayColor().colorWithAlphaComponent(inverseRatio * 0.55).CGColor
                ) as! [UIColor]
            shadowLayer.locations = NSArray(objects:
                NSNumber(float: 0.00),
                                            NSNumber(float: 0.50),
                                            NSNumber(float: 0.98),
                                            NSNumber(float: 1.00)
                ) as? [NSNumber]
        }
        
        if !animated {
            CATransaction.commit()
        }
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        if layoutAttributes.indexPath.item % 2 == 0 {
            // The book's spine is on the left of the page
            layer.anchorPoint = CGPointMake(0, 0.5)
            isRightPage = true
        } else {
            // The book's spine is on the right of the page
            layer.anchorPoint = CGPointMake(1, 0.5)
            isRightPage = false
        }
        
        self.updateShadowLayer()
    }

    

    
}
