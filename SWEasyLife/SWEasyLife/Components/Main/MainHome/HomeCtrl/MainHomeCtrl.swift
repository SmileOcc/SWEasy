//
//  MainHomeCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/17.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class MainHomeCtrl: BaseViewController {

    var homeView : ELMainHomeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMainView()
        initData()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - initData
    func initData() {
        
        let storeAdverModel: HomeStoreAdverModel = HomeStoreAdverModel()
        let homeDataPath = NSBundle.mainBundle().pathForResource("Home", ofType: "plist")
        ELHttpRequest.sharedInstance.requestHomeDatas(url: homeDataPath, parmas: nil) { (isSuccessed, datas, error) in
            if isSuccessed {
                storeAdverModel.initDatas(datas)
                self.homeView.storeAdverModel = storeAdverModel
                self.homeView.layoutView();
            }
        }
        
        refreshInitView()
    }
    
    func initMainView() {
        
        homeView = ELMainHomeView(frame: CGRectMake(0, 64, k_SCREEN_WIDE , k_SCREEN_HEIGHT - 49 - 64))
        // MARK: occ测试 set get方法
        print(homeView.testSET_GET)
        homeView.testSET_GET = 10
        print(homeView.testSET_GET)

        print(homeView.testSET_GET2)
        homeView.testSET_GET2 = "test22"
        print(homeView.testSET_GET2)
        
        self.view.addSubview(homeView)
        
        
    }
    
    
    func refreshInitView() {
        
//        if (_homeDatas != nil) {
//            homeView.homeDatas = _homeDatas
//            //print(homeView.homeDatas)
//        }
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
