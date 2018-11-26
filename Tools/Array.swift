//
//  Array.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation

extension JS where Base == Array<Int> {
    
    func objectWithIndex(index:Int) -> Any? {
        
        if index >= 0 && index < base.count {
            return base[index]
        }
        
        return nil
    }
}
