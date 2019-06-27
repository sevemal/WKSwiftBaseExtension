//
//  UIFont+extension.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation


// MARK: - font extension
public extension UIFont{
    
    
   /// 生成font
   ///
   /// - Parameter size: font 大小
   /// - Returns: font实例
   public class func customFont(_ size:CGFloat) ->UIFont?{
        
        return UIFont.systemFont(ofSize:size)
    }
    
    
   /// 生成font
   ///
   /// - Parameters:
   ///   - fontName: 字体名称
   ///   - size: font大小
   /// - Returns: font实例
   public class func customFontWithName(fontName:String, size:CGFloat) ->UIFont?{
        
        return UIFont.init(name: fontName, size: size)
        
    }
}
