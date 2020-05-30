//
//  ViewController.swift
//  Register ShowCityPlist
//
//  Created by admin on 3/29/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayPlist: [String] = [String]()
    var city: [GetCity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        city = DataService.share.getCityOfPlist()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as? TableViewCell
        cell?.lbNameCity.text = city[indexPath.row].name
        cell?.blCodeCity.text = String(city[indexPath.row].codeCity)
        
//        cell.textLabel?.text = city[indexPath.row].name
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailviewcontroller = segue.destination as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                detailviewcontroller.citiCode = DataService.share.cities[index.row].codeCity
            }
        }
    }
}




