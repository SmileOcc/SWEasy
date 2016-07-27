//
//  ELBooksCollectionCell.swift
//  SWEasyLife
//
//  Created by occ on 16/7/26.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELBooksCollectionCell: BaseCollectionCell {

    var imageView: UIImageView?
    
    var book: ELBookModel? {
        didSet {
            if ((book?.coverImage()) != nil) {
                image = book?.coverImage()
            }
        }
    }
    
    var image: UIImage? {
        didSet {
            
            if (imageView == nil) {
            }
            self.imageView!.image = image!.imageByScalingAndCroppingForSize(bounds.size).imageWithRoundedCornersSize(40, corners: [UIRectCorner.TopRight,UIRectCorner.BottomRight])
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = UIImageView(frame: CGRectZero)
        self.contentView.addSubview(imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        self.imageView!.frame = CGRectMake(50, 20, self.bounds.size.width - 100, self.bounds.size.height - 40)
    }

}
