//
//  BaseViewController.swift
//  SWEasyLife
//
//  Created by occ on 16/7/17.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        
        // MARK : 取的是对应控制器上的图片
        /*
         if self.tabBarItem != nil {
         
         let unSelectImage = self.tabBarItem.image?.imageWithRenderingMode(.AlwaysOriginal)
         self.tabBarItem.image = unSelectImage
         
         let image = self.tabBarItem.selectedImage?.imageWithRenderingMode(.AlwaysOriginal)
         self.tabBarItem.selectedImage = image
         
         
         self.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: .Selected)
         self.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor()], forState: .Normal)
         
         }
         */
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
