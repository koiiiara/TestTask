//
//  ViewController.swift
//  TestTask
//
//  Created by Илья Миронов on 16.07.2020.
//  Copyright © 2020 Ilya Mironov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var selectedRowId: UILabel!
    @IBOutlet var selectedSegmentId: UILabel!
    
    var jsonContent: JSONData?
    let urlString = "https://pryaniky.com/static/json/sample.json"
    var viewArray = [String()]
    var data = [String: JSONObjects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: urlString)
        
        receiveJSONData(from: url!) { receiveData in
        self.jsonContent = receiveData
            for i in receiveData.data {
                self.data[i.name] = i
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()}
            }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonContent?.view.count ?? 0
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let contentCell = cell as? ContentCell else {
            return cell
        }

        let object = data[jsonContent!.view[indexPath.row]]
        contentCell.configure(for: object)
        contentCell.segmentControlView.addTarget(self, action: #selector(ViewController.valueChanged(_:)), for: .valueChanged)
        return contentCell as UITableViewCell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSegmentId.isHidden = true
        selectedRowId.text = jsonContent!.view[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    @objc func valueChanged(_ sender: UISegmentedControl) {
        selectedSegmentId.isHidden = false
        selectedRowId.text = ""
        switch sender.selectedSegmentIndex {
        case 0:
            selectedSegmentId.text = "0"
        case 1:
            selectedSegmentId.text = "1"
        case 2:
            selectedSegmentId.text = "2"
        default:
            return
          }
      }
}

