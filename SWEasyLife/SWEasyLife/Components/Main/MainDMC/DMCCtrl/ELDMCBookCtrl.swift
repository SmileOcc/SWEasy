//
//  ELDMCBookCtrl.swift
//  SWEasyLife
//
//  Created by occ on 16/7/27.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELDMCBookCtrl: BaseViewController,UICollectionViewDelegate {

    var book: ELBookModel? {
        didSet {
            bookCollectionView?.reloadData()
        }
    }
    
    var bookCollectionView: BaseCollectionView?


    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = ELBookLayout()

        self.bookCollectionView = BaseCollectionView(frame: CGRectMake(0, 64, k_SCREEN_WIDE, k_SCREEN_HEIGHT-64-49), collectionViewLayout: layout)
        self.bookCollectionView?.backgroundColor = UIColor.whiteColor()
        self.bookCollectionView?.delegate = self
        self.bookCollectionView?.dataSource = self
        self.bookCollectionView?.registerClass(ELBookCollectionCell.self, forCellWithReuseIdentifier:"BookPageCell")
        self.view.addSubview(bookCollectionView!)

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


extension ELDMCBookCtrl: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let book = book {
            return book.numberOfPages() + 1
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BookPageCell", forIndexPath: indexPath) as! ELBookCollectionCell
        
        if indexPath.row == 0 {
            // Cover page
            cell.textLabel!.text = nil
            cell.image = book?.coverImage()
        }
            
        else {
            // Page with index: indexPath.row - 1
            cell.textLabel!.text = "\(indexPath.row)"
            cell.image = book?.pageImage(indexPath.row - 1)
        }
        
        return cell
    }
    
}
