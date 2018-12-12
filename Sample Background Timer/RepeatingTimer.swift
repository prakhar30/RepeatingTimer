//
//  RepeatingTimer.swift
//  Sample Background Timer
//
//  Created by Prakhar Tripathi on 13/12/18.
//  Copyright © 2018 Prakhar Tripathi. All rights reserved.
//

import Foundation

class RepeatingTimer {
    
    static var timeInterval: TimeInterval = 1
    static var t = DispatchSource.makeTimerSource()
    
    static var timer: DispatchSourceTimer = {
        RepeatingTimer.t.schedule(deadline: .now() + RepeatingTimer.timeInterval, repeating: RepeatingTimer.timeInterval)
        RepeatingTimer.t.setEventHandler(handler: {
            RepeatingTimer.eventHandler?()
        })
        return RepeatingTimer.t
    }()
    
    static var eventHandler: (() -> Void)?
    
    private enum State {
        case suspended
        case resumed
    }
    
    private static var state: State = .suspended
    
    deinit {
        RepeatingTimer.timer.setEventHandler {}
        RepeatingTimer.timer.cancel()
        RepeatingTimer.resume()
        RepeatingTimer.eventHandler = nil
    }
    
    static func resume() {
        if RepeatingTimer.state == .resumed {
            return
        }
        RepeatingTimer.state = .resumed
        RepeatingTimer.t.resume()
    }
    
    static func suspend() {
        if RepeatingTimer.state == .suspended {
            return
        }
        RepeatingTimer.state = .suspended
        RepeatingTimer.t.suspend()
    }
}
