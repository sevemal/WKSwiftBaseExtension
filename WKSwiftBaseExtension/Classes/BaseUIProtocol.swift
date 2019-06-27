//
//  BaseUIProtocol.swift
//  Base
//
//  Created by wukong on 2019/5/24.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation

/// 定义basevc协议
protocol BaseUIProtocol {
    
    /// 关联类型，采用范型，貌似是swift定义协议的标准格式
    associatedtype warpperType
    
    var wkpg:warpperType { get }
}



