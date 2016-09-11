//
//  ViewController.swift
//  JournalApp
//
//  Created by Shena Yoshida on 8/21/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet
    var tableView: UITableView!
    
    var journalItems = [JournalEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension // cell height matches text
        tableView.estimatedRowHeight = 105
        tableView.tableFooterView = UIView() // hide empty views

    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "AddEntry", bundle: nil)
        if
            let addNavigationController = storyboard.instantiateViewControllerWithIdentifier("SearchEntryNavIdentifier") as? UINavigationController,
            let addViewController = addNavigationController.topViewController as? SearchEntryViewController {
        
            addViewController.delegatePassItem = self // connect delegate
            presentViewController(addNavigationController, animated: true, completion: {
                // insert completion block logic here
            })
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailIdentifier" {
            if let detailViewController = segue.destinationViewController as? DetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let detailData = journalItems[indexPath.row]
                    detailViewController.detailData = detailData
                }
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! JournalCell
        
        let reviewedItem = journalItems[indexPath.row]
        
        cell.labelTitle?.text = reviewedItem.title + " (" + String(reviewedItem.yearMade) + ")"
        cell.labelDetail?.text = reviewedItem.name
        
        // show rating too? 
        
        if reviewedItem.type == "Book" {
            cell.imageView?.image = UIImage(named: "book_unselected.png")
        }
        if reviewedItem.type == "Album" {
            cell.imageView?.image = UIImage(named: "album_unselected.png")
        }
        if reviewedItem.type == "Film" {
            cell.imageView?.image = UIImage(named: "movie_unselected.png")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
    }
}

extension ViewController: PassItemDelegate {
    func passItemToRootView(item: JournalEntry) {
        journalItems.insert(item, atIndex: 0)
        // TODO: - add data persistance here
//        journalItems.append(item)
        tableView.reloadData()
    }

}


