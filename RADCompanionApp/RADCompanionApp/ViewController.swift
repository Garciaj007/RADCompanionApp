//
//  DELETE ME!
//  ViewController.swift
//  RADCompanionApp
//
//  Created by Juriel Garcia on 2020-01-30.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    var skView: SKView!
    var networkManager: NetworkManager?;
    var button = UIButton(frame: CGRect(x: 100, y:100, width: 100, height: 30))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let connectionBtn = button
        connectionBtn.backgroundColor = UIColor.lightGray
        connectionBtn.setTitle("Connect", for: .normal)
        connectionBtn.addTarget(self, action: #selector(connectionBtnListener), for: .touchUpInside)
        self.view.addSubview(connectionBtn)
        
        networkManager = NetworkManager(ip4: "142.214.241.68", port: 8888)
    }
    
    @IBAction func FadeIn(_ element: UIView)
    {
        UIView.animate(withDuration: 2.0, animations: {
            element.alpha = 1.0;
        })
        {(finished) in}
    }
    
    @IBAction func FadeOut(_ element: UIView)
    {
        UIView.animate(withDuration: 2.0, animations: {
            element.alpha = 0.0
        })
        {(finished) in}
    }
    
    var toggle = false;
    @objc private func connectionBtnListener(_ sender: UIButton!)
    {
        print("Button Been Touched")
        if(toggle)
        {
            FadeIn(sender)
        }
        else
        {
            FadeOut(sender)
        }
        toggle = !toggle
    }
    
    func setupScene()
    {
        
    }
}

