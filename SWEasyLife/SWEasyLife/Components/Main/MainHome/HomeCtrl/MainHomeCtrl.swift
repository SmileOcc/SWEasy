//
//  MainHomeCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/17.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class MainHomeCtrl: BaseViewController {

    var _homeView : ELMainHomeView!
    var _homeDatas : NSDictionary?
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
        
        let homeDataPath = NSBundle.mainBundle().pathForResource("Home", ofType: "plist")
        _homeDatas = NSDictionary(contentsOfFile: homeDataPath!)
        print(_homeDatas)
        
        refreshInitView()
    }
    
    func initMainView() {
        
        _homeView = ELMainHomeView(frame: CGRectMake(0, 64, k_SCREEN_WIDE, k_SCREEN_HEIGHT - 49 - 64))        
        // MARK: occ测试 set get方法
        print(_homeView.testSET_GET)
        _homeView.testSET_GET = 10
        print(_homeView.testSET_GET)

        print(_homeView.testSET_GET2)
        _homeView.testSET_GET2 = "test22"
        print(_homeView.testSET_GET2)
        
        self.view.addSubview(_homeView)
        
    }
    
    func refreshInitView() {
        
        if (_homeDatas != nil) {
            _homeView.homeDatas = _homeDatas
            //print(_homeView.homeDatas)
        }
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
