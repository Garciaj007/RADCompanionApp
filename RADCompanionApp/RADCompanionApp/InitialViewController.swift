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

class InitialViewController : UIViewController
{
    var timer:Timer?
    var background: UIGradient?

    var time = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //  Declare Objects
        background = UIGradient(primaryDark, primaryLight)
        let header = UILabel()
        let description = UILabel()
        let connectABtn = AnimatableButton()
        let connectBtn = UIButton(type: .roundedRect)
        let ipTextfield = UITextField()
        
        //  Change Properties
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
        
        connectBtn.setTitle("Connect", for: .normal)
        connectBtn.addTarget(self, action: #selector(ConnectButtonPressed), for: .touchUpInside)
        
        connectABtn.setTitle("Connect", for: .normal)
        connectABtn.ib.borderWidth = 50
        connectABtn.backgroundColor = .systemBlue
        connectABtn.ib.shadowColor = .black
        connectABtn.ib.shadowOpacity = 1
        connectABtn.shadowRadius = 25
        
        //  Add to View
        view.addSubview(background!)
        view.addSubview(header)
        view.addSubview(description)
        view.addSubview(ipTextfield)
        view.addSubview(connectBtn)
        view.addSubview(connectABtn)
        
        //  Set Constraints
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
        
        connectABtn.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(ipTextfield.snp.bottom).offset(100)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16)
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
        background!.SetSize(view.bounds)
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

class MakeAnim
{
    static func MakeGradientColorAnim(colors: [CGColor]) -> CAAnimation
    {
        let anim = CABasicAnimation(keyPath: "colors")
        anim.toValue = colors
        anim.duration = 20
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        anim.autoreverses = true;
        anim.repeatCount = Float.infinity
        return anim;
    }
}
