//
//  MainCategoryCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/17.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class MainCategoryCtrl: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let categoryView = ELMainCategoryView(frame: CGRectMake(0,64,k_SCREEN_WIDE,k_SCREEN_HEIGHT-49-64))
        self.view.addSubview(categoryView)
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
