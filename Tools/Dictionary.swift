//
//  Dictionary.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation

extension JS where Base == Dictionary<String, Any> {
    
    func jsonString() -> String? {
        let error:Error? = nil
        
        let jsonData:Data = try! JSONSerialization.data(withJSONObject: base, options: .prettyPrinted);
        
        if jsonData.count > 0 && error == nil {
            return String.init(data: jsonData, encoding: .utf8)
        }
        
        return nil
    }
}
