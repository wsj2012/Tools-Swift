//
//  JS.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation

public final class JS<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}


public protocol JSCompatible {
    associatedtype ExtendType
    var js: ExtendType { get }
}


public extension JSCompatible {
    public var js: JS<Self> {
        return JS(self)
    }
}


extension NSObject: JSCompatible {}
extension String: JSCompatible {}
extension Int: JSCompatible {}
extension Float: JSCompatible {}
extension Double: JSCompatible {}
extension Array: JSCompatible {}
extension Dictionary: JSCompatible {}
extension Set: JSCompatible {}
extension Data: JSCompatible {}
extension Date: JSCompatible {}
extension URL: JSCompatible {}
//extension Device: JSCompatible {}

/* example
 
 extension JS where Base: UIView {
 public func logFrame() {
 print(base.frame)
 }
 }
 
 let v = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
 v.js.logFrame()
 
 extension JS where Base == String {
 public func intValue() -> Int? {
 return Int(base)
 }
 }
 
 "123".js.intValue()
 */

public final class WeakReference {
    public weak var object: AnyObject?
    public init(_ object: AnyObject?) {
        self.object = object
    }
}

public extension JS {
    
    func getWeakObject(_ key: UnsafeRawPointer) -> AnyObject? {
        return (getStrongObject(key) as? WeakReference)?.object
    }
    
    func setWeakObject(_ key: UnsafeRawPointer, _ value: AnyObject?) -> Void {
        if let value = value {
            setStrongObject(key, WeakReference(value))
        } else {
            setStrongObject(key, nil)
        }
    }
    
    func getStrongObject(_ key: UnsafeRawPointer) -> Any! {
        return objc_getAssociatedObject(base, key)
    }
    
    func setStrongObject(_ key: UnsafeRawPointer, _ value: Any!) -> Void {
        objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func getAssignObject(_ key: UnsafeRawPointer) -> Any! {
        return objc_getAssociatedObject(base, key)
    }
    
    func setAssignObject(_ key: UnsafeRawPointer, _ value: Any!) -> Void {
        objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_ASSIGN)
    }
}
