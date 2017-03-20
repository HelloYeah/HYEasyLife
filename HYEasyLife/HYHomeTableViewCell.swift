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
            self.picView.image = nil
            let size = self.tileLabel.sizeThatFits(CGSize(width:UIScreen.main.bounds.width, height:100))
            
            self.tileLabel.frame.size = size
            
            let url = URL(string: (model?.thumbnail_pic_s)!)
        
            //创建请求对象
            let request = URLRequest(url: url!)
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request, completionHandler: {
                (data, response, error) -> Void in
                if error != nil{
                    print(error.debugDescription)
                }else{
                    //将图片数据赋予UIImage
                    let img = UIImage(data:data!)
                    self.picView.image = img
                    self.picView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200 - self.tileLabel.frame.height)
                    self.picView.frame.origin = CGPoint(x: 0, y:self.tileLabel.frame.height)
                }
            }) as URLSessionTask
            
            //使用resume方法启动任务
            dataTask.resume()

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
