//
//  Bundle.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation

extension JS where Base: Bundle {
    func filePath(classObject:AnyClass,bundleName:String,fileName:String, fileType:String) -> String {
        
        let name:String = String(format: "File/%@", fileName)
        let bundle:Bundle = Bundle.init(for: classObject)
        let url:URL = bundle.url(forResource: bundleName, withExtension: "bundle")!
        let resourceBundle:Bundle = Bundle.init(url: url)!
        let path:String = resourceBundle.path(forResource: name, ofType: fileType)!
        
        return path
    }
}
