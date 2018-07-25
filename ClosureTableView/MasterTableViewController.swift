//
//  MasterTableViewController.swift
//  ClosureTableView
//
//  Created by dohien on 7/25/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    var numbers = Array(1...10)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = String(numbers[indexPath.row])
        return cell
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                detailViewController.data = String(numbers[index.row])
                detailViewController.callBack = { [unowned self] data in
                    self.numbers[index.row] = Int(data) ?? 0
                }
            } else {
                detailViewController.callBack = { [unowned self] data in
                    self.numbers.append(Int(data) ?? 0)
                }
            }
        }
    }
    
    
}
