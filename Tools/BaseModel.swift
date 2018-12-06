//
//  BaseModel.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/12/6.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation
import UIKit

public protocol BaseModel: Codable, CustomStringConvertible {
    
}

extension BaseModel {
    // 调用此属性可用与比较两个model是否一致
    public var description:String {
        let mir = Mirror(reflecting: self)
        var des = "[\(mir.subjectType)] {\n"
        for case let (label?, value) in mir.children {
            des += "\(label): \(value)\n"
        }
        des += "\n}"
        return des
    }
}
