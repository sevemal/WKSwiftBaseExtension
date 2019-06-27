//
//  UIcolor+extension.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation


// MARK: - color extension
public extension UIColor{
    
    
    /// 16进制颜色生成
    ///
    /// - Parameter hexColor: 16进制颜色
    /// - Returns: 颜色
  public  class func RGBColorWithHex(_ hexColor:Int) ->UIColor{
        return RGBColorWithHex_Alpha(hexColor: hexColor, a: 1.0)
    }
    
    /// 16进制颜色生成
    ///
    /// - Parameters:
    ///   - hexColor: 16进制颜色
    ///   - a: alpha
    /// - Returns: 颜色
  public class func RGBColorWithHex_Alpha(hexColor:Int, a:CGFloat) ->UIColor{
        let tempHex:Int? = Int(hexColor)
        if(tempHex != nil){
            let r:CGFloat = CGFloat((tempHex! & 0xFF0000) >> 16)
            let g:CGFloat = CGFloat((tempHex! & 0xFF00) >> 8)
            let b:CGFloat = CGFloat((tempHex! & 0xFF))
            return RGBColorAlpha(r: r, g: g, b: b, a: a)
            
        }else{
            return UIColor.black
        }
    }
    
    /// 颜色生成
    ///
    /// - Parameters:
    ///   - r: red
    ///   - g: green
    ///   - b: bule
    ///   - a: alpha
    /// - Returns: 颜色
   public  class func RGBColorAlpha(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
        
        let originalColor:UIColor = UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
        return originalColor
    }
}
