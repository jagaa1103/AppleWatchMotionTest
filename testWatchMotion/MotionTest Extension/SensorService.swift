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
        motionManager.accelerometerUpdateInterval = 0.1
        if motionManager.isAccelerometerAvailable {
            let accelHandler:CMAccelerometerHandler = {accel, error in
                print("Accel: " + String(format: "%.2f  ", accel!.acceleration.x) + String(format: "%.2f  ", accel!.acceleration.y) + String(format: "%.2f  ", accel!.acceleration.z))
            }
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: accelHandler)
        }else{
            print("Accelerometer is not aviable")
        }
        if motionManager.isGyroAvailable{
            let gyroHandler:CMGyroHandler = {gyro, error in
                print("Gyro: " + String(format: "%.2f  ", gyro!.rotationRate.x) + String(format: "%.2f  ", gyro!.rotationRate.y) + String(format: "%.2f  ", gyro!.rotationRate.z))
            }
            motionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: gyroHandler)
        }else{
            print("Gyroscope is not aviable")
        }
    }
    
    func stopService(){
        print("::::::::::::::::::::: stopped Motion detect :::::::::::::::::::::")
        motionManager.stopAccelerometerUpdates()
        motionManager.stopGyroUpdates()
    }
}
