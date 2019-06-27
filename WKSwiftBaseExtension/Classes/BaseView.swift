//
//  BaseView.swift
//  smartHomeMoudlesDemo
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import UIKit
import SnapKit

open class baseView:UIView,BaseViewUIStyleProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViewUIStyle()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func initViewUIStyle() {
        
    }
}

