//
//  ViewController.swift
//  ToyCollector
//
//  Created by Michael Cruz on 9/19/16.
//  Copyright © 2016 MIchael Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var toys : [Toy] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as!        AppDelegate).persistentContainer.viewContext
        do {
            toys = try context.fetch(Toy.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        let toy = toys[indexPath.row]
        cell.textLabel?.text = toy.title
        cell.imageView?.image = UIImage(data: toy.image as! Data)
        return cell
        
    }
}

