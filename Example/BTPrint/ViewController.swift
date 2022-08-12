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
    }
    
}

