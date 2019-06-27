//
//  BaseViewController.swift
//  Base
//
//  Created by wukong on 2019/5/24.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation





public struct BaseViewController<T:UIViewController>:BaseUIProtocol{
    
    public typealias warpperType = UIViewController
    public let wkpg: warpperType
    
    public init(_ vc: UIViewController) {
        self.wkpg = vc
    }
}

public extension BaseViewController{
    
    public var pgvc:UIViewController{
       return self.wkpg
    }
}


// MARK: - 该协议的扩展，用于定义一些功能函数
 extension BaseUIProtocol where warpperType == UIViewController  {
}

public extension UIViewController{
    
   public var wkvc:BaseViewController<UIViewController>{
        return BaseViewController(self)
    }
}

