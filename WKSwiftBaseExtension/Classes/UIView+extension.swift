//
//  UIView+extension.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation

// MARK: - view extension
public extension UIView{
    
    
    /// 设置圆角和边框
    ///
    /// - Parameters:
    ///   - view: view
    ///   - radius: 圆角
    ///   - width: 宽度
    ///   - layerColor: 边框颜色
   public class func viewBorderRadius(view:UIView, radius:CGFloat, width:CGFloat, layerColor:UIColor){
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
        view.layer.borderColor = layerColor.cgColor
        view.layer.borderWidth = width
    }
    
    
    /// 设置圆角
    ///
    /// - Parameters:
    ///   - view: view
    ///   - radius: 圆角
  public class func viewRadius(view:UIView, radius:CGFloat){
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    
    
    
    /// 查找view的特定子view
    ///
    /// - Parameter viewType: 子view类型
    /// - Returns: 子view实例
    public func checkIsHaveView<T>(viewType:T) -> T? {
        var result:T? = nil
        
        for view in self.subviews{
            if view as? T != nil {
                result = view as? T
                break
            }
        }
        return result
    }
    
  public func checkIsHaveView<T>(viewType:T) -> Bool {
    
    if let _:T = self.checkIsHaveView(viewType: viewType){
            return true
        }
        return false
    }
}

