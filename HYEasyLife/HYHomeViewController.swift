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
    
    lazy var tableView : UITableView = {
    
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.section)+\(indexPath.row)"
        return cell
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
                
                let dict = NSDictionary(data: dictData, encoding: )
//                params["list"] = dict
//                let result =
//                print(result)
            } catch {   // 如果反序列化失败，能够捕获到 json 失败的准确原因，而不会崩溃
                print(error)
            }
        }) as URLSessionTask
        
        task.resume()
    }
    
}
