//
//  HYNavigationController.swift
//  HYEasyLife
//
//  Created by Sekorm on 2017/3/10.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class HYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationBar.barTintColor = UIColor.init(red: 252.0/255.0, green: 106/255.0, blue: 8.0/255.0, alpha: 1)
        self.navigationBar.tintColor = UIColor.white
        let disabledTextAttrs = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationBar.titleTextAttributes = disabledTextAttrs
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = UIColor.orange
    }


    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
        if self.childViewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        
    }
}
