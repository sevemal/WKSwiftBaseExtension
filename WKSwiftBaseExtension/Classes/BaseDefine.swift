//
//  BaseDefine.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation

/// 系统版本
public let SYSTEM_VERSION:Float = Float(UIDevice.current.systemVersion)!

/// 屏幕宽
public let SCREEN_WIDTH:CGFloat = UIScreen.main.bounds.size.width

/// 屏幕高
public let SCREEN_HEIGHT:CGFloat = UIScreen.main.bounds.size.height

/// 屏幕bounds
public let SCREEN_BOUNDS:CGRect = UIScreen.main.bounds

/// 状态栏高
public let STATUS_BAR_HEIGHT:CGFloat = UIApplication.shared.statusBarFrame.size.height

/// 导航栏高度,包括状态栏
public let safeAreaTopHeight:CGFloat = STATUS_BAR_HEIGHT + 44

/// 底部安全高度
public let safeAreaBottomHeight:CGFloat = (STATUS_BAR_HEIGHT > 22) ? 34 : 0

/// tabbar高度
public let safeTabBarHeight:CGFloat = (STATUS_BAR_HEIGHT > 22) ? (49 + safeAreaBottomHeight) : 49
