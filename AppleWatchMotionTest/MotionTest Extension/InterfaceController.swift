//
//  InterfaceController.swift
//  MotionTest Extension
//
//  Created by Enkhjargal Gansukh on 8/1/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var CountLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("Ready to start Sensor")
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func startSensorService(){
        
    }

    @IBAction func startSensor() {
        SensorService.sharenInstance.startService()
    }
    @IBAction func stopSensor() {
        SensorService.sharenInstance.stopService()
    }
}
