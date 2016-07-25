//
//  ELMainCategoryView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/20.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

let k_MainCategoryTableW:CGFloat = 100.0
class ELMainCategoryView: BaseView, UITableViewDelegate, UITableViewDataSource {

    var categoryTable: BaseTableView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateViews() {
        
        if categoryTable != nil {
            categoryTable?.reloadData()
        } else {
            initViews()
        }
    }
    
    func initViews(){
        self.categoryTable = BaseTableView(frame: CGRectMake(0, 0, k_MainCategoryTableW, CGRectGetHeight(self.frame)), style: .Plain)
        self.categoryTable!.delegate = self
        self.categoryTable!.dataSource = self
        self.addSubview(self.categoryTable!)
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = BaseCollectionView(frame: CGRectMake(100, 0, k_SCREEN_WIDE-100, CGRectGetHeight(self.frame)), collectionViewLayout: layout)
        collectionView.backgroundColor = colorrandom()
        self.addSubview(collectionView)
    }
    
    
    
    // MARK: tableView delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ELMainCategoryModel.sharedInstance.categoryModels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cateCellID")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cateCellID")
            cell?.textLabel?.font = UIFont(name: "Heiti SC", size: 11)
        }
        cell?.backgroundColor = colorrandom()
        if ELMainCategoryModel.sharedInstance.categoryModels.count > indexPath.row {
            let model = ELMainCategoryModel.sharedInstance.categoryModels[indexPath.row]
            cell?.textLabel?.text = model.name
        }
        return cell!
    }
    
    

}
