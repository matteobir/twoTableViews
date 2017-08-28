//
//  ViewController.swift
//  twoTableViews
//
//  Created by apcs2 on 8/23/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var selectedTableView: UITableView!
    @IBOutlet weak var regularTableView: UITableView!
var pizzaToppings = ["Pepperoni","Cheese","Sausage","Pineapple","Broccoli"]
    var selectedToppings = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
      }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       if tableView.isEqual(selectedTableView)
       {
        return selectedToppings.count
        
        }
    if tableView.isEqual(regularTableView)
    {
        return pizzaToppings.count
    
        }
    else
    {
        return 100000000000000
        }
    }
    
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        
        if tableView.isEqual(selectedTableView)
        {
            let cell = selectedTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

          
            cell.textLabel?.text = selectedToppings[indexPath.row]
            
            return cell
            }

        
       if tableView.isEqual(regularTableView)
       {
        let Cell = regularTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        Cell.textLabel?.text = pizzaToppings[indexPath.row]
        
        return Cell
        }
        else
        {
    let cell = regularTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          cell.textLabel?.text = "nope"
            return cell
    }
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
      if tableView.isEqual(regularTableView)
      {
        selectedToppings.append(pizzaToppings[indexPath.row])
        selectedTableView.reloadData()
        pizzaToppings.remove(at: indexPath.row)
        regularTableView.reloadData()
        }
        if tableView.isEqual(selectedTableView)
        {
              pizzaToppings.append(selectedToppings[indexPath.row])
            selectedToppings.remove(at: indexPath.row)
            regularTableView.reloadData()
            selectedTableView.reloadData()

        }

    }
}

