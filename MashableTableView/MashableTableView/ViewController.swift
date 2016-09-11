//
//  ViewController.swift
//  MashableTableView
//
//  Created by Shena Yoshida on 8/17/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let identifier = "MyCellIdentifier"
    var storyTitle = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
         storyTitle = ["war and peace", "lord of the flies", "1984", "on the road", "the very hungry caterpillar"]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        
        // get a url and force unwrap
        let webURL = NSURL(string: "http://mashable.com/stories.json")!
        
        
        // create NSURLSession
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(webURL) { (webData, response, error) in
            
            // unwrap the error first to see if there is an error, then unwrap the data
            if let error = error {
                print("error: \(error.localizedDescription).")
                return
            }
            
            guard let webData = webData else {
                print("error no web data")
                return
            }
            
            print("\(webData)")
            // make webData into JSON 
//            if let parsableJSON = NSJSONSerialization
        }
    
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyTitle.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // grab a cell with identifier
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        // extract data model items and map to index
        let dataObject = storyTitle[indexPath.row]
        
        // add dataObject to cell
        cell.textLabel?.text = dataObject
        
        // display it on the screen
        return cell
    }
    
}



