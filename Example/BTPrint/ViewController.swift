//
//  ViewController.swift
//  BTPrint
//
//  Created by mancong@bertadata.com on 08/12/2022.
//  Copyright (c) 2022 mancong@bertadata.com. All rights reserved.
//

import UIKit
import BTPrint

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        BTPrint.printBeforeLine(content: "测试输出开始")
        
        let text = "我是文本"
        BTPrint.print(text)
        
        let arr = [["我是key": ["key1":"晚上去玩"]]]
        BTPrint.print(arr)
        
        let color = UIColor.red
        BTPrint.print(color)
        
        let url = "https://www.qixin.com"
        BTPrint.print(url)
        
        let error = NSError.init(domain: "qixin.com", code: 100, userInfo: ["a": "b"])
        BTPrint.print(error)
        
        let any: Any = 123
        BTPrint.print(any)
        
        BTPrint.printAfterLine(content: "测试输出结束")
        
        
        challenge()
    }
    
    
    func challenge() {
        
        let dict4 = [
            "key4": "qxb",
            "key4.1": false,
            "key4.2": 2.0,
            "key4.3": 2
        ] as [String : Any]
        
        let dict3 = [
            "key3": "qxb",
            "key3.1": false,
            "key3.2": 2.0,
            "key3.3": dict4
        ] as [String : Any]
        
        let dict2 = [
            "key2": "qxb",
            "key2.1": false,
            "key2.2": 2.0,
            "key2.3": dict3
        ] as [String : Any]
        
        let dict1 = [
            "key1": "这是一行中文字符串",
            "key1.1": false,
            "key1.2": dict2,
            "key1.3": dict2
        ] as [String : Any]
        
        let dict = [
            "a": "qxb",
            "key0" : dict1
        ] as [AnyHashable : Any]
        

        BTPrint.print(dict)

        
        
        
        let arr3 = [1, 2, 3, 4]
        let arr2 = ["1", "2", arr3, dict1] as [Any]
        let arr1 = ["1", arr2, arr3] as [Any]
        let arr = [arr1, arr2, arr3, false, 1] as [Any]
        
        
        BTPrint.print(arr)
    }
}

