
//
//  HYMyQuestionController.swift
//  HYEasyLife
//
//  Created by Sekorm on 2017/3/20.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class HYMyQuestionController: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let constant = Float(arc4random() % 255) / 255.0
        self.view.backgroundColor = UIColor.init(colorLiteralRed: constant, green: constant, blue: constant, alpha: 1)
    }
}
