//
//  ELDMCBooksCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/26.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELDMCBooksCtrl: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = k_COLORRANDOM
        
        let path = NSBundle.mainBundle().pathForResource("Books", ofType: "plist")
        ELHttpRequest.sharedInstance.requestBooksDatas(url: path!, parmas: nil) { (isSuccessed, datas, error) in
            
            var books: [ELBookModel] = []

            if isSuccessed {
                
                for dict in datas as! [NSDictionary] {
                    let book = ELBookModel(dict: dict)
                    books += [book]
                }
            }
        }
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
