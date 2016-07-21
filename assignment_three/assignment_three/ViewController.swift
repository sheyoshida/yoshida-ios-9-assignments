//
//  TableViewController.swift
//  assignment_three
//
//  Created by Shena Yoshida on 7/19/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // MARK: Declaration
    var recipeBook = [Recipe]()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items = [
            Recipe(name: "Red Velvet Cupcakes", cookTime: 30, description: "red chocolate cake with cream cheese icing", ingredients: ["chocolate", "flour", "butter", "cream cheese for frosting"], steps: ["preheat oven to 350", "combine dry ingredients", "combine wet ingredietns", "add dry to wet ingredients and mix until just combined", "bake for 15 minutes"], image: UIImage(named: "cupcake")!),
            
            Recipe(name: "Bananna Split", cookTime: 5, description: "classic ice cream treat", ingredients: ["vanialla ice cream", "bananna", "whipped cream", "cherry"], steps: ["assemble ice cream and bananna in bowl", "top with whipped cream and cherry"], image: UIImage(named: "banana-split")!)
        ]
        
        recipeBook.appendContentsOf(items)
    }
    
    // MARK: Data Source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipeBook.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
        let recipe = recipeBook[indexPath.row]
        
        cell.textLabel?.text = recipe.name
        cell.detailTextLabel?.text = recipe.description
        
        return cell
    }
    
    // MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let detailViewController = segue.destinationViewController as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let recipeToPass = recipeBook[indexPath.row]
                detailViewController.recipeItem = recipeToPass
            }
        }
    }

}

