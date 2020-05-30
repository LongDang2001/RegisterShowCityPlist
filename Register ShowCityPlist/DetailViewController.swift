//
//  DetailViewController.swift
//  Register ShowCityPlist
//
//  Created by admin on 3/30/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var disTricts: [getDistricts] = []
    var citiCode: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        if citiCode != nil {
            disTricts = DataService.share.getPlist(citiData: citiCode!)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disTricts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCellDetail", for: indexPath) as? DetailTableViewCell
        cell?.lbName.text = disTricts[indexPath.row].name
        cell?.lbCodeCiti.text = String(disTricts[indexPath.row].codeCiti)
        cell?.lbCodeDisTricts.text = String(disTricts[indexPath.row].codeDistricts)
        
        return cell!
    }
}
