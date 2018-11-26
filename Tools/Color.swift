//
//  Color.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation
import UIKit

extension JS where Base == String {
    
    public func toColor(alpha: CGFloat = 1.0) -> UIColor? {
        let cstr = base.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard cstr.count >= 6 else {
            return nil
        }
        var startIndex = 0
        if cstr.hasPrefix("0X") {
            startIndex = 2
        }
        if cstr.hasPrefix("#") {
            startIndex = 1
        }
        
        let rs = cstr.js.substring(from: startIndex, to: startIndex + 2)
        let gs = cstr.js.substring(from: startIndex + 2, to: startIndex + 4)
        let bs = cstr.js.substring(from: startIndex + 4, to: startIndex + 6)
        
        var red: UInt32 = 0x0
        var green: UInt32 = 0x0
        var blue: UInt32 = 0x0
        
        Scanner(string: rs!).scanHexInt32(&red)
        Scanner(string: gs!).scanHexInt32(&green)
        Scanner(string: bs!).scanHexInt32(&blue)
        
        let hexColor = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
        
        return hexColor
    }
}
