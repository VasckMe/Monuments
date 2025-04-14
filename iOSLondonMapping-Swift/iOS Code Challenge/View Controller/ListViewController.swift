//
//  ListViewController.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import UIKit
import MapKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    var monuments: [Monument]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Mark: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    }
    
    // Mark: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


