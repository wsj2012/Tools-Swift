//
//  String.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation
import CommonCrypto

extension JS where Base == String {
    
    public func range(from startIndex: Int, to endIndex: Int) -> Range<String.Index> {
        let offseti = startIndex < 0 ? 0 : startIndex
        let offsetj = endIndex > base.count ? base.count : endIndex
        let i = base.index(base.startIndex, offsetBy: offseti)
        let j = base.index(base.startIndex, offsetBy: offsetj)
        return i..<j
    }
    
    public func substring(from startIndex: Int, to endIndex: Int) -> String? {
        if startIndex >= endIndex {
            return nil
        }
        let substring = base[range(from: startIndex, to: endIndex)]
        return String(substring)
    }
    
    public func substring(from index: Int) -> String? {
        if index >= base.count {
            return nil
        }
        return substring(from: index, to: base.count)
    }
    
    public func substring(to index: Int) -> String? {
        if index < 0 {
            return nil
        }
        return substring(from: 0, to: index)
    }
    //网络请求的时候调用
    public func emptyOrString(str: String) -> String {
        
        if !str.isEmpty {
            return str
        }
        
        return ""
    }
    
    public func md5String() -> String {
        
        let data = base.data(using: String.Encoding.utf8)!
        
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        data.withUnsafeBytes { bytes in
            CC_MD5(bytes, CC_LONG(data.count), &digest)
        }
        
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
    
    public func isBlank(str:String) -> Bool {
        
        if str.count <= 0 {
            return true
        }
        
        let s = str.trimmingCharacters(in: .whitespaces)
        
        if s.count <= 0 {
            return true
        }
        
        return false
    }
    
    public func isPhoneNumber() -> Bool {
        do {
            let pattern: String = "^1[0-9]{10}$"
            let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            
            let matches = regex.matches(in: base, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, base.count))
            
            return matches.count > 0
        } catch {
            return false
        }
    }
    
    public func objectFromJSONString() -> AnyObject? {
        
        let data = base.data(using: .utf8)
        
        let dictionary_temp_temp = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
        
        return dictionary_temp_temp as AnyObject
    }
    
    public func urlEncodedString() -> String {
        
        var charSet = CharacterSet.urlQueryAllowed
        
        charSet.insert(charactersIn: "#")
        
        let encodingURL = base.addingPercentEncoding(withAllowedCharacters: charSet)
        
        return encodingURL!
    }
}
