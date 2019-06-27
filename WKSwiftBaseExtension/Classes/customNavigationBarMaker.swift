//
//  customNavigationBarMaker.swift
//  Base
//
//  Created by wukong on 2019/5/30.
//  Copyright © 2019年 wukong. All rights reserved.
//

import Foundation
//import OCUtils

let navigationViewTag     = 0x22222220
let customContentVIewTag  = 0x22222221

public enum navType:Int {
    case navTypeDefualt = 0 //隐藏
    case navTypeGray //灰色
    case navTypeWhite //白色
}

public class customNavigationBarMaker:NSObject{
    
    
    private var vc:UIViewController
    
    internal init(_ vc:UIViewController) {
        self.vc = vc
    }
    
    internal static func loadOrignalSubViewStyle(_ vc:UIViewController) {
        
//        vc.navigationController?.navigationBar.isHidden = true
        vc.fd_prefersNavigationBarHidden = true
        let customContentView = UIView()
        customContentView.backgroundColor = UIColor.white
        customContentView.tag = customContentVIewTag
        
        let customNavBarView = customNavigationView()
        customNavBarView.tag = navigationViewTag
        weak var weakVC = vc
        customNavBarView.popVC = {
            weakVC?.popVC()
        }
        vc.view?.addSubview(customContentView)
        vc.view?.addSubview(customNavBarView)
        customNavBarView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(safeAreaTopHeight)
        }
        customContentView.snp.makeConstraints { (make) in
            make.top.equalTo(customNavBarView.snp.bottom).offset(0)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
//            make.center.equalToSuperview()
//            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
//        self.customNavBarView.isHidden = true
    }
    
    
    internal static func popVC(_ vc:UIViewController){
        vc.popVC()
    }
    
    internal static func checkIsHadInitSubViews(_ vc:UIViewController) ->Bool{
        var result = false
        for view in (vc.view!.subviews) {
            if view.tag == navigationViewTag || view.tag == customContentVIewTag{
                result = true
                break
            }
        }
        return result
    }
    
    static func configCustomVc(vc: UIViewController, cloure:(_ UIMaker: customNavigationBarMaker) -> Void){
        //先检查有没有添加自定义的导航栏，没有的话就执行loadOrignalSubViewStyle方法
        if customNavigationBarMaker.checkIsHadInitSubViews(vc) == false{
            customNavigationBarMaker.loadOrignalSubViewStyle(vc)
        }
        //生成一个实例，让实例执行闭包
        let maker = customNavigationBarMaker(vc)
        cloure(maker)
//        return nil
        
    }
    
    static func updateCustomVc(vc: UIViewController, cloure:(_ UIMaker: customNavigationBarMaker) -> Void){
        //先检查有没有添加自定义的导航栏，没有的话就执行loadOrignalSubViewStyle方法
        if customNavigationBarMaker.checkIsHadInitSubViews(vc) == false{
            assert(0 > 1, "error,you should first user config function before set navType. ")
        }
        else{
            //生成一个实例，让实例执行闭包
            let maker = customNavigationBarMaker(vc)
            cloure(maker)
        }
    }
    
    static func gainContentView(_ vc:UIViewController)-> UIView{
        let maker = customNavigationBarMaker(vc)
        return maker.customContenView ?? vc.view!
    }
}


public extension customNavigationBarMaker{
    
    var customContenView:UIView?{
        return self.customContentView()
    }
    
    var customBarView:customNavigationView?{
        return self.customNavBarView()
    }
    
    private  func customNavBarView() -> customNavigationView? {
        
        var tempView:customNavigationView? = nil
        for view in (self.vc.view!.subviews) {
            if view.tag == navigationViewTag{
                tempView = view as? customNavigationView
                break
            }
        }
        return tempView
    }
    
    private func customContentView() -> UIView? {
        var tempView:UIView? = nil
        for view in (self.vc.view.subviews) {
            if view.tag == customContentVIewTag{
                tempView = view
                break
            }
        }
        return tempView
    }
    
    public func navTitle(_ title:String){
        self.customBarView?.navTitle(title)
    }
    
    public func showBlackBackButton() {
        self.customBarView?.showBlackBackBtn()
    }
    
    public func addRightButtons(btns:[UIButton], cloure:@escaping (_ btn:UIButton)->Void){
        self.customBarView?.addRightButtons(btns: btns, cloure: cloure)
    }
    
    
    func updateCustomContenViewWithNarType(_ type:navType){
        
        if(self.customBarView?.backgroundUIType != type){
            self.customBarView!.backgroundUIType = type
            if type == .navTypeDefualt{
                self.customBarView!.isHidden = true
                self.customBarView?.snp.remakeConstraints { (make) in
                    make.top.equalToSuperview()
                    make.left.right.equalToSuperview()
                    make.bottom.equalToSuperview()
                }
            }else{
                self.customBarView!.isHidden = false
                self.customContenView?.snp.remakeConstraints { (make) in
                    make.top.equalTo(self.customBarView!.snp.bottom).offset(0)
                    make.left.right.equalToSuperview()
                    make.bottom.equalToSuperview()
                }
            }
        }
        else{
            assert(1 > 0, "error,you should first user config function,after set navType. ")
            
        }
    }
}

public extension BaseViewController{
    
    public func comfigCustomNavigationUIStyle(_ cloure:(_ UIMaker:customNavigationBarMaker) -> Void){
         customNavigationBarMaker.configCustomVc(vc: self.wkpg, cloure: cloure)
    }
    
    public func updateCustomNavigationUIStyle(_ cloure:(_ UIMaker:customNavigationBarMaker) -> Void){
        
        customNavigationBarMaker.updateCustomVc(vc: self.wkpg, cloure: cloure)
    }
    
    public func gainContentView() -> UIView{
        return customNavigationBarMaker.gainContentView(self.wkpg)
    }
}



