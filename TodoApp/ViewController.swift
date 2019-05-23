//
//  ViewController.swift
//  TodoApp
//
//  Created by honda-yusuke on 2019/05/23.
//  Copyright © 2019 honda-yusuke. All rights reserved.
//

import UIKit

struct Task {
    let name: String
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    private var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAdd() {
        let alert = UIAlertController(title: "", message: "Input new task name", preferredStyle: .alert)
        alert.addTextField { (textField) in }
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: { (_) in
                            let textField = alert.textFields?.first
                            if let text = textField?.text {
                                self.tasks.append(Task(name: text))
                                self.tableView.reloadData()
                            }
            })
        )
        
        present(alert, animated: true, completion: nil)
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
        cell.textLabel?.text = tasks[indexPath.row].name
        return cell
    }
}
