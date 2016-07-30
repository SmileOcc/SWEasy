//
//  ELBannerView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/23.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELBannerView: BaseView {


    var storeImageDatas: NSArray?
    var imageDatas: NSArray {
        set {
            storeImageDatas = newValue
            if storeImageDatas != nil {
                initDatas(storeImageDatas!)
            }
        }
        get {
            return self.storeImageDatas!
        }
    }
    
    
    var scrollView: BaseScrollView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func initViews() {
        
        self.scrollView = BaseScrollView(frame: self.bounds)
        self.scrollView?.pagingEnabled = true
        
        self.addSubview(scrollView!)
    }
    
    func initDatas(datas: NSArray) {
        
        let subs = self.scrollView?.subviews
        if subs?.count > 0 {            
            for item in subs! {
                item.removeFromSuperview()
            }
        }
        
//        self.scrollView?.contentSize = CGSizeMake(k_SCREEN_WIDE * CGFloat(datas.count), 0)
//        datas.enumerateObjectsUsingBlock { (obj, index, stop) in
//            let adver = obj as! HomeAdverModel
//            let imgView = BaseImageView(frame: CGRectMake(CGFloat(index) * k_SCREEN_WIDE, 0, k_SCREEN_WIDE, CGRectGetHeight(self.frame)))
//            imgView.image = UIImage(named: adver.imgPath as! String)
//            self.scrollView?.addSubview(imgView)
//        }
    }
    
}
