//
//  PublicMacro.swift
//  SWEasyLife
//
//  Created by occ on 16/7/20.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit


let k_StoryBoard = UIStoryboard(name: "Main", bundle: nil)

let k_SCREEN_WIDE: CGFloat = UIScreen.mainScreen().bounds.size.width

let k_SCREEN_HEIGHT: CGFloat = UIScreen.mainScreen().bounds.size.height

let k_Scale : CGFloat = (k_SCREEN_WIDE) / (320.0)

let k_PageSize: NSInteger = 20

let k_COLORRANDOM : UIColor = UIColor(red: CGFloat(arc4random()%255) / 255.0, green: CGFloat(arc4random()%255) / 255.0, blue: CGFloat(arc4random()%255) / 255.0, alpha: 1.0)

func colorrandom() -> UIColor {
    return UIColor(red: CGFloat(arc4random()%255) / 255.0, green: CGFloat(arc4random()%255) / 255.0, blue: CGFloat(arc4random()%255) / 255.0, alpha: 1.0)
}

let k_LineOrange : UIColor = UIColor(red: 210 / 255.0, green: 201 / 255.0, blue: 189 / 255.0, alpha: 1.0)

let k_BgColor: UIColor = UIColor(red: 242 / 255.0, green: 242 / 255.0, blue: 242 / 255.0, alpha: 1.0)

//将0X变为#
let k_BgGrayColor: UIColor = ZSJ_Color_Conversion("#f7f7f7")
//
let k_Color_NavBar: UIColor = ZSJ_Color_Conversion("0Xe6e6e6")
//
//let k_titleGrayColor: UIColor = "#535353".colorRGB()
//
//let k_titleOrangColor: UIColor = "#ff8903".colorRGB()
//
//let k_LineGrayColor: UIColor = "#dedede".colorRGB()
//
//let k_titleMainColor: UIColor = "#636363".colorRGB()


let k_MYTICKETLIST_SIZE: NSInteger = 20



func ZSJ_Color_Conversion ( Color_Value:NSString)->UIColor{
    var  Str :NSString = Color_Value.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
    if Color_Value.hasPrefix("#"){
        Str=(Color_Value as NSString).substringFromIndex(1)
    }
    let ZSJ_StrRed = (Str as NSString ).substringToIndex(2)
    let ZSJ_StrGreen = ((Str as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
    let ZSJ_StrBlue = ((Str as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    NSScanner(string:ZSJ_StrRed).scanHexInt(&r)
    NSScanner(string: ZSJ_StrGreen).scanHexInt(&g)
    NSScanner(string: ZSJ_StrBlue).scanHexInt(&b)
    
    print("ddd \(CGFloat(r)) : \(CGFloat(g)) : \(CGFloat(b))")
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
}