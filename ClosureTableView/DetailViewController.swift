//
//  DetailViewController.swift
//  ClosureTableView
//
//  Created by dohien on 7/25/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var namwTextField: UITextField!
    var data : String?
    var callBack : ((_ data: String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            namwTextField.text = data
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveData(_ sender: UIButton) {
        guard let data = namwTextField.text else { return }
        callBack?(data)
        navigationController?.popViewController(animated: true)
    }
}
