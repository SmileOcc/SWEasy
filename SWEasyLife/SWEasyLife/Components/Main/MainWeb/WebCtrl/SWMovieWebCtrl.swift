//
//  SWMovieWebCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/8/28.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class SWMovieWebCtrl: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initViews() {
        let strUrl = NSBundle.mainBundle().pathForResource("Html/html/moview-detail", ofType: "html")
        let url = NSURL(fileURLWithPath: strUrl!)
        let request = NSURLRequest(URL: url)
        
        let movieWebView = SWMovieWebView(frame: CGRectMake(0,64,k_SCREEN_WIDE,k_SCREEN_HEIGHT-64))
        self.view.addSubview(movieWebView)
        
        
        movieWebView.loadRequest(request)
        
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
