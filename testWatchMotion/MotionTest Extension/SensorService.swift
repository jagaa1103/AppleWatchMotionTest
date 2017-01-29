//
//  SensorService.swift
//  testWatchMotion
//
//  Created by Enkhjargal Gansukh on 8/10/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import CoreMotion

class SensorService: NSObject {
    static let instance = SensorService()
    
    let motionManager = CMMotionManager()
    
    func startService(){
        print("::::::::::::::::::::: started Motion detect :::::::::::::::::::::")
        motionManager.deviceMotionUpdateInterval = 0.1
        if motionManager.isDeviceMotionAvailable {
            startMotion()
        }
    }
    
    func stopService(){
        print("::::::::::::::::::::: stopped Motion detect :::::::::::::::::::::")
        motionManager.stopDeviceMotionUpdates()
    }
    
    func startMotion(){
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (motion, error) in
            if let mData = motion {
                print("RotaionRate >> x : \(mData.rotationRate.x) , y : \(mData.rotationRate.y) , z : \(mData.rotationRate.z)")
                print("UserAccel >> x : \(mData.userAcceleration.x) , y : \(mData.userAcceleration.y) , z : \(mData.userAcceleration.z)")
            }
        })
    }
}
