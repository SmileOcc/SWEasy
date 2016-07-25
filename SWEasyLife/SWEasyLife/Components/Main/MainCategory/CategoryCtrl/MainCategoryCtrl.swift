//
//  MainCategoryCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/17.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class MainCategoryCtrl: BaseViewController,MainCategoryViewDelegate {

    var categoryView: ELMainCategoryView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let fontNames = UIFont.familyNames()
        print("---------\(fontNames)")
        initMainViews()
        
        initDatas()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initMainViews() {
        self.categoryView = ELMainCategoryView(frame: CGRectMake(0,64,k_SCREEN_WIDE,k_SCREEN_HEIGHT-49-64))
        self.categoryView?.mainCategoryDelegate = self
        self.view.addSubview(categoryView!)
    }
    
    func initDatas() {

        let path = NSBundle.mainBundle().pathForResource("CategroyFirst", ofType: "plist")
        ELHttpRequest.sharedInstance.requestCategoryFirst(url: path!, parmas: NSDictionary()) { (isSuccessed, datas, error) in
            if isSuccessed {
                
                if datas != nil {
                    if datas?.count > 0 {
                        for i in 0 ..< datas!.count {
                            let dic = datas![i] as? NSDictionary
                            let cateModel = ELCategoryModel()
                            cateModel.initDatas(dic!)
                            ELMainCategoryModel.sharedInstance.categoryModels.addObject(cateModel)
                        }
                        
                        self.categoryView!.updateViews()
                    }
                }

            }
        }
    }
    
    // MARK: MainCategoryViewDelegate
    func mainCategoryView(categoryView: ELMainCategoryView, index: Int) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
