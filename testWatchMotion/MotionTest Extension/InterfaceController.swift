//
//  InterfaceController.swift
//  MotionTest Extension
//
//  Created by Enkhjargal Gansukh on 8/10/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        print("Motion Test App is running")
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func startClicked() {
        SensorService.instance.startService()
    }
    @IBAction func stopClicked() {
        SensorService.instance.stopService()
    }
}
