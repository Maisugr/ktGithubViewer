//
//  ktContributorsViewController.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/21/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import UIKit


class ktContributorsViewController: UITableViewController {
    
    private var contributors : [Repo] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contributors.count
    }
    
    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTypeIdentifier", for: indexPath)
        
        // Configure the cell’s contents.
        cell.textLabel!.text = "Cell text"
        
        return cell
    }
}
