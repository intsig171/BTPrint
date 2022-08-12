//
//  BTPrint.swift
//  BTPrint
//
//  Created by Mccc on 2021/7/12.
//

import UIKit




public struct BTPrint { }



extension BTPrint {
    /// 打印输出
    /// - Parameters:
    ///   - content: 输出内容
    ///   - identifier: 本次打印的标志符号 （可选值：体现在打印体里面方便查找）
    ///   - file: 执行所在文件
    ///   - method: 执行所在方法
    ///   - line: 执行所在行数
    public static func print<T>(_ content: T,
                             identifier: String = "",
                             file: String = #file,
                             method: String = #function,
                             line: Int = #line) {
        
#if DEBUG
        
        let type = transform(content)
        
        let sign = "\((file as NSString).lastPathComponent)[\(line)]: \(method)"
        let emjio = type.getEmjio()
        let content = type.getContent()
        
        
        let ide = identifier.count == 0 ? "" : "[\(identifier)] -> "
        let allStr = emjio + ide + sign + "\n" + content + "\n"
        Swift.print(allStr)
#endif
    }
    
    
    
    /// 打印输出 - 上分割线
    /// - Parameters:
    ///   - content: 分割线上带的内容
    ///   - identifier: 本次打印的标志符号 （可选值：体现在打印体里面方便查找）
    ///   - file: 执行所在文件
    ///   - method: 执行所在方法
    ///   - line: 执行所在行数
    public static func printBeforeLine(content: String,
                                 identifier: String = "",
                                 file: String = #file,
                                 method: String = #function,
                                 line: Int = #line) {
#if DEBUG

        let type = PrintContentType.beforeLine(content)
        let emjio = type.getEmjio()
        let content = type.getContent()
        let allStr = "\n" + emjio + content + emjio
        Swift.print(allStr)
#endif
    }
    
    
    /// 打印输出 - 下分割线
    /// - Parameters:
    ///   - content: 分割线上带的内容
    ///   - identifier: 本次打印的标志符号 （可选值：体现在打印体里面方便查找）
    ///   - file: 执行所在文件
    ///   - method: 执行所在方法
    ///   - line: 执行所在行数
    public static func printAfterLine(content: String,
                                 identifier: String = "",
                                 file: String = #file,
                                 method: String = #function,
                                 line: Int = #line) {
#if DEBUG
        let type = PrintContentType.afterLine(content)
        let emjio = type.getEmjio()
        let content = type.getContent()
        let allStr = emjio + content + emjio + "\n"
        Swift.print(allStr)
#endif
    }
}

extension BTPrint {
    private static func transform(_ content: Any) -> PrintContentType {
        
        if let string = content as? String {
            if let url = URL.init(string: string), UIApplication.shared.canOpenURL(url) {
                return .url(string)
            } else {
                return .text(string)
            }
        }
        
        if let int = content as? Int {
            return .int(int)
        }
        
        if let double = content as? Double {
            return .double(double)
        }
        
        if let dict = content as? Dictionary<String, Any> {
            return .dictionary(dict)
        }
        
        if let arr = content as? [Any] {
            return .array(arr)
        }
        
        if let color = content as? UIColor {
            return .color(color)
        }
        
        if let error = content as? NSError {
            return .error(error)
        }
        
        if let date = content as? Date {
            return .date(date)
        }
        return .any(content)
    }
}


extension BTPrint {
    enum PrintContentType {
        /// 字符串✏️
        case text(String)
        /// Int
        case int(Int)
        /// Double
        case double(Double)
        /// 字典📖
        case dictionary([String: Any])
        /// 数组🎢
        case array([Any])
        /// 颜色 🎨
        case color(UIColor)
        /// URL🌏  是否可以转成URL
        case url(String)
        /// Error❌
        case error(NSError)
        /// Date🕒
        case date(Date)
        /// any 🎲
        case any(Any)
        /// 分割线👇
        case beforeLine(String)
        /// 分割线☝️
        case afterLine(String)
    }
}

extension BTPrint.PrintContentType {
    func getEmjio() -> String {
        switch self {
        case .text(_):
            return "【✏️ String】"
        case .dictionary(_):
            return "【📖 Dictionary】"
        case .array(_):
            return "【🎢 Array】"
        case .color(_):
            return "【🎨 Color】"
        case .url(_):
            return "【🌏 URL】"
        case .error(_):
            return "【❌ Error】"
        case .date(_):
            return "【🕒 Date】"
        case .any(_):
            return "【🎲 Any】"
        case .beforeLine(_):
            return "👇 "
        case .afterLine(_):
            return "☝️ "
            
        case .double:
            return "【Double】"
        case .int(_):
            return "【Int】"

        }
    }
    
    func getContent() -> String {
        
        func content<T>(_ object: T) -> String {
            let temp = "\(object)"
            return temp
        }
        switch self {
        case .color(let color):
            return content(color)
        case .text(let line):
            return content(line)
        case .url(let url):
            return content(url)
        case .error(let error):
            return content(error)
        case .any(let any):
            return content(any)
        case .date(let date):
            return content(date)
        case .dictionary(let dict):
            return content("\(String(describing: dict as AnyObject))")
        case .array(let arr):
            return content("\(String(describing: arr as AnyObject))")
        case .beforeLine(let message):
            return content("================\(message)================ ")
        case .afterLine(let message):
            return content("================\(message)================ ")
        case .double(let value):
            return content(value)
        case .int(let value):
            return content(value)
        }
    }
}

