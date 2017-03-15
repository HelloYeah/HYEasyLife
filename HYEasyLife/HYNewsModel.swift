
//
//  HYNewsModel.swift
//  HYEasyLife
//
//  Created by Sekorm on 2017/3/14.
//  Copyright © 2017年 YL. All rights reserved.
//

import Foundation
//"author_name" = "\U7b2c\U4e00\U9ec4\U91d1\U7f51";
//category = "\U5934\U6761";
//date = "2017-03-14 10:45";
//"thumbnail_pic_s" = "http://01.imgmini.eastday.com/mobile/20170314/20170314104517_4263c4167ccb4c19259959c367ab90e1_1_mwpm_03200403.jpeg";
//"thumbnail_pic_s02" = "http://01.imgmini.eastday.com/mobile/20170314/20170314104517_4263c4167ccb4c19259959c367ab90e1_2_mwpm_03200403.jpeg";
//title = "\U6700\U65b01996\U5e741\U5143\U4eba\U6c11\U5e01\U4ef7\U683c \U9644\U7b2c\U56db\U5957\U4eba\U6c11\U5e01\U4ef7\U683c\U8868";
//uniquekey = f1e72059ff01269526b68339cfb9894d;
//url = "http://mini.eastday.com/mobile/170314104517749.html";
class HYNewsModel: NSObject {
    
    var author_name : NSString?
    var category : NSString?
    var date : NSString?
    var thumbnail_pic_s : NSString?
    var thumbnail_pic_s01 : NSString?
    var thumbnail_pic_s02 : NSString?
    var title : NSString?
    var uniquekey : NSString?
    var url : NSString?
    
}
