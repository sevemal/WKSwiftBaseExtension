//
//  BaseViewUIStyleProtocol.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation


/// view的视图初始化方法
public protocol BaseViewUIStyleProtocol {
    
    func initViewUIStyle()
}

public protocol BaseMaker{
    
    func initView(vc:UIViewController, view:UIView, closure:(_ maker: Self)->Void) -> Void
    func updateView(vc:UIViewController, view:UIView, closure:(_ maker: Self)->Void) -> Void
}



