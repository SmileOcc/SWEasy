//
//  UIImage+Helpers.swift
//  RW - Paper
//
//  Created by Attila on 2014. 12. 16..
//  Copyright (c) 2014. -. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageWithRoundedCornersSize(cornerRadius: CGFloat, corners: UIRectCorner) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)
        
        UIBezierPath(roundedRect: CGRectMake(0, 0, self.size.width, self.size.height), byRoundingCorners: corners, cornerRadii: CGSizeMake(cornerRadius, cornerRadius)).addClip()
        drawInRect(CGRectMake(0, 0, self.size.width, self.size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func imageByScalingAndCroppingForSize(targetSize: CGSize) -> UIImage {
        
        let sourceImage = self
        var newImage = UIImage()
        
        var scaleWidth = targetSize.width
        var scaleHeight = targetSize.height
        var thumbnailPoint = CGPointMake(0.0, 0.0)
        
        if CGSizeEqualToSize(sourceImage.size, targetSize) == false {
            let widthFactor = targetSize.width / sourceImage.size.width
            let heightFactor = targetSize.height / sourceImage.size.height
            
            
            if widthFactor > heightFactor {
                scaleHeight = sourceImage.size.height * widthFactor
                thumbnailPoint.y = (targetSize.height - scaleHeight) * 0.5
                
            } else {
                scaleWidth  = sourceImage.size.width * heightFactor
                thumbnailPoint.x = (targetSize.width - scaleWidth) * 0.5
                
            }
        }
        
        UIGraphicsBeginImageContext(targetSize)
        var thumbnailRect = CGRectZero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaleWidth
        thumbnailRect.size.height = scaleHeight
        
        sourceImage.drawInRect(thumbnailRect)
        
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
