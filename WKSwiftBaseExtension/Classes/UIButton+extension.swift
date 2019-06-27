//
//  UIButton+extension.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation

// MARK: - 应用使用的uibutton样式
public extension UIButton{
    
    
    /// 设置选中状态下的button样式
    ///
    /// - Parameters:
    ///   - highTitle: 选中时的title
    ///   - highTitleColor: 选中的title颜色
    ///   - hightextFont: 选中的字体
  public  func makeButtonSelectedStyle(highTitle:String?,
                                 highTitleColor:UIColor?,
                                 hightextFont:UIFont?){
        if let high_title:String = highTitle {
            self.setTitle(high_title, for: .selected)
        }else{
            //            if self.currentTitle != nil {
            //                self.setTitle(self.currentTitle, for: .selected)
            //            }
        }
        
        if let high_titleColor:UIColor = highTitleColor {
            self.setTitleColor(high_titleColor, for: .selected)
        }else{
        }
        
        if let high_textFont:UIFont = hightextFont {
            self.titleLabel?.font = high_textFont
        }
    }
    
    /// 设置禁止状态下的button样式
    ///
    /// - Parameters:
    ///   - disableTitle: 禁止时的title
    ///   - disableTitleColor: 禁止时的title color
    ///   - disableTextFont: 禁止时的title font
   public func makeButtonDisableStyle(disableTitle:String?,
                                disableTitleColor:UIColor?,
                                disableTextFont:UIFont?){
        if let disable_title:String = disableTitle {
            self.setTitle(disable_title, for: .disabled)
        }else{
            //            if self.currentTitle != nil {
            //                self.setTitle(self.currentTitle, for: .selected)
            //            }
        }
        
        if let disable_titleColor:UIColor = disableTitleColor {
            self.setTitleColor(disable_titleColor, for: .disabled)
        }else{
        }
        
        if let disable_textFont:UIFont = disableTextFont {
            self.titleLabel?.font = disable_textFont
        }
    }
    
    
    /// 设置button背景
    ///
    /// - Parameters:
    ///   - backgroudImg: 背景img
    ///   - highBackgroudImg: 选中的img
    ///   - disableBackgroundImg: 禁止时的img
    ///   - backgroudColor: 背景颜色
  public  func makeButtonBackgroundStyle(backgroudImg:UIImage?,
                                   highBackgroudImg:UIImage?,
                                   disableBackgroundImg:UIImage?,
                                   backgroudColor:UIColor?){
        if let backImg:UIImage = backgroudImg {
            self.setBackgroundImage(backImg, for: .normal)
        }
        if let high_bakeImg:UIImage = highBackgroudImg {
            self.setBackgroundImage(high_bakeImg, for: .selected)
        }
        if let disalble_bakeImg:UIImage = backgroudImg {
            self.setBackgroundImage(disalble_bakeImg, for: .disabled)
        }
        
        if let backColor:UIColor = backgroudColor {
            self.backgroundColor = backColor
        }
    }
    
    
   public func makeButtonCornerRadiusStyle(cornerRadius:CGFloat,
                                     layerColor:UIColor?,
                                     layerWidth:CGFloat){
        if cornerRadius > 0 && layerColor != nil && layerWidth > 0{
            
            UIView.viewBorderRadius(view:self, radius: cornerRadius, width: layerWidth, layerColor: layerColor!)
        }else if cornerRadius > 0 && (layerColor == nil || layerWidth <= 0){
            
            UIView.viewRadius(view: self, radius: cornerRadius)
        }
    }
    
    /// 应用使用的button
    ///
    /// - Parameters:
    ///   - tagert: 观察者
    ///   - method: 关联的方法
    ///   - normalTitle: 正常title
    ///   - normalTitleColor: 正常title颜色
    ///   - textFont: 字体大小
    /// - Returns: button
  public  class func customButtonStyle(tagert:Any,
                                 method:Selector,
                                 normalTitle:String?,
                                 normalTitleColor:UIColor?,
                                 textFont:UIFont?)->UIButton{
        
        let button:UIButton = UIButton.init(type:.custom)
        
        if let title:String = normalTitle {
            button.setTitle(title, for: .normal)
            button.setTitle(title, for: .selected)
            button.setTitle(title, for: .disabled)
        }else{
            button.setTitle("", for: .normal)
            button.setTitle("", for: .selected)
            button.setTitle("", for: .disabled)
        }
        
        if let titleColor:UIColor = normalTitleColor {
            button.setTitleColor(titleColor, for: .normal)
        }else{
            
        }
        
        if let titleFont:UIFont = textFont {
            button.titleLabel?.font = titleFont
        }
        button.addTarget(tagert, action: method, for: .touchUpInside)
        
        return button
        
    }
    
    
    /// 应用使用的button
    ///
    /// - Parameters:
    ///   - tagert: tagert
    ///   - method: 点击method
    ///   - normalImg: normalImg
    ///   - highImg: highImg
    ///   - disableImg: disabelImg
    /// - Returns: button
  public  class func customImgButtonStyle(tagert:Any,
                                    method:Selector,
                                    normalImg:UIImage?,
                                    highImg:UIImage?,
                                    disableImg:UIImage?)->UIButton{
        
        let button:UIButton = UIButton.init(type:.custom)
        button.setImage(normalImg, for: .normal)
        
        if let tempnormalImg:UIImage = normalImg{
            button.setImage(tempnormalImg, for: .normal)
        }
        
        if let tempHighImg:UIImage = highImg{
            button.setImage(tempHighImg, for: .selected)
        }
        
        if let tempDisabelImg:UIImage = disableImg {
            button.setImage(tempDisabelImg, for: .disabled)
        }
        button .addTarget(tagert, action: method, for: .touchUpInside)
        
        return button
        
    }
}
