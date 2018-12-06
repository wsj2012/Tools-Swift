//
//  Logger.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/12/6.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation

public struct Logger {
    
    public enum Level: Int {
        case info
        case debug
        case error
        case none
    }
    
    public static var level: Level = {
        #if DEBUG
        return .info
        #else
        return .none
        #endif
    }()
    
    
    private static let defaultDateFormatter = DateFormatter.js.formatter("yyyy-MM-dd HH:mm:ss.SSS", locale: .autoupdatingCurrent, timeZone: .autoupdatingCurrent)
    
    public static func info(_ items: Any..., separator: String = ", ", terminator: String = "\n", file: String = #file, method: String = #function, line: Int = #line, column: Int = #column) {
        internalLog(items, separator: separator, terminator: terminator, file: file, method: method, line: line, column: column, level: .info)
    }
    
    public static func debug(_ items: Any..., separator: String = ", ", terminator: String = "\n", file: String = #file, method: String = #function, line: Int = #line, column: Int = #column) {
        internalLog(items, separator: separator, terminator: terminator, file: file, method: method, line: line, column: column, level: .debug)
    }
    
    public static func error(_ items: Any..., separator: String = ", ", terminator: String = "\n", file: String = #file, method: String = #function, line: Int = #line, column: Int = #column) {
        internalLog(items, separator: separator, terminator: terminator, file: file, method: method, line: line, column: column, level: .error)
    }
    
    public static func log(_ items: Any..., separator: String = ", ", terminator: String = "\n", file: String = #file, method: String = #function, line: Int = #line, column: Int = #column, level: Logger.Level = .debug)
    {
        internalLog(items, separator: separator, terminator: terminator, file: file, method: method, line: line, column: column, level: level)
    }
    
    private static func internalLog(_ items: [Any], separator: String = ", ", terminator: String = "\n", file: String = #file, method: String = #function, line: Int = #line, column: Int = #column, level: Logger.Level = .debug) {
        if level.rawValue >= self.level.rawValue {
            let desc = (items.map { "\($0)" }).joined(separator: separator)
            let dateFormatter =  defaultDateFormatter
            let log = "[\(dateFormatter.string(for: Date()) ?? "unknown time")][\(level)][\((file as NSString).lastPathComponent):\(line)][\(method)] \(desc)"
            print(log, terminator: terminator)
        }
    }
}
