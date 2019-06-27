//
//  customNavigationView.swift
//  Base
//
//  Created by wukong on 2019/5/15.
//  Copyright © 2019年 wukong. All rights reserved.
//

import UIKit


public typealias popVCClosure = () -> Void

typealias buttonClickClosure = (_ btn:UIButton) ->Void

public class customNavigationView: UIView {
    
    fileprivate let black_backImgName:String = "ic_top_back_black"
    public var popVC:popVCClosure?
    
    open var backBtn:UIButton? = nil
    open var rightBtnArr:[UIButton]? = nil
    fileprivate var btnClickClosure:buttonClickClosure? = nil
    
    open var backgroundUIType:navType = .navTypeDefualt {
        didSet{
            switch backgroundUIType {
            case .navTypeDefualt:
                break
            case .navTypeGray:
                self.backgroundColor = UIColor.gray
                break
            case .navTypeWhite:
                self.backgroundColor = UIColor.white
                break
            }
        }
    }
    
    lazy open var customTitleView:UIView = {
        ()->UIView in
        return UIView()
    }()

    lazy open var customTitleLabel:UILabel = {
        ()->UILabel in
        return UILabel.customLabelWithStyle(font: UIFont.boldSystemFont(ofSize: 20), textColor: UIColor.RGBColorWithHex(0x333333), text: "", Alignment: .center)
    }()
    

    override init(frame: CGRect) {

        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        self.initSubViewStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initSubViewStyle(){
        self.addSubview(self.customTitleView)
        self.customTitleView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
            make.left.equalTo(100)
            make.width.equalTo(SCREEN_WIDTH - 2 * 100)
            make.bottom.equalToSuperview()
        }

        self.customTitleView.addSubview(self.customTitleLabel)
        self.customTitleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
    }

    
    /// 设置导航栏title
    ///
    /// - Parameter title: title
    public func navTitle(_ title:String){
        self.customTitleLabel.text = title
    }
    
    
    
    /// 设置图片返回键
    public func showBlackBackBtn(){
        self.backBtn = UIButton.customButtonStyle(tagert: self, method: #selector(backBtnClick(button:)), normalTitle: nil, normalTitleColor: nil, textFont: nil)
        let img1 = UIImage(named: "Frameworks/WKSwiftBaseExtension.framework/WKSwiftBaseExtension.bundle/ic_top_back_black")
//        let img = UIImage(named: "ic_top_back_black", in: bundle, compatibleWith: nil)
        self.backBtn?.isHidden = false
        self.backBtn?.setImage(img1, for: .normal)
        self.addSubview(self.backBtn!)
        self.backBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(8)
            make.height.equalTo(44)
            make.width.equalTo(40)
            make.bottom.equalToSuperview()
        })

    }

    @objc func  backBtnClick(button:UIButton){
        if self.popVC != nil{

            self.popVC!()
        }
    }
    
  public  func addRightButtons(btns:[UIButton], cloure:@escaping (_ btn:UIButton)->Void) {
        self.btnClickClosure = nil
        self.rightBtnArr = btns
        self.btnClickClosure = cloure
        let button = btns[0]
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 40, height: 44))
            make.bottom.equalToSuperview()
            make.right.equalTo(-8)
        }
        button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
    }
    
    @objc func  button(button:UIButton){
        if self.btnClickClosure != nil{
            self.btnClickClosure!(button)
        }
    }
    
}

extension UIViewController{
    func  popVC() {
        self.dismiss(animated: true) {
            
        }
    }
}
