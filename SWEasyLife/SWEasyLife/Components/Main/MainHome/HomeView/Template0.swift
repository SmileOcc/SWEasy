//
//  Template0.swift
//  SWEasyLife
//
//  Created by occ on 16/7/24.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit


class Template0: TemplateBase {


    var datas: NSMutableArray? = NSMutableArray()
    
    var scrollView: BaseScrollView?

    var bannerViewH: CGFloat = 160

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.redColor().CGColor
        self.layer.borderWidth = 2
        k_TemplateH = 160.0;
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = CGRectMake(0, 0, k_SCREEN_WIDE, k_TemplateH)
        self.scrollView?.frame = CGRectMake(0,0,k_SCREEN_WIDE,bannerViewH)
        initDatas(self.adverModel?.advers)
    }
    
    // MARK: initView
    override func initViews() {
        self.backgroundColor = UIColor.redColor()

        self.scrollView = BaseScrollView(frame: CGRectMake(0,0,k_SCREEN_WIDE,bannerViewH))
        self.scrollView?.pagingEnabled = true
        
        self.addSubview(scrollView!)
        
    }
    
    func initDatas(datas: NSArray?) {
    
        if datas?.count > 0 {
            let subs = self.scrollView?.subviews
            if subs?.count > 0 {
                for item in subs! {
                    item.removeFromSuperview()
                }
            }

        }
        
        self.scrollView?.contentSize = CGSizeMake(k_SCREEN_WIDE * CGFloat(datas!.count), bannerViewH)
        datas!.enumerateObjectsUsingBlock { (obj, index, stop) in
            let adver = obj as! advModel
            let imgView = BaseImageView(frame: CGRectMake(CGFloat(index) * k_SCREEN_WIDE, 0, k_SCREEN_WIDE, CGRectGetHeight(self.frame)))
            imgView.image = UIImage(named: adver.imgPath as! String)
            self.scrollView?.addSubview(imgView)
        }
    }

}
