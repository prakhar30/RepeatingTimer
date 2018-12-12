//
//  ViewController.swift
//  Sample Background Timer
//
//  Created by Prakhar Tripathi on 13/12/18.
//  Copyright © 2018 Prakhar Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func eventFired() {
        print("Event fired. Number of times ", count)
        count = count + 1
    }
    
    @IBAction func startTimerAction(_ sender: Any) {
        RepeatingTimer.eventHandler = {
            self.eventFired()
        }
        RepeatingTimer.timer.resume()
    }
    
    @IBAction func finishTimerAction(_ sender: Any) {
        RepeatingTimer.timer.suspend()
    }
}
