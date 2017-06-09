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
        tableView.estimatedRowHeight = 161
        tableView.tableFooterView = UIView() // hide empty views
        
    }
    
    @IBAction func addButtonTapped(_ sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "AddEntry", bundle: nil)
        if
            let addNavigationController = storyboard.instantiateViewController(withIdentifier: "SearchEntryNavIdentifier") as? UINavigationController,
            let addViewController = addNavigationController.topViewController as? SearchEntryViewController {
        
            addViewController.delegatePassItem = self // connect delegate
            present(addNavigationController, animated: true, completion: {
                // insert completion block logic here
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailIdentifier" {
            if let detailViewController = segue.destination as? DetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let detailData = journalItems[indexPath.row]
                    detailViewController.detailData = detailData
                }
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JournalCell
        
        let reviewedItem = journalItems[indexPath.row]
        
        cell.labelTitle?.text = reviewedItem.title + " (" + String(reviewedItem.yearMade) + ")"
        cell.labelDetail?.text = reviewedItem.name
        
        //  set images for each cell
        switch reviewedItem.type {
            case "Book":
            cell.imageView?.image = UIImage(named: "book_unselected")
            case "Album":
                cell.imageView?.image = UIImage(named: "album_unselected")
        case "Film":
            cell.imageView?.image = UIImage(named: "movie_unselected")
        default:
            break
        }
        
        // set star rating images
        switch reviewedItem.rating {
        case 1:
            cell.imageStarOne?.image = UIImage(named: "star_selected")
        case 2:
            cell.imageStarOne?.image = UIImage(named: "star_selected")
            cell.imageStarTwo?.image = UIImage(named: "star_selected")
        case 3:
            cell.imageStarOne?.image = UIImage(named: "star_selected")
            cell.imageStarTwo?.image = UIImage(named: "star_selected")
            cell.imageStarThree?.image = UIImage(named: "star_selected")
        case 4:
            cell.imageStarOne?.image = UIImage(named: "star_selected")
            cell.imageStarTwo?.image = UIImage(named: "star_selected")
            cell.imageStarThree?.image = UIImage(named: "star_selected")
            cell.imageStarFour?.image = UIImage(named: "star_selected")
        case 5:
            cell.imageStarOne?.image = UIImage(named: "star_selected")
            cell.imageStarTwo?.image = UIImage(named: "star_selected")
            cell.imageStarThree?.image = UIImage(named: "star_selected")
            cell.imageStarFour?.image = UIImage(named: "star_selected")
            cell.imageStarFive?.image = UIImage(named: "star_selected")
        default:
            break
        }
        
        // stretch separator across entire view
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsets.zero

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
    }
}

extension ViewController: PassItemDelegate {
    func passItemToRootView(_ item: JournalEntry) {
        journalItems.insert(item, at: 0)
        // TODO: - add data persistance here
//        journalItems.append(item)
        tableView.reloadData()
    }

}


