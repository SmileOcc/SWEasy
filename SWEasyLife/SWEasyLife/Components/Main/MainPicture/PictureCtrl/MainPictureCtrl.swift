//
//  MainCarCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/17.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class MainPictureCtrl: BaseViewController {

    
    var mainPictureView: ELMainPictureView?
    var listModel: ELMainPictureListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initMainViews()
        
        self.initdatas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initMainViews() {
        
        self.navigationItem.setLeftBarButtonItems(makeNavItems(), animated: true)
        self.navigationItem.setRightBarButtonItems(makeNavRight(), animated: true)
        //self.navigationController?.navigationBar.pushNavigationItem(onMakeNavitem(), animated: true)
        
        mainPictureView = ELMainPictureView(frame: CGRectMake(0,64,k_SCREEN_WIDE,k_SCREEN_HEIGHT-64))
        self.view.addSubview(mainPictureView!)
    }
    
    func initdatas() {
        
        listModel =  ELMainPictureListModel()
        listModel!.resultBlock = { (isSuccessed, datas, error) in
            
            if (isSuccessed && (datas?.isKindOfClass(NSArray))!) {
                print(datas)
                let items = datas as? NSArray

                if items?.count > 0 {
                    
                    let advertsDic = items?[0] as? NSDictionary
                    
                    if advertsDic != nil {
                        
                        let adverts = advertsDic!["adverts"] as? NSArray
                        
                        if adverts != nil {
                            if adverts!.isKindOfClass(NSArray) {
                                if adverts!.count > 0 {
                                    adverts?.enumerateObjectsUsingBlock({ (obj, index, stop) in
                                        
                                        let adverModel = HomeAdverModel()
                                        adverModel.initModelData(obj as? NSDictionary)
                                        self.listModel?.datas.addObject(adverModel)
                                        
                                    })
                                    
                                    if self.mainPictureView != nil {
                                        self.mainPictureView!.pictureListModel = self.listModel
                                    }
                                }
                            }
                        }
                    }
                    
                    
                }

            }
        }
        listModel!.refresh()

    }
    
    
    func onMakeNavitem() -> UINavigationItem {
        let navigationItem = UINavigationItem()
        let leftBtn = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(MainPictureCtrl.onAdd))
        
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(MainPictureCtrl.onRemove))
        
        navigationItem.title = "Picture"
        navigationItem.setLeftBarButtonItem(leftBtn, animated: true)
        navigationItem.setRightBarButtonItem(rightBtn, animated: true)
        return navigationItem
    }
    
    func makeNavItems() -> [UIBarButtonItem] {
        
        let leftBtn = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(MainPictureCtrl.onAdd))

        return [leftBtn]
    }
    
    func makeNavRight() -> [UIBarButtonItem] {
        let rightBtn1 = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: #selector(MainPictureCtrl.onSearch))
        
        let rightBtn2 = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(MainPictureCtrl.onRemove))
        
        
        return [rightBtn1,rightBtn2]

    }
    
    // MARK: - action
    
    func onAdd() {
        print("on add")
        
        let moviewWebCtrl = SWMovieWebCtrl()
        self.navigationController?.pushViewController(moviewWebCtrl, animated: true)
    }
    
    func onRemove() {
        print("on remove")
    }
    
    func onSearch() {
        print("on search")
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
