# BTPrint

[![CI Status](https://img.shields.io/travis/mancong@bertadata.com/BTPrint.svg?style=flat)](https://travis-ci.org/mancong@bertadata.com/BTPrint)
[![Version](https://img.shields.io/cocoapods/v/BTPrint.svg?style=flat)](https://cocoapods.org/pods/BTPrint)
[![License](https://img.shields.io/cocoapods/l/BTPrint.svg?style=flat)](https://cocoapods.org/pods/BTPrint)
[![Platform](https://img.shields.io/cocoapods/p/BTPrint.svg?style=flat)](https://cocoapods.org/pods/BTPrint)




对Swift代码Debug的时候，看到控制台的输出日志，打印字典/数组的时候，没有换行和缩进，再包含可选的时候，本来coding的愉快就变得不开心了。
```
// 使用系统的print的输出内容
[AnyHashable("a"): "我的英文名叫Mccc", AnyHashable("key0"): ["key1.2": ["key2.1": false, "key2": "qxb", "key2.2": 2.0], "key1": "qxb", "key1.1": false]]
```
为了让coding更开心，萌生了优化Xcode控制台输出的想法：

-   美化Xcode控制台的内容输出，不要杂乱无章。
-   执行打印的基础信息（文件名，行数，函数名）。
-   对于字典和数组的输出可以格式化，像OC的输出一样直观。
-   增强输出内容的区分。
-   解决中文的显示问题。



# 使用BTPrint

### 支持pod
```
pod 'BTPrint', :git => 'https://github.com/intsig171/BTPrint.git'
```

一行代码优化Xcode控制台Swift对象print格式问题。
```
BTPrint.print<T>(_ content: T) 
```


### 输出的展示
```
👉👉👉  [📖 Dictionary] ViewController.swift[83]: viewDidLoad()
{
    "a": "我的英文名叫Mccc",
    "key0": {
        "key1": "qxb",
        "key1.1": false,
        "key1.2": {
            "key2": "qxb",
            "key2.1": false,
            "key2.2": 2.0
        }
    }
}
```

### 优点

| 序号 | 优点 | 说明|
| --- | --- | -- |
| 1 | 控制台打印的时候会打印出来以下内容项： [开始标志] + [输出类型] + [类名] + [所在行] + [执行方法] | 👉👉👉(开始标志)  [📖 Dictionary]（输出类型） ViewController.swift（类名）[83]（所在行）: viewDidLoad()（方法名） |
| 2|有工整的换行和缩进 | 对字典和数组的括号做了格式显示 |
| 3|对字典的key做了排序，方便查找 | 针对字典的keys排序显示，更方便查找 |
| 4|中文显示优化 | 避免了中文的unicode显示问题"\U665a\U4e0a\U53bb\U73a9"; |
| 5|支持json显示 | 支持复制直接在json网站查看 |
| 6| 提供了print组合使用| 比如一个完整的网络请求输出包含：请求url，请求header，请求参数，请求结果。支持组合输出 |





# 示例

### 1. 支持多种类型的打印类型
字符串类型
```
let text = "我是文本"
BTPrint.print(text)

👉👉👉  [✏️ String] ViewController.swift[25]: viewDidLoad()
我是文本
```

数组&字典类型
```
let arr = [["我是key": ["key1":"晚上去玩"]]]
BTPrint.print(arr)

👉👉👉  [🎢 Array] ViewController.swift[28]: viewDidLoad()
[
    {
        "我是key": {
            "key1": "晚上去玩"
        }
    }
]
```

颜色类型
```
let color = UIColor.red
BTPrint.print(color)

👉👉👉  [🎨 Color] ViewController.swift[31]: viewDidLoad()
UIExtendedSRGBColorSpace 1 0 0 1
```

URL类型
```
let url = "https://www.qixin.com"
BTPrint.print(url)
👉👉👉  [🌏 URL] ViewController.swift[34]: viewDidLoad()
https://www.baidu.com
```

错误类型
```
let error = NSError.init(domain: "qixin.com", code: 100, userInfo: ["a": "b"])
BTPrint.print(error)

👉👉👉  [❌ Error] ViewController.swift[37]: viewDidLoad()
Error Domain=qixin.com Code=100 "(null)" UserInfo={a=b}
```

  

### 2. 支持添加打印标记
```
let sign = "本次打印有标记符号"
BTPrint.print(sign, identifier: "打印标记")

👉👉👉  [✏️ String] [打印标记] -> ViewController.swift[46]: viewDidLoad()
本次打印有标记符号
```


### 3. 组合打印
```
BTPrint.printBeforeLine(content: "网络请求组合")

let url = "https://www.baidu.com"
BTPrint.print(url, identifier: "网络请求接口")

let params = [
    "a": "A",
    "b": "B"
]
BTPrint.print(params, identifier: "请求头")

let response = [
    "data" : "abc",
    "status": 200,
    "message": "请求成功"
] as [String : Any]

BTPrint.print(response, identifier: "返回值")

BTPrint.printAfterLine(content: "网络请求组合")
```
```
👇 ================网络请求组合================ 👇

👉👉👉  [🌏 URL] [网络请求接口] -> ViewController.swift[25]: viewDidLoad()
https://www.baidu.com

👉👉👉  [📖 Dictionary] [请求头] -> ViewController.swift[31]: viewDidLoad()
{
    "a": "A",
    "b": "B"
}

👉👉👉  [📖 Dictionary] [返回值] -> ViewController.swift[40]: viewDidLoad()
{
    "data": "abc",
    "message": "请求成功",
    "status": 200
}

☝️ ================网络请求组合================ ☝️
```


# 地址
[Github](https://github.com/intsig171/BTPrint.git)

# 参考
* https://github.com/imsz5460/SZJsonLog




## Author

mancong@bertadata.com

## License

BTPrint is available under the MIT license. See the LICENSE file for more info.
