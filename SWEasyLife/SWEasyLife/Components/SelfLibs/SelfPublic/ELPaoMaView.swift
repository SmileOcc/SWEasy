//
//  ELPaoMaView.swift
//  SWEasyLife
//
//  Created by occ on 16/8/30.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELPaoMaView: BaseView {

    //左侧label的frame
    var currentFrame: CGRect?
    
    //右侧label的frame
    var behindFrame: CGRect?
    
    //存放左右label的数组
    var labelArray = NSMutableArray()
    
    //label的高度
    var labelHeight: CGFloat?
    
    //是否为暂停状态
    var isStop: Bool?
    
    //单次循环的时间
    var time: NSInteger = 0
    
    //展示的内容视图
    var showContentView: UIView?
    
    required init(frame:CGRect, title:NSString) {
        super.init(frame: frame)
        
        self.showContentView = UIView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        self.showContentView?.clipsToBounds = true
        
        labelHeight = frame.size.height
        
        //循环的时间这里取的是4 此数越大速度越快
        time = title.length / 4
        
        let firstLab = UILabel()
        
        
        //计算文本的宽度
        let calcuWidth = self.sizeForTextString(string: title, height: labelHeight!, fontSize: 16.0)
        
        //这两个frame很重要 分别记录的是左右两个label的frame 而且后面也会需要到这两个frame
        self.currentFrame = CGRectMake(0, 0, calcuWidth, labelHeight!)
        behindFrame = CGRectMake(currentFrame!.origin.x + currentFrame!.size.width, 0, calcuWidth, labelHeight!)
        
        firstLab.frame = currentFrame!
        
        self.showContentView?.addSubview(firstLab)
        self.labelArray.addObject(firstLab)
        
        //如果文本的宽度大于视图的宽度才开始跑
        if calcuWidth > frame.size.width {
            
            let secondLab = UILabel()
            secondLab.frame = self.behindFrame!
            
            self.labelArray.addObject(secondLab)
            self.showContentView?.addSubview(secondLab)
            
            self.doAnimation()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    // Mark -
    
    func doAnimation() {
        
        UIView.animateWithDuration(Double(self.time), delay: 0, options: .CurveLinear, animations: {
            
            //让两个label向左平移
            if self.labelArray.count > 0 {
                let labelOne = self.labelArray[0] as! UILabel
                labelOne.transform = CGAffineTransformMakeTranslation(-self.currentFrame!.size.width, 0)
            }
            
            if self.labelArray.count > 1 {
                let labelTwo = self.labelArray[1] as! UILabel
                labelTwo.transform = CGAffineTransformMakeTranslation(-self.currentFrame!.size.width, 0)
            }
            
        }) { (finished) in
            
            
            //两个label水平相邻摆放 内容一样 label1为初始时展示的 label2位于界面的右侧，未显示出来
            //当完成动画时，即第一个label在界面中消失，第二个label位于第一个label的起始位置时，把第一个label放置到第二个label的初始位置
            
            if self.labelArray.count > 0 {
                let labelOne = self.labelArray[0] as! UILabel
                labelOne.transform = CGAffineTransformIdentity
                
                if self.labelArray.count > 1 {
                    self.labelArray.replaceObjectAtIndex(1, withObject:labelOne)
                }
            }
            
            if self.labelArray.count > 1 {
                let labelTwo = self.labelArray[1] as! UILabel
                labelTwo.transform = CGAffineTransformIdentity
                
                if self.labelArray.count > 1 {
                    self.labelArray.replaceObjectAtIndex(0, withObject:labelTwo)
                }
            }
            
            //在数组中将第一个label放置到右侧，第二个label放置到左侧（因为此时展示的就是labelTwo）

            //递归
            self.doAnimation()
        }
        
    }
    
    func start (isStart:Bool) {
        
        if self.labelArray.count > 0 {
            let labelOne = self.labelArray[0] as! UILabel
            isStart ?  self.resumeLayer(labelOne.layer) : self.pauseLayer(labelOne.layer)
        }
        
        if self.labelArray.count > 1 {
            let labelTwo = self.labelArray[1] as! UILabel
            isStart ?  self.resumeLayer(labelTwo.layer) : self.pauseLayer(labelTwo.layer)
        }
        
        self.isStop = isStart ? false : true
    }
    
    
    //暂停动画
    func pauseLayer(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }
    
    //恢复动画
    func resumeLayer(layer: CALayer) {
        
        if self.isStop! {
            let pauseTime = layer.timeOffset
            layer.speed = 1.0
            layer.timeOffset = 0.0
            layer.beginTime = 0.0
            
            let timeSincePause = layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pauseTime
            
            layer.beginTime = timeSincePause
        }
    }
    
    func sizeForTextString(string tStr:NSString, height tHeight:CGFloat, fontSize tSize:CGFloat) -> CGFloat {
        let dict = [NSFontAttributeName:UIFont.systemFontOfSize(tSize)]
//        let options : NSStringDrawingOptions = .UsesLineFragmentOrigin | .UsesFontLeading

        let rect = tStr.boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), tHeight), options:.UsesFontLeading, attributes: dict, context: nil)
        
        return rect.size.width + 5
    }
}
