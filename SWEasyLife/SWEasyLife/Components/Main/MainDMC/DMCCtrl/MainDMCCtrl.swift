//
//  MainDMCCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/17.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class MainDMCCtrl: BaseViewController {

    var mainDMCView : ELMainDMCView?
    override func viewDidLoad() {
        super.viewDidLoad()

        initMainView()
        initDatas()
        
    }

    
    func initMainView() {
        self.mainDMCView = ELMainDMCView(frame: CGRectMake(0,64,k_SCREEN_WIDE,k_SCREEN_HEIGHT - 64 - 49))
        self.view.addSubview(mainDMCView!)
    }
    
    
    lazy var imageArray: [String] = {
        var array: [String] = []
        
        for i in 1...20 {
            array.append("\(i).jpg")
        }
        
        return array
    }()
    func initDatas() {
        
        mainDMCView?.imageDatas = self.imageArray
        mainDMCView?.imageDatas2 = self.imageArray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
