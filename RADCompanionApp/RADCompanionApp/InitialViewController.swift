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
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //  Declare Objects
        let box = UIView()
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
        //ipTextfield.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
        
        //  Add to View
        self.view.addSubview(box)
        self.view.addSubview(ipTextfield)
        
        //  Set Constraints
        box.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right:20))
        })
        ipTextfield.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-40)
            make.height.equalToSuperview().dividedBy(16)
        })
    }
}
