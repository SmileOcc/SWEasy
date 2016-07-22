//
//  ELMainHomeView.swift
//  SWEasyLife
//
//  Created by occ on 16/7/20.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELMainHomeView: BaseView {

    // 定义两个变量。第一个用来做计算属性，并不存放具体的值，第二个才是存储属性。在计算属性中的setter里给存储属性赋值，
    var storeHomeDatas : NSDictionary?
    var homeDatas : NSDictionary? {
        set {
            storeHomeDatas = newValue
        }
        get {
            return self.storeHomeDatas!
        }
    }
    
    
    // willSet在设置新的值之前调用
    // didSet在新的值被设置之后立即调用
    //MARK: test
    var testSET_GET:Int = 2 {
        willSet(newTestSet_Get){
            print("About to set New: \(newTestSet_Get)")
        }
        didSet {
            if testSET_GET != oldValue {
                print("Added \(testSET_GET - oldValue)\n")

            }
        }
    }
    
    var testSET_GET2 : NSString = "set_two" {
        willSet {
            print("About to set New: \(newValue)")

        }
        didSet {
            print("About to set Old: \(oldValue)  New: \(testSET_GET2)")
        }
    }
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
