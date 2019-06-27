//
//  UIImage+extension.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation

// MARK: - image extension
public extension UIImage{
    
   /// image生成器
   ///
   /// - Parameter name: image名称
   /// - Returns: image实例
   public class func ImageWithName(_ name:String) -> UIImage?{
        return UIImage.init(named: name)
        
    }
}

