//
//  MainTabBarCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/17.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class MainTabBarCtrl: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // MARK : 取的是对应NavigationCtrl上的图片
        for item in self.tabBar.items! as [UITabBarItem] {
            
            let unSelectImage = item.image?.imageWithRenderingMode(.AlwaysOriginal)
            item.image = unSelectImage
            
            let image = item.selectedImage?.imageWithRenderingMode(.AlwaysOriginal)
            item.selectedImage = image
            
            
            item.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: .Selected)
            item.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor()], forState: .Normal)

            //            self.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: .Selected)

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
