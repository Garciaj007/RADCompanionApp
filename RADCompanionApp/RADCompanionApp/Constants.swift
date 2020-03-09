//
//  Constants.swift
//  RADCompanionApp
//
//  Created by Beyond Help on 2020-02-12.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit
import CoreGraphics

struct RADColor
{
    static let primary: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let secondary: UIColor = #colorLiteral(red: 0.3179988265, green: 0.3179988265, blue: 0.3179988265, alpha: 1)
    static let shadow: UIColor = #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.07058823529, alpha: 0.5)
    static let accents: [UIColor] = [#colorLiteral(red: 1, green: 0.1254901961, blue: 0.431372549, alpha: 1), #colorLiteral(red: 0.3215686275, green: 1, blue: 0.831372549, alpha: 1), #colorLiteral(red: 0.9019607843, green: 1, blue: 0.06274509804, alpha: 1), #colorLiteral(red: 0.4300549756, green: 0, blue: 1, alpha: 1)]
}

extension UIColor
{
    static func lighten(_ color: UIColor, _ percent: Int) -> UIColor
    {
        var hue: CGFloat = 0.0
        var sat: CGFloat = 0.0
        var val: CGFloat = 0.0
        var a  : CGFloat = 0.0
        color.getHue(&hue, saturation: &sat, brightness: &val, alpha: &a)
        return UIColor(hue: hue, saturation: sat, brightness: min(max(val + CGFloat(percent) / 100.0, 0), 1), alpha: a)
    }
    
    func lighten(percent: Int) -> UIColor
    {
        return UIColor.lighten(self, percent)
    }
    
    static func darken(_ color: UIColor, _ percent: Int) -> UIColor
    {
        var hue: CGFloat = 0.0
        var sat: CGFloat = 0.0
        var val: CGFloat = 0.0
        var a  : CGFloat = 0.0
        color.getHue(&hue, saturation: &sat, brightness: &val, alpha: &a)
        return UIColor(hue: hue, saturation: sat, brightness: min(max(val - CGFloat(percent) / 100.0, 0), 1), alpha: a)
    }
    
    func darken(percent: Int) -> UIColor
    {
        return UIColor.darken(self, percent)
    }
}

extension CGFloat
{
    static func deg2Rad(_ number: CGFloat) -> CGFloat
    {
        return number * .pi / 180.0
    }
    
    func deg2Rad() -> CGFloat
    {
        return CGFloat.deg2Rad(self)
    }
}

extension CGPoint
{
    static func random(from: Int = 0, to: Int = 10) -> CGPoint
    {
        return CGPoint(x: Int.random(in: from ... to), y: Int.random(in: from ... to))
    }
    
    static func random(range: CGRect) -> CGPoint
    {
        return CGPoint(x: Int.random(in: Int(range.minX)...Int(range.width)), y: Int.random(in: Int(range.minY)...Int(range.height)))
    }
    
    static func makeRandom(range: CGRect, size: Int) -> [CGPoint]
    {
        var accum: [CGPoint] = [];
        for _ in 0...size
        {
            accum.append(CGPoint.random(range: range))
        }
        return accum
    }
}

extension CGAffineTransform
{
    init(_ freeTransformX: CGFloat = 1.0, _ freeTransformY: CGFloat = 1.0)
    {
        self.init(a: freeTransformX, b: 0, c: 0, d: freeTransformY, tx: 0, ty: 0)
    }
}

class MakeAnim
{
    static func MakeGradientColorAnim(colors: [CGColor]) -> CAAnimation
    {
        let anim = CABasicAnimation(keyPath: "colors")
        anim.toValue = colors
        anim.duration = 20
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        anim.autoreverses = true
        anim.repeatCount = Float.infinity
        return anim;
    }
    
    static func MakeGradientColorAnim(colors: [[CGColor]]) -> CAAnimation
    {
        let anim = CAKeyframeAnimation(keyPath: "colors")
        anim.values = colors
        anim.duration = 20
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        anim.autoreverses = true
        anim.repeatCount = Float.infinity
        return anim;
        
    }
    
    static func MakeGradientLocationAnim(locations: [NSNumber]) -> CAAnimation
    {
        let anim = CABasicAnimation(keyPath: "location")
        anim.fromValue = locations
        anim.toValue = locations.reversed()
        anim.duration = 10
        anim.timingFunction = CAMediaTimingFunction(controlPoints: 1, 0.3, 0, 0.8)
        anim.autoreverses = true
        anim.repeatCount = Float.infinity
        return anim;
    }
    
    static func MakeGradientStartPointAnim(startPoints: [CGPoint]) -> CAAnimation
    {
        let anim = CAKeyframeAnimation(keyPath: "startPoint")
        anim.values = startPoints
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        anim.duration = 20
        anim.autoreverses = true
        anim.repeatCount = Float.infinity
        return anim
    }
    
    static func MakeGradientEndPointAnim(endPoints: [CGPoint]) -> CAAnimation
    {
        let anim = CAKeyframeAnimation(keyPath: "endPoint")
        anim.values = endPoints
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        anim.duration = 20
        anim.autoreverses = true
        anim.repeatCount = Float.infinity
        return anim
    }
}
