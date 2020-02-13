//
//  BackgroundGradient.swift
//  RADCompanionApp
//
//  Created by Beyond Help on 2020-02-12.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit
import SnapKit

class UIGradient : UIView
{
    private var gradient: CAGradientLayer?
    
    var from: [CGColor]
    var to: [CGColor]
    
    init(_ from: [CGColor] = [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)], _ to: [CGColor] = [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]) {
        self.from = from
        self.to = to
        
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        gradient = CAGradientLayer()
        gradient!.type = .axial
        gradient!.startPoint = CGPoint(x: 10, y: 10)
        gradient!.endPoint = CGPoint(x: 20, y: 20)
        gradient!.colors = primaryDark
        gradient!.add(MakeAnim.MakeGradientColorAnim(colors: primaryLight), forKey: "colorKeyframeAnim")
        
        layer.addSublayer(gradient!)
    }
    
    func SetSize(_ size: CGRect)
    {
        gradient!.frame = size;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
