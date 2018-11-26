//
//  Timer.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation


extension Timer {
    public class js {
        public class func sheduledTimer(withTimeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) -> Timer {
            if #available(iOS 10.0, *) {
                return Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats, block: block)
            } else {
                let userInfo = ["block": block]
                return Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(blockInvoke(timer:)), userInfo: userInfo, repeats: repeats)
            }
        }
        
        public class func timer(withTimeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) -> Timer  {
            if #available(iOS 10.0, *) {
                return Timer(timeInterval: interval, repeats: repeats, block: block)
            } else {
                let userInfo = ["block": block]
                return Timer(timeInterval: interval, target: self, selector: #selector(blockInvoke(timer:)), userInfo: userInfo, repeats: repeats)
            }
        }
        
        @objc dynamic private class func blockInvoke(timer: Timer) {
            if let block = ((timer.userInfo as? [String: Any])?["block"]) as? () -> Void {
                block()
            }
        }
    }
    
}

extension JS where Base: Timer {
    
    public func start() {
        base.fireDate = Date.distantPast
    }
    
    public func start(afterTimeInterval interval: TimeInterval) {
        base.fireDate = Date(timeIntervalSinceNow: interval)
    }
    
    public func pause() {
        base.fireDate = Date.distantFuture;
    }
}
