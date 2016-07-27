//
//  ELDMCBooksView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/26.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

let k_BookCellID = "BookCellID"

class ELDMCBooksView: BaseView ,UICollectionViewDelegate,UICollectionViewDataSource{


    var bookCollectionView: BaseCollectionView?
    
    var books: Array<ELBookModel>?{
        didSet {
            bookCollectionView?.reloadData()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initViews() {
        let layout = ELBooksLayout()
//        layout.itemSize.width = k_SCREEN_WIDE
//        layout.itemSize.height = k_SCREEN_HEIGHT-64-49
//        layout.scrollDirection = .Horizontal
        self.bookCollectionView = BaseCollectionView(frame: CGRectMake(0, 64, k_SCREEN_WIDE, k_SCREEN_HEIGHT-64-49), collectionViewLayout: layout)
        self.bookCollectionView?.backgroundColor = UIColor.whiteColor()
        self.bookCollectionView?.delegate = self
        self.bookCollectionView?.dataSource = self
        self.bookCollectionView?.registerClass(ELBooksCollectionCell.self, forCellWithReuseIdentifier: k_BookCellID)
        self.addSubview(bookCollectionView!)
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let books = books {
            return books.count
        }
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(k_BookCellID, forIndexPath: indexPath) as! ELBooksCollectionCell
        cell.backgroundColor = colorRandom()
        cell.book = books?[indexPath.row]

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if books?.count > indexPath.row {
            let book = books?[indexPath.row]
            openBook(book)

        }
    }
    
    // MARK: action
    
    func openBook(book: ELBookModel?) {
        //
        let vc = ELDMCBookCtrl()
        vc.book = selectedCell()?.book
        // UICollectionView loads it's cells on a background thread, so make sure it's loaded before passing it to the animation handler
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.viewController()!.navigationController?.pushViewController(vc, animated: true)
            return
        })
    }
    
    func selectedCell() -> ELBooksCollectionCell? {
        if let indexPath = self.bookCollectionView?.indexPathForItemAtPoint(CGPointMake(self.bookCollectionView!.contentOffset.x + self.bookCollectionView!.bounds.width / 2, self.bookCollectionView!.bounds.height / 2)) {
            if let cell = self.bookCollectionView?.cellForItemAtIndexPath(indexPath) as? ELBooksCollectionCell {
                return cell
            }
        }
        return nil
    }


}
