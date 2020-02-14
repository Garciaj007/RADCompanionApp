//
//  InputManager.swift
//  RADCompanionApp
//
//  Created by Juriel Garcia on 2020-02-04.
//  Copyright © 2020 Personal. All rights reserved.
//

import CoreMotion

class InputManager
{
    private static var inputManager:InputManager?
    
    var motionManager = CMMotionManager()
    var timer = Timer()
    
    private init(){}
    
    static func Get() -> InputManager
    {
        if(inputManager == nil)
        {
            inputManager = InputManager()
        }
        return inputManager!
    }
    
    //This function is called when callibrating.
    func startDeviceMotion() -> Bool
    {
        if(!motionManager.isDeviceMotionAvailable)
        {
            return false
        }
        
        self.motionManager.deviceMotionUpdateInterval = 1.0 / 90.0
        self.motionManager.showsDeviceMovementDisplay = true
        self.motionManager.startDeviceMotionUpdates(using: .xArbitraryZVertical)
        
        //Setting timer to fetch motion data
        timer = Timer.scheduledTimer(withTimeInterval: (1.0 / 90.0), repeats: true, block: { (timer) in
            if let data = self.motionManager.deviceMotion {
                
                //Get Device Orientation
                //NOTE: the orientation is not the same Z is Vertical
                let orientation = data.attitude;
                
                //Get Device Acceleration
                let acceleration = data.userAcceleration;
                
                //print("Orientation: \(orientation)")
                //print("Acceleration: \(acceleration)")
            
                //Send Data via Network Manager
                
            }})
        return true;
    }
}
