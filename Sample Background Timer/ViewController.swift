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
    let t = RepeatingTimer(timeInterval: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        t.eventHandler = {
            self.eventFired()
        }
        t.resume()
    }
    
    func eventFired() {
        print("Event fired. Number of times ", count)
        count = count + 1
        if count == 4 {
            t.suspend()
        }
    }
}
