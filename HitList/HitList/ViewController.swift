//
//  ViewController.swift
//  HitList
//
//  Created by Briandito Priambodo on 17/03/19.
//  Copyright © 2019 Briandito Priambodo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hit List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    @IBAction func addNameButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Name", message: "Add a name to the hitlist", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default){
        
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
        
            self.names.append(nameToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
        
    }
    
}

