//
//  HYHomeViewController.swift
//  HYEasyLife
//
//  Created by Sekorm on 2017/3/10.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class HYHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    var count = 10
    
    var dataArray : [HYNewsModel]?
    
    lazy var tableView : UITableView = {
    
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HYHomeTableViewCell.self, forCellReuseIdentifier: "HYHomeTableViewCell")
        return tableView
        
    }()
    
    lazy var refreshControl : UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.lightGray
        let attributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        refreshControl.attributedTitle = NSAttributedString(string: "Last updated on  \(Date())", attributes: attributes)
        refreshControl.tintColor = UIColor.white
        return refreshControl
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.title = "首页"
        self.view.addSubview(self.tableView)
        tableView.refreshControl = self.refreshControl
        tableView.refreshControl?.addTarget(self, action: #selector(HYHomeViewController.refreshData), for: .valueChanged)
        self.refreshData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = self.dataArray?.count
        if count != nil {
            return count!;
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        NSArray
        let cell = tableView.dequeueReusableCell(withIdentifier: "HYHomeTableViewCell", for: indexPath) as! HYHomeTableViewCell
        let model = self.dataArray![indexPath.row]
        cell.model = model
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let newDetail = HYNewDetailViewController()
        let model = self.dataArray![indexPath.row]
        newDetail.url = model.url
        self.navigationController?.pushViewController(newDetail, animated: true)
    }
    
    func refreshData()  {
        
        self.count += 10
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
        let path = "/toutiao/index"
        let method = "GET"
        let querys = "?type=type"
        let url = HYNewsApi + path + querys
        var request = URLRequest.init(url: URL.init(string: url)!)
        request.httpMethod = method
        request.addValue("APPCODE " + AppCode, forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { (data, _, _) -> Void in
            
            do {
                let dictData = try JSONSerialization.jsonObject(with: data!, options:.mutableLeaves)
                
                let dict = dictData as! NSDictionary
                let resultDict = dict["result"] as! NSDictionary
                let list = resultDict["data"] as! [[String:AnyObject]]
                self.dataArray = HYNewsModel.dictToModel(list: list)
                self.tableView.reloadData()
                print(dict)
            } catch {   // 如果反序列化失败，能够捕获到 json 失败的准确原因，而不会崩溃
                print(error)
            }
        }) as URLSessionTask
        
        task.resume()
    }
}


