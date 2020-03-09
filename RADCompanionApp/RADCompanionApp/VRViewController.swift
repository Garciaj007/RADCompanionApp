//
//  VRViewController.swift
//  RADCompanionApp
//
//  Created by Juriel Garcia on 2020-02-10.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit
import SnapKit

class VRViewController : UIViewController
{
    var timer:Timer?
    var background: UIGradient?
    var backgroundOverlay: UIGradient?
    
    var time = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background = UIGradient([RADColor.secondary.cgColor, RADColor.secondary.lighten(percent: 10).cgColor])
        backgroundOverlay = UIGradient()
        
        view.addSubview(background!)
        view.addSubview(backgroundOverlay!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundOverlay!.SetSize(view.bounds)
        backgroundOverlay!.SetSize(view.bounds)
    }
}
