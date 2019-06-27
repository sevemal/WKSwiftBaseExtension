//
//  ViewController.swift
//  WKSwiftBaseExtension
//
//  Created by sevemal@126.com on 06/27/2019.
//  Copyright (c) 2019 sevemal@126.com. All rights reserved.
//

import UIKit
import WKSwiftBaseExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.wkvc.comfigCustomNavigationUIStyle { (maker) in
            maker.navTitle("test")
            maker.showBlackBackButton()
        }
        
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

