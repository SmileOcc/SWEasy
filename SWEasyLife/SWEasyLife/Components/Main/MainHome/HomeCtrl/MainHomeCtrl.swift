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

        // Do any additional setup after loading the view.
        
        initView()
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
    
    func initView() {
        
        _homeView = ELMainHomeView(frame: CGRectMake(0, 64, k_SCREEN_WIDE, k_SCREEN_HEIGHT - 49 - 64))
        _homeView.backgroundColor = k_COLORRANDOM
        self.view.addSubview(_homeView)
        
    }
    
    func refreshInitView() {
        
        if (_homeDatas != nil) {
            _homeView.homeDatas = _homeDatas
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
