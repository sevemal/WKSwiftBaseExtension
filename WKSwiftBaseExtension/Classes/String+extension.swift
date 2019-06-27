//
//  String+extension.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation

// MARK: - string extension
public extension String{
    
    
    /// string的安全性,nil会返回空
    ///
    /// - Parameter str: str?
    /// - Returns: 返回非nil的str
    static func safeStr(_ str:String?)->String{
        if let tempStr = str {
            return tempStr
        }else{
            return ""
        }
    }
}
