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
    
    var storeAdverModel: HomeStoreAdverModel?
    
    
    var storeBannerDatas: NSMutableArray? = NSMutableArray()
    var bannerDatas: NSMutableArray {
        set {
            storeBannerDatas?.removeAllObjects()
            storeBannerDatas?.addObjectsFromArray(newValue as [AnyObject])
            if storeBannerDatas?.count > 0 {
//                self.bannerView?.imageDatas = storeBannerDatas!
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
        
        self.homeTable?.frame = CGRectMake(0, 0, k_SCREEN_WIDE, CGRectGetHeight(self.frame))
        self.homeTable?.reloadData()
        
    }
    
    // MARK: initView
    func initViews() {
      
        
        self.homeTable = ELHomeMainTableView(frame: CGRectZero, style: .Plain)
        self.homeTable?.backgroundColor = UIColor.lightGrayColor()
        self.homeTable!.delegate = self
        self.homeTable!.dataSource = self
        
        self.addSubview(homeTable!)
        
    }
    
    
    
    // MARK: table delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (storeAdverModel != nil) ? (storeAdverModel?.adversDatas?.count)! : 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if storeAdverModel != nil {
            if storeAdverModel?.adversDatas?.count > indexPath.row {
                let adverModel: HomeAdverModel = storeAdverModel!.adversDatas![indexPath.row] as! HomeAdverModel
                let templateName = adverModel.templateType as! String
                
                let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String

                let  className: AnyClass = NSClassFromString(nameSpace + "." + templateName)!;
                let templateClass = (className as! TemplateBase.Type).init()
                let templateHeight = templateClass.templateHeight()
                
                return templateHeight

            }
        }
        return 150
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellId = "homeCellID"
        var adverModel: HomeAdverModel?
        
        if storeAdverModel != nil {
            if storeAdverModel?.adversDatas?.count > indexPath.row {
                adverModel = storeAdverModel!.adversDatas![indexPath.row] as? HomeAdverModel
                let templateName = adverModel!.templateType as! String
                cellId = templateName
            }
        }

        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier:cellId)
//            cell?.backgroundColor = colorRandom()
            
            let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
            
            if cellId != "homeCellID" {
                let  className: AnyClass = NSClassFromString(nameSpace + "." + cellId)!;
                
                let templateClass = (className as! TemplateBase.Type).init()
                templateClass.backgroundColor = UIColor.yellowColor()
                
                cell?.contentView.addSubview(templateClass)

            }
        }
        
        if cellId != "homeCellID" {
            let subViews = cell!.contentView.subviews as NSArray
            for subView in subViews {
                if subView is TemplateBase {
                    if adverModel != nil {
                        (subView as! TemplateBase).adverModel = adverModel
                    }
                }
            }
        }
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
