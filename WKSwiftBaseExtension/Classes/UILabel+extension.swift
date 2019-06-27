//
//  UILabel+extension.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation


// MARK: - 应用使用的label样式
public extension UILabel{
    
    
    /// label初始化
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - textColor: 字体颜色
    ///   - text: 内容
    /// - Returns: label
   public class func customLabelWithStyle(font:UIFont?, textColor:UIColor?,text:String?,Alignment:NSTextAlignment?)->UILabel{
        let label =  UILabel.customLabelWithStyle(font: font, textColor: textColor, text: text, backGroudColor: nil, cornerRadius: 0, layerColor:nil, layerWidth: 0)
        if Alignment != nil{
            label.textAlignment = Alignment!
        }
        
        return label
        
    }
    
    /// label初始化
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - textColor: 字体颜色
    ///   - text: 内容
    ///   - backGroudColor: 背景色
    ///   - cornerRadius: 圆角
    ///   - layerColor: 圆角边框颜色
    ///   - layerWidth: 边框宽度
    /// - Returns: label
   public class func customLabelWithStyle(font:UIFont?,
                                    textColor:UIColor?,
                                    text:String?,
                                    backGroudColor:UIColor?,
                                    cornerRadius:CGFloat,
                                    layerColor:UIColor?,
                                    layerWidth:CGFloat) ->UILabel{
        let label = UILabel()
        
        if let textFont:UIFont = font {
            label.font = textFont
        }else{
            label.font = UIFont.customFont(16)
        }
        
        if let color:UIColor = textColor {
            label.textColor = color
        }else{
            label.textColor = UIColor.black;
        }
        
        label.text = String.safeStr(text)
        
        if let tempBackGroudColor:UIColor = backGroudColor{
            
            label.backgroundColor = tempBackGroudColor
            
        }else{
            
        }
        
        if cornerRadius > 0 && layerColor != nil && layerWidth > 0{
            
            UIView.viewBorderRadius(view: label, radius: cornerRadius, width: layerWidth, layerColor: layerColor!)
        }else if cornerRadius > 0 && (layerColor == nil || layerWidth <= 0){
            UIView.viewRadius(view: label, radius: cornerRadius)
        }
        return label
    }
}
