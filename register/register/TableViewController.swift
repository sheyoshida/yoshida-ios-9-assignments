//
//  ViewController.swift
//  register
//
//  Created by Shena Yoshida on 8/1/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    // MARK: Declaration
    
    var shoppingCart = [Item]()
    var totalPrice: Float = 0.0
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView?.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    // MARK: Actions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "AddItemStoryboard", bundle: nil)
        
        if let addNavigationController = storyboard.instantiateViewControllerWithIdentifier("AddItemNavID") as? UINavigationController, let addViewController = addNavigationController.topViewController as? MenuViewController
        {
             presentViewController(addNavigationController, animated: true, completion: {
                self.totalPrice = 0.0
                self.tableView.tableFooterView?.hidden = false
            })
        }
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        shoppingCart.removeAll()
        totalPrice = 0.0
        self.tableView.tableFooterView?.hidden = true
        tableView.reloadData()
    }
    
    // MARK: Table View Data Source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return shoppingCart.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        let itemChosen = shoppingCart[indexPath.row]
        
        cell.detailTextLabel?.text = "price: $" + String(itemChosen.price)
        cell.textLabel?.text = itemChosen.name
        cell.imageView?.image = itemChosen.image
        
        // add up items and store in variable
        totalPrice += itemChosen.price
        
        return cell
    }
    
    // MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let detailViewController = segue.destinationViewController as? CheckoutViewController {
            let itemCount = shoppingCart.count
            detailViewController.itemCount = itemCount
            detailViewController.itemTotalPrice = totalPrice
        }
    }
}

extension MenuTableViewController: AddItemDelegate {
    func userAddedItem(item: Item) {
        shoppingCart.append(item)
        tableView.reloadData()
    }
}

