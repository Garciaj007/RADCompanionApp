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
    
    init(_ colors: [CGColor] = [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 0.3179988265, green: 0.3179988265, blue: 0.3179988265, alpha: 1)], type: CAGradientLayerType = .axial) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        gradient = CAGradientLayer()
        gradient!.type = type
        gradient!.startPoint = CGPoint.random()
        gradient!.endPoint = CGPoint.random()
        gradient!.colors = colors
        
        layer.addSublayer(gradient!)
    }
    
    func AddAnimation(animation: CAAnimation, id: String)
    {
        gradient!.add(animation, forKey: id)
    }
    
    func SetSize(_ size: CGRect)
    {
        gradient!.frame = size;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
