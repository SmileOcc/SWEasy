//
//  ELMainHomeView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/20.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELMainHomeView: BaseView,UITableViewDelegate,UITableViewDataSource{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    var bannerViewH: CGFloat = 160
    
    var storeBannerDatas: NSMutableArray? = NSMutableArray()
    var bannerDatas: NSMutableArray {
        set {
            storeBannerDatas?.removeAllObjects()
            storeBannerDatas?.addObjectsFromArray(newValue as [AnyObject])
            if storeBannerDatas?.count > 0 {
                self.bannerView?.imageDatas = storeBannerDatas!
            }
        }
        get {
            return self.storeBannerDatas!
        }
    }
    
    
    var bannerView : ELBannerView?
    
    var homeTable : ELHomeMainTableView?
    

    // 定义两个变量。第一个用来做计算属性，并不存放具体的值，第二个才是存储属性。在计算属性中的setter里给存储属性赋值，
    var storeHomeDatas : NSArray?
    var homeDatas : NSArray? {
        set {
            storeHomeDatas = newValue
            if (storeHomeDatas != nil) {
                initDatas(storeHomeDatas!)
            }
        }
        get {
            return self.storeHomeDatas!
        }
    }
    
    
    // willSet在设置新的值之前调用
    // didSet在新的值被设置之后立即调用
    //MARK: test
    var testSET_GET:Int = 2 {
        willSet(newTestSet_Get){
            print("About to set New: \(newTestSet_Get)")
        }
        didSet {
            if testSET_GET != oldValue {
                print("Added \(testSET_GET - oldValue)\n")

            }
        }
    }
    
    var testSET_GET2 : NSString = "set_two" {
        willSet {
            print("About to set New: \(newValue)")

        }
        didSet {
            print("About to set Old: \(oldValue)  New: \(testSET_GET2)")
        }
    }
    

    func layoutView() {
        
    }
    
    // MARK: initView
    func initViews() {
      
        self.bannerView = ELBannerView(frame: CGRectMake(0,0,k_SCREEN_WIDE,bannerViewH))
        
        self.homeTable = ELHomeMainTableView(frame: CGRectMake(0, 0, k_SCREEN_WIDE, CGRectGetHeight(self.frame)), style: .Plain)
        self.homeTable?.backgroundColor = UIColor.lightGrayColor()
        self.homeTable!.delegate = self
        self.homeTable!.dataSource = self
        
        self.addSubview(homeTable!)
        
        
        self.homeTable?.tableHeaderView = bannerView
    }
    
    func initDatas(dataDic: NSArray) {
//        print(dataDic)
//        let items = dataDic["items"] as? NSArray
//        
//        if items?.count > 0 {
//            
//            items?.enumerateObjectsUsingBlock({ (obj, index, stop) in
//                let adverts = obj["adverts"] as? NSArray
//                if adverts?.count > 0 && index == 0{
//                    let tempBanners = NSMutableArray()
//
//                    //MARK: occ测试数据
//                    for i in 0 ..< adverts!.count {
//                        let advertDic = adverts![i] as? NSDictionary
//                        let adverModel = HomeAdverModel()
//                        adverModel.initModelData(advertDic)
//                        tempBanners.addObject(adverModel)
//                    }
//                    self.bannerDatas = tempBanners
//                }
//            })
//        }
    }
    
    
    
    
    
    // MARK: table delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("homeCellID")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "homeCellID")
            cell?.backgroundColor = k_COLORRANDOM
        }
        
        cell?.textLabel?.text = "h-h"
        return cell!
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
