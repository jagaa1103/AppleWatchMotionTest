//
//  SensorService.swift
//  AppleWatchMotionTest
//
//  Created by Enkhjargal Gansukh on 8/1/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

import CoreMotion

class SensorService: NSObject{
    
    static let sharenInstance = SensorService()
    
    let motionManager = CMMotionManager()
    
    func startService(){
        motionManager.accelerometerUpdateInterval = 0.1
        if motionManager.accelerometerAvailable {
            let handler:CMAccelerometerHandler = {(data: CMAccelerometerData?, error: NSError?) -> Void in
                print(String(format: "%.2f  ", data!.acceleration.x) + String(format: "%.2f  ", data!.acceleration.y) + String(format: "%.2f  ", data!.acceleration.z))
            }
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: handler)
        }else{
            print("Accelerometer is not aviable")
        }
    }
    
    func stopService(){
        motionManager.stopAccelerometerUpdates()
    }
}
