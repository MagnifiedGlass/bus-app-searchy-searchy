//
//  ViewController.swift
//  BusTracker
//
//  Created by Adithya Pillai on 11/21/19.
//  Copyright © 2019 Adithya Pillai. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var BusSearchbar: UISearchBar!
    @IBOutlet weak var BusTableView: UITableView!
    
    let busList = ["101", "103" , "105" , "106" , "108" , "109" , "111" , "113" , "115" , "116" , "117" , "118" , "119" , "121" , "123" , "124" , "130" , "131" , "136" , "137" , "146"]
    
    var searchBusList = [ String ]()
    
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchBusList.count
        } else {
            return busList.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching {
            cell.textLabel?.text = searchBusList[indexPath.row]
        } else {
            cell.textLabel?.text = busList[indexPath.row]
        }
        return cell
        
    }
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBusList = busList.filter({$0.lowercased().prefix(searchText.count) == searchText})
        BusTableView.reloadData()
        searching = true
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        BusTableView.reloadData()
    }
}
