//
//  Date.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    public class js {
        private static var cache: [String: DateFormatter] = [:]
        public class func formatter(_ format: String = "yyyy-MM-dd HH:mm:ss", locale: Locale = .autoupdatingCurrent, timeZone: TimeZone = .autoupdatingCurrent) -> DateFormatter {
            if let formatter = cache[format] {
                formatter.locale = locale
                formatter.timeZone = timeZone
                return formatter
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = format
            formatter.locale = locale
            formatter.timeZone = timeZone
            cache[format] = formatter
            return formatter
        }
    }
    
}

extension JS where Base == Date {
    
    public func description(format: String = "yyyy-MM-dd HH:mm:ss", locale: Locale = .autoupdatingCurrent, timeZone: TimeZone = .autoupdatingCurrent) -> String {
        return DateFormatter.js.formatter(format, locale: locale, timeZone: timeZone).string(from: base)
    }
}

extension JS where Base == String {
    
    public func date(_ format: String = "yyyy-MM-dd HH:mm:ss", locale: Locale = .autoupdatingCurrent, timeZone: TimeZone = .autoupdatingCurrent) -> Date? {
        return DateFormatter.js.formatter(format, locale: locale, timeZone: timeZone).date(from: base)
    }
    
}
