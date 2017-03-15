//
//  HYHomeTableViewCell.swift
//  HYEasyLife
//
//  Created by Sekorm on 2017/3/15.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class HYHomeTableViewCell: UITableViewCell {
    

    var model : HYNewsModel? {
    
        didSet{
            
            self.tileLabel.text = model?.title
            let size = self.tileLabel.sizeThatFits(CGSize(width:UIScreen.main.bounds.width, height:100))
            
            self.tileLabel.frame.size = size
            
            let url = NSURL(string: (model?.thumbnail_pic_s)!)
            if let imageData = try? NSData.init(contentsOf: url! as URL, options:NSData.ReadingOptions.mappedRead){
                self.picView.image = UIImage.init(data:imageData as Data)
                self.picView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200 - self.tileLabel.frame.height)
                self.picView.frame.origin = CGPoint(x: 0, y:self.tileLabel.frame.height)
            }
        
        }
    }
    
    private let tileLabel : UILabel = {
    
        let tileLabel = UILabel()
       
        tileLabel.font = UIFont.systemFont(ofSize: 15)
        tileLabel.textColor = UIColor.red
        tileLabel.numberOfLines = 0
        return tileLabel
    }()
    
    private let picView : UIImageView = {
        
        let picView = UIImageView()
        
        return picView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        self.addSubview(self.tileLabel)
        self.addSubview(self.picView)
    }
    
    
}
