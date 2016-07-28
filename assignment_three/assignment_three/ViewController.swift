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
            Recipe(name: "Red Velvet Cupcakes", cookTime: 30, description: "Chocolate cake with cream cheese icing.", ingredients: ["chocolate", "flour", "butter", "cream cheese for frosting"], steps: ["preheat oven to 350", "combine dry ingredients", "combine wet ingredietns", "add dry to wet ingredients and mix until just combined", "bake for 15 minutes"], image: UIImage(named: "cupcake")!),
            
            Recipe(name: "Bananna Split", cookTime: 5, description: "That classic ice cream treat.", ingredients: ["vanialla ice cream", "bananna", "whipped cream", "cherry"], steps: ["assemble ice cream and bananna in bowl", "top with whipped cream and cherry"], image: UIImage(named: "banana-split")!)
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
    
    // MARK: Segue to Detail View
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let detailViewController = segue.destinationViewController as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let recipeToPass = recipeBook[indexPath.row]
                detailViewController.recipeItem = recipeToPass
            }
        }
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        // AddRecipeNavigationStoryboardID
        
        let storyboard = UIStoryboard(name: "AddItemViewController", bundle: nil)
        
        if let addNavigationController = storyboard.instantiateViewControllerWithIdentifier("AddRecipeNavigationStoryboardID") as? UINavigationController,
            let addViewController = addNavigationController.topViewController as? AddItemViewController {
            addViewController.delegate = self  // step 3 - set delegate property of vc to self
            presentViewController(addNavigationController, animated: true, completion: {
                print("success!")
            })
        }
    }
    

}

extension TableViewController: AddViewControllerDelegate {

    func userAddedRecipeItem(item: Recipe) { // step 4 - conform to the protocol 
        recipeBook.append(item)
        tableView.reloadData()
    }
}

