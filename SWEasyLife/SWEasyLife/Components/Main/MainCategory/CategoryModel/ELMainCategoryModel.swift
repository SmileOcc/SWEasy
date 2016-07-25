//
//  ELMainCategoryModel.swift
//  SWEasyLife
//
//  Created by occ on 16/7/20.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit


/*
 // 1
 class TheOneAndOnlyKraken {
 class var sharedInstance: TheOneAndOnlyKraken {
 struct Static {
 static let instance = TheOneAndOnlyKraken()
 }
 return Static.instance
 }
 }
 
 // 2
 private let sharedKraken = TheOneAndOnlyKraken()
 class TheOneAndOnlyKraken {
 class var sharedInstance: TheOneAndOnlyKraken {
 return sharedKraken
 }
 }
 */


// Apple的Framework传道者，善意地提醒我：必须保证init方法的私有性，只有这样，才能保证单例是真正唯一的，避免外部对象通过访问init方法创建单例类的其他实例。由于Swift中的所有对象都是由公共的初始化方法创建的，我们需要重写自己的init方法，并设置其为私有的。这很简单，而且不会破坏到我们优雅的单行单例方法。
//这样做就可以保证编译器在某个类尝试使用()来初始化TheOneAndOnlyKraken时，抛出错误：This prevents others from using the default '()' initializer for this class.

class ELMainCategoryModel: BaseModel {
    
    var categoryModels: NSMutableArray = NSMutableArray()
    static let sharedInstance = ELMainCategoryModel()
    private override init() {} //error:This prevents others from using the default '()' initializer for this class.

    
    //MARK: datas
    func categoryDatas() -> NSMutableArray {
        
        return categoryModels
    }

}
