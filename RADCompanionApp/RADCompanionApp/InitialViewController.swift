//
//  InitialViewController.swift
//  RADCompanionApp
//
//  Created by Juriel Garcia on 2020-02-10.
//  Copyright © 2020 Personal. All rights reserved.
//


import UIKit
import SnapKit

class InitialViewController : UIViewController
{
    var timer:Timer?
    
    //var background: UIImageView?
    var background: UIView?
    var backgroundOverlay: UIImageView?
    
    var gradient: CAGradientLayer?
    
    var time = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //  Declare Objects
        let box = UIView()
        let ipTextfield = UITextField()
        
        background = UIView()
        //background = UIImageView(image: #imageLiteral(resourceName: "BackgroundA"))
        backgroundOverlay = UIImageView(image: #imageLiteral(resourceName: "BackgroundOverlayA"))
        
        //  Change Properties
        ipTextfield.placeholder = "127.0.0.1"
        ipTextfield.textAlignment = .center
        ipTextfield.borderStyle = .line
        ipTextfield.clearButtonMode = .never
        ipTextfield.keyboardType = .numbersAndPunctuation
        ipTextfield.keyboardAppearance = .dark
        ipTextfield.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ipTextfield.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        //ipTextfield.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
        
        //background?.contentMode = .scaleToFill
        //background?.image?.withRenderingMode(.alwaysTemplate)
        
        gradient = CAGradientLayer()
        gradient!.frame = view.bounds;
        
        backgroundOverlay?.contentMode = .scaleToFill
        
        view.layer.insertSublayer(gradient!, at: 0)
        
        //  Add to View
        self.view.addSubview(background!)
        self.view.addSubview(backgroundOverlay!)
        self.view.addSubview(box)
        self.view.addSubview(ipTextfield)
        
        //  Set Constraints
        background?.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        
        backgroundOverlay?.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        
        box.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right:20))
        })
        
        ipTextfield.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-40)
            make.height.equalToSuperview().dividedBy(16)
        })
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1.0 / 60.0), target: self, selector: #selector(Update), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    @objc func Update(_ timer:Timer)
    {
        time += timer.timeInterval as Double
        //background?.tintColor = UIColor(hue: CGFloat(sin(time) * 0.5 + 0.5) , saturation: 0.8, brightness: 0.8, alpha: 1.0)
        //backgroundOverlay?.alpha = CGFloat(sin(time) * 0.5 + 0.5)
        gradient?.colors = [UIColor.cyan.cgColor, UIColor.magenta.cgColor]
        gradient?.transform = CATransform3DMakeRotation(CGFloat.pi / CGFloat(sin(time) + 1), 0, 0, 1)
        
        backgroundOverlay?.alpha = 0;
    }
}
