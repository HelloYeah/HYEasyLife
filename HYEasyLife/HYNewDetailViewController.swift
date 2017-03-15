

//
//  HYNewDetailViewController.swift
//  HYEasyLife
//
//  Created by Sekorm on 2017/3/15.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit
import WebKit

class HYNewDetailViewController: UIViewController {
    
    
    var url : String?
    
    var webView : WKWebView = {
        
        let webView = WKWebView()
        webView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return webView
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(self.webView)
        let url = URL.init(string: self.url!)!
        let request = URLRequest.init(url: url )
        self.webView.load(request as URLRequest)
    }
}
