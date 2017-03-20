
//
//  HYTabBarController.swift
//  HYEasyLife
//
//  Created by Sekorm on 2017/3/10.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class HYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addOneChildVC(vc: HYHomeViewController(), imageName: "TabBarHome", title: "首页")
        self.addOneChildVC(vc: HYDiscoverController(), imageName: "TabBarBrand", title: "发现")
        self.addOneChildVC(vc: HYUserViewController(), imageName: "TabBarUser", title: "用户")
        self.tabBar.barTintColor = UIColor.white
    }
    
    func addOneChildVC(vc: UIViewController, imageName: String , title: String) {
        
        let nav = HYNavigationController()
        vc.navigationItem.title = title
        nav.addChildViewController(vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage.init(named: imageName)
        nav.tabBarItem.selectedImage = UIImage.init(named: imageName + "Selected")
        nav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orange], for: UIControlState.selected)
        self.addChildViewController(nav)
    }
    
}
