//
//  HYUserViewController.swift
//  HYEasyLife
//
//  Created by Sekorm on 2017/3/10.
//  Copyright © 2017年 YL. All rights reserved.
// 

import UIKit

class HYUserViewController: UIViewController {

    let tableView = UITableView()
    var headerView : UIView = {
    
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 240.0))
        let backgroudImageView = UIImageView.init(frame: headerView.bounds)
        headerView.addSubview(backgroudImageView)
        backgroudImageView.image = UIImage.init(named: "1")
        
        let userBorderView = UIView.init(frame: CGRect(x: 0, y: 0, width: 90.0, height: 90.0))
        userBorderView.center = CGPoint(x: headerView.bounds.width * 0.5 , y: headerView.bounds.height * 0.5 + 32);
        userBorderView.backgroundColor = UIColor.white
        headerView.addSubview(userBorderView)
        userBorderView.layer.cornerRadius = 45
        userBorderView.layer.masksToBounds = true
        
        let userIcon = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        userIcon.image = UIImage.init(named: "head_portrait")
        userIcon.layer.cornerRadius = 40
        userIcon.layer.masksToBounds = true
        userIcon.center = CGPoint(x: userBorderView.bounds.width * 0.5 , y: userBorderView.bounds.height * 0.5);
        userBorderView.addSubview(userIcon)
        return headerView
    }()
    
    var userInfoArray : [(imageName: String , titleName: String, TargetController: String)] = {
        
        let userInfoArray = [("myVip_icon","我的特权","HYMyVipController"),("myWallets_icon","我的钱包","HYMyWalletsController"),("myActivity_icon","我的活动","HYMyActivityController"),("myQuestion_icon","我的提问","HYMyQuestionController"),("myAnswer_icon","我的答案","HYMyAnswerController")]
        
        return userInfoArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellReusableID")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.alpha = 0
    }
}

extension HYUserViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellReusableID", for: indexPath)
        let yuanzu = userInfoArray[indexPath.row]
        cell.imageView?.image = UIImage(named: yuanzu.imageName)
        cell.textLabel?.text = yuanzu.titleName
        cell.textLabel?.textColor = UIColor.orange
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yuanzu = userInfoArray[indexPath.row]
        let tagartVCString = yuanzu.TargetController
        // 1.获取命名空间
        // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return
        }
        // 2.通过命名空间和类名转换成类
        let tagartVC : AnyClass? = NSClassFromString((clsName as! String) + "." + tagartVCString)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = tagartVC as? UIViewController.Type else {
            print("无法转换成UIViewController")
            return
        }
        // 3.通过Class创建对象
        let childController = clsType.init()
        childController.title = yuanzu.titleName
        self.navigationController?.pushViewController(childController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let alphe = offsetY / self.headerView.bounds.height
        self.navigationController?.navigationBar.alpha = alphe
    }
}
