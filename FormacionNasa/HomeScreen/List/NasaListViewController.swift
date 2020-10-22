//
//  NasaListViewController.swift
//  FormacionNasa
//
//  Created by Ruben Higueras Galan on 15/10/2020.
//  Copyright © 2020 Ruben Higueras Galan. All rights reserved.
//

import UIKit

class NasaListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
     let items = ["Item 1", "Item2", "Item3", "Item4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UINib(nibName: "NasaTableViewCell", bundle: nil), forCellReuseIdentifier: "nasaTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nasaTableViewCell", for: indexPath) as! NasaTableViewCell
        cell.titleLabel.text = items[indexPath.row]

        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
