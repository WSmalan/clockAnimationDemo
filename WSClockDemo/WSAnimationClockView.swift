//
//  WSAnimationClockView.swift
//  WSClockDemo
//
//  Created by SongLan on 2017/3/9.
//  Copyright © 2017年 Asong. All rights reserved.
//

import UIKit

class WSAnimationClockView: UIView {

    var hourLayer : CALayer?//小时
    var minuteLayer : CALayer?//分钟
    var secondLayer : CALayer?//秒
    override init(frame: CGRect) {
        super.init(frame: frame)
        let image : UIImage = UIImage(named: "clockImage.png")!
        self.layer.contents = image.cgImage
        
        hourLayer = layerWithBackgroundColor(color: UIColor.black, size: CGSize(width: 3, height: self.frame.size.width / 2 - 40))
        
        minuteLayer = layerWithBackgroundColor(color: UIColor.black, size: CGSize(width: 3, height: self.frame.size.width / 2 - 20))
        
        secondLayer = layerWithBackgroundColor(color: UIColor.red, size: CGSize(width: 1, height: self.frame.size.width / 2 - 20))
        self.secondLayer?.cornerRadius = 0
        configUI()
    }
    
    func configUI(){
        let calender = NSCalendar.current
        let hourDate = calender.component(Calendar.Component.hour, from: Date())
        let minuteDate = calender.component(Calendar.Component.minute, from: Date())
        let secondDate = calender.component(Calendar.Component.second, from: Date())
    
        let perHourMove : Float = 1.0 / 12.0 * 360.0
        let hourAngle : Float = Float(hourDate) * perHourMove + Float(minuteDate) * (1.0 / 60.0) * perHourMove + Float(secondDate) * (1.0 / 360.0 ) * perHourMove//小时的角度
        
        let minuteAngle : Float = Float(minuteDate) / 60.0 * 360.0//分钟的角度
        
        let secondAngle : Float = Float(secondDate) / 60.0 * 360.0//秒钟的角度
    
        //让其旋转到当前的位置
      
        self.hourLayer?.transform = CATransform3DMakeRotation(CGFloat(hourAngle/180.0 * Float(M_PI)), 0, 0, 1)
        
        self.minuteLayer?.transform = CATransform3DMakeRotation(CGFloat(minuteAngle/180.0 * Float(M_PI)), 0, 0, 1)
        self.secondLayer?.transform = CATransform3DMakeRotation(CGFloat(secondAngle/180.0 * Float(M_PI)), 0, 0, 1)
        
        
        self.addHourAnimationWithAngle(angle: hourAngle)
        
        self.addMinuteAnimationWithAngle(angle: minuteAngle)
        
        
        self.addSecondAnimationWithAngle(angle: secondAngle)

    
    }
    
    func addHourAnimationWithAngle(angle : Float){
        let animation =  CABasicAnimation(keyPath: "transform")
        animation.repeatCount = Float(NSNotFound)
        animation.duration = CFTimeInterval(60 * 60 * 60 * 12)
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = angle * Float(M_PI) / 180.0
        animation.byValue = 2.0 * Float(M_PI)
        self.hourLayer?.add(animation, forKey: "xiaoshi")
    }

    func addMinuteAnimationWithAngle(angle : Float){
        
        let animation =  CABasicAnimation(keyPath: "transform.rotation.z")
        animation.repeatCount = Float(NSNotFound)
        animation.duration = CFTimeInterval(60 * 60)
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = angle * Float(M_PI) / 180.0
        animation.byValue = 2.0 * Float(M_PI)
        self.minuteLayer?.add(animation, forKey: "fenzhong")
    }
    
    func addSecondAnimationWithAngle(angle : Float){
        let animation =  CABasicAnimation(keyPath: "transform.rotation.z")
        animation.repeatCount = Float(NSNotFound)
        animation.duration = CFTimeInterval(60)
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = angle * Float(M_PI) / 180.0
        animation.byValue = 2.0 * Float(M_PI)
        self.secondLayer?.add(animation, forKey: "miaozhong")
    }
    
    
    func layerWithBackgroundColor(color : UIColor , size : CGSize) -> CALayer{
        let layer = CALayer()
        layer.backgroundColor = color.cgColor
        layer.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        layer.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        //关键
        layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        layer.cornerRadius = 5
        self.layer.addSublayer(layer)
        return layer
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
