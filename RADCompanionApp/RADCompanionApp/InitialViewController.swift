//
//  InitialViewController.swift
//  RADCompanionApp
//
//  Created by Juriel Garcia on 2020-02-10.
//  Copyright © 2020 Personal. All rights reserved.
//


import UIKit
import SnapKit
import IBAnimatable
import CoreGraphics

class InitialViewController : UIViewController
{
    var timer:Timer?
    var bgGradient: UIGradient?
    
    var time = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //  Declare Objects
        bgGradient = UIGradient(type: .radial)
        let background = UIView()
        let decal = AnimatableView()
        let header = UILabel()
        let description = UILabel()
        let connectBtn = AnimatableButton()
        let ipTextfield = UITextField()
        
        //  Change Properties
        background.backgroundColor = RADColor.secondary
        
        decal.fillColor = RADColor.accents[1]
        decal.maskType = .parallelogram(angle: 185)
        
        //var t = 0.0;
        //_ = Timer.scheduledTimer(withTimeInterval: TimeInterval(0.1), repeats: true, block: {(timer) -> Void in
        //    t += 1.0
        //    decal.maskType = .parallelogram(angle: t)
        //    print(t)
        //})
        
        ipTextfield.placeholder = "127.0.0.1"
        ipTextfield.textAlignment = .center
        ipTextfield.borderStyle = .line
        ipTextfield.clearButtonMode = .never
        ipTextfield.keyboardType = .numbersAndPunctuation
        ipTextfield.keyboardAppearance = .dark
        ipTextfield.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ipTextfield.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        
        header.text = "Connect"
        header.textAlignment = .center
        description.text = "Enter IP to Connect"
        description.textAlignment = .center
        
        connectBtn.addTarget(self, action: #selector(ConnectButtonPressed), for: .touchUpInside)
        connectBtn.setTitle("Connect", for: .normal)
        connectBtn.backgroundColor = RADColor.accents[0]
        connectBtn.ib.shadowColor = RADColor.shadow
        connectBtn.ib.shadowOpacity = 1
        connectBtn.shadowRadius = 25
        
        //  Add to View
        view.addSubview(background)
        view.addSubview(decal)
        view.addSubview(bgGradient!)
        view.addSubview(header)
        view.addSubview(description)
        view.addSubview(ipTextfield)
        view.addSubview(connectBtn)
        
        //  Set Constraints
        background.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        
        decal.snp.makeConstraints({ (make) -> Void in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10)
            make.top.equalToSuperview().offset(100)
        })
        decal.layer.transform = CATransform3DMakeRotation(CGFloat.deg2Rad(20), 0, 0, 1)
        
        bgGradient!.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        
        header.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16)
        })
        
        description.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(ipTextfield.snp.top).offset(-50)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(20)
        })
        
        ipTextfield.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-40)
            make.height.equalToSuperview().dividedBy(14)
        })
        
        connectBtn.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(ipTextfield.snp.bottom).offset(50)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16)
        })
        
        //  Start Input Manager
        if(!InputManager.Get().startDeviceMotion())
        {
            //  Display Error Message To User
            print("Core Motion Not Found")
        }
        
        //Network Manager
        UDPNetworkManager.Get().send(text: "PLEASE FUCKING WORK", host: "172.20.10.2", port: 54000)
        
        //  Update Timer
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1.0 / 60.0), target: self, selector: #selector(Update), userInfo: nil, repeats: true)
    }
    
    //Function Used To Set Position of Subviews Parallel to View
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgGradient!.SetSize(view.bounds)
        bgGradient!.AddAnimation(animation: MakeAnim.MakeGradientColorAnim(colors: [[RADColor.secondary.darken(percent: 10).cgColor, UIColor.clear.cgColor], [UIColor.clear.cgColor, RADColor.shadow.cgColor]]), id: "bgGradientColorAnim")
        bgGradient!.AddAnimation(animation: MakeAnim.MakeGradientStartPointAnim(startPoints: [CGPoint(x: 20, y: 100), CGPoint(x: 20, y: 200)]), id: "bgGradientSPointsAnim")
        bgGradient!.AddAnimation(animation: MakeAnim.MakeGradientEndPointAnim(endPoints: CGPoint.makeRandom(range: view.bounds, size: 5)), id: "bgGradientEPointsAnim")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    // [Deprecated]
    @objc func Update(_ timer:Timer)
    {
        time += timer.timeInterval as Double
    }
    
    @objc func ConnectButtonPressed()
    {
        performSegue(withIdentifier: "Connect2Menu", sender: nil)
    }
}

