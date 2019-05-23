//
//  ViewController.swift
//  TodoApp
//
//  Created by honda-yusuke on 2019/05/23.
//  Copyright © 2019 honda-yusuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController { 
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    private var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = [
            "abc", "efg", "hoge",
            "hoge", "hoge", "hoge",
            "hoge", "hoge", "hoge",
            "hoge", "hoge", "hoge",
            "hoge", "hoge", "hoge",
            "hoge", "hoge", "hoge",
            "hoge", "hoge", "hoge",
            "ほんだ"
        ]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
