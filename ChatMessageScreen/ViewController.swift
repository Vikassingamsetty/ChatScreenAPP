//
//  ViewController.swift
//  ChatMessageScreen
//
//  Created by Appcare Apple on 30/08/20.
//  Copyright © 2020 Appcare Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabel: UITableView!
    
    let names = ["vikas", "vinay", "viswas", "vivek"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabel.delegate = self
        tabel.dataSource = self
        
        tabel.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tabel.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabel.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        cell.imageView?.image = #imageLiteral(resourceName: "Mask Group 31 (1)")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tabel.deselectRow(at: indexPath, animated: true)
        
        let vc = ChatViewController()
        vc.title = "Messages"
        navigationController?.pushViewController(vc, animated: true)
    }

}

