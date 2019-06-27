//
//  BaseViewModel.swift
//  Base
//
//  Created by wukong on 2019/5/28.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation

 protocol BaseViewModel {
    
    associatedtype warperType
    
    var wkvp:warperType{ get }
}

public class viewModel:BaseViewModel {
    typealias warperType = Int
    var wkvp: warperType
    init(_ vp: Int) {
        self.wkvp = vp
    }
}


public class testViewModel<T:UIViewController>: BaseViewModel {
   
   typealias warperType = UIViewController
   let wkvp:warperType
    init(_ wkvp: UIViewController) {
        self.wkvp = wkvp
    }
}


