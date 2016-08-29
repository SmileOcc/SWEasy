//
//  ExtensionView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/27.
//  Copyright © 2016年 ox. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    //获取控制器
    func viewController() -> UIViewController? {
        var next = self.nextResponder()
        repeat {
            //判断是否为视图控制器
            if let tempNext = next {
                if tempNext.isKindOfClass(UIViewController) {
                    return tempNext as? UIViewController
                }
                next = tempNext.nextResponder()
            }
        } while next != nil
        return nil
    }
    
    //获取UITableViewCell
    func tableViewwCell() -> UITableViewCell? {
        var next = self.nextResponder()
        repeat {
            //判断是否为视图控制器
            if next!.isKindOfClass(UITableViewCell) {
                return next as? UITableViewCell
            }
            next = next?.nextResponder()
            
        } while next != nil
        return nil
    }
    
    //获取UICollectionViewCell
    func collectionCell() -> UICollectionViewCell? {
        var next = self.nextResponder()
        repeat {
            //判断是否为视图控制器
            if next!.isKindOfClass(UICollectionViewCell) {
                return next as? UICollectionViewCell
            }
            next = next?.nextResponder()
            
        } while next != nil
        return nil
    }
    
}
