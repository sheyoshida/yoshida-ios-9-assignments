//
//  SearchEntryViewController.swift
//  JournalApp
//
//  Created by Shena Yoshida on 9/4/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

protocol PassItemDelegate {
    func passItemToRootView(item: JournalEntry)
}

class SearchEntryViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonAlbum: UIButton!
    @IBOutlet weak var buttonBook: UIButton!
    @IBOutlet weak var buttonFilm: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var delegatePassItem: PassItemDelegate?
    var journalItems = [JournalEntry]()
    
    var searchMediaType: String = "musicArtist"
    var mediaType: String = "Album"
    var url: String = ""
    var itemsFromAPI: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtons()
        
        tableView.rowHeight = UITableViewAutomaticDimension // cell height matches text
        tableView.estimatedRowHeight = 105
        tableView.tableFooterView = UIView() // hide empty views
        
        textField.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func albumButtonTapped(sender: AnyObject) {
        saveChoice("Album")
        albumSearchDefaults()
        clearTableViewIfFull()
    }
    
    @IBAction func bookButtonTapped(sender: AnyObject) {
        saveChoice("Book")
        bookSearchDefaults()
        clearTableViewIfFull()
    }
    
    @IBAction func filmButtonTapped(sender: AnyObject) {
        saveChoice("Film")
        filmSearchDefaults()
        clearTableViewIfFull()
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK - NSUserDefaults
    
    func saveChoice(mediaPickType: String) {
        NSUserDefaults.standardUserDefaults().setObject(mediaPickType, forKey: "last used")
    }
    
    // MARK: - Button Logic
    
    func albumSearchDefaults() {
        searchMediaType = "musicArtist"
        mediaType = "Album"
        navigationItem.title = "Search For Album"
        buttonAlbum.setImage(UIImage(named: "album_selected"), forState: UIControlState.Normal)
        buttonBook.setImage(UIImage(named: "book_unselected"), forState: UIControlState.Normal)
        buttonFilm.setImage(UIImage(named: "movie_unselected"), forState: UIControlState.Normal)
    }
    
    func bookSearchDefaults() {
        searchMediaType = "ebook"
        mediaType = "Book"
        navigationItem.title = "Search For Book"
        buttonAlbum.setImage(UIImage(named: "album_unselected"), forState: UIControlState.Normal)
        buttonBook.setImage(UIImage(named: "book_selected"), forState: UIControlState.Normal)
        buttonFilm.setImage(UIImage(named: "movie_unselected"), forState: UIControlState.Normal)
    }
    
    func filmSearchDefaults() {
        searchMediaType = "movie"
        mediaType = "Film"
        navigationItem.title = "Search For Film"
        buttonAlbum.setImage(UIImage(named: "album_unselected"), forState: UIControlState.Normal)
        buttonBook.setImage(UIImage(named: "book_unselected"), forState: UIControlState.Normal)
        buttonFilm.setImage(UIImage(named: "movie_selected"), forState: UIControlState.Normal)
    }
    
    func setupButtons() {
        let choice = NSUserDefaults.standardUserDefaults().objectForKey("last used") as? String
        if let pick = choice { // unwrap it
            if pick == "Album" {
                albumSearchDefaults()
            }
            if pick == "Book" {
                bookSearchDefaults()
            }
            if pick == "Film" {
                filmSearchDefaults()
            }
        } else {
            albumSearchDefaults()
        }
    }
    
    func clearTableViewIfFull() {
        if journalItems.count > 0 {
            journalItems.removeAll()
            tableView.reloadData()
            textField.text = ""
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addEntryIdentifier" {
            if let detailViewController = segue.destinationViewController as? AddEntryViewController {
                detailViewController.delegate = self
                if let indexPath = tableView.indexPathForSelectedRow {
                    let itemToReview = journalItems[indexPath.row]
                    detailViewController.reviewData = itemToReview
                }
            }
        }
    }
    
}

// MARK: - Table View

extension SearchEntryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCellIdentifier", forIndexPath: indexPath) as! SearchTableViewCell
        
        let result = journalItems[indexPath.row]
        let convertedDate = String(result.yearMade)
        
        cell.labelTitle?.text = result.title
        cell.labelDetail?.text = result.name.stringByAppendingString(" (").stringByAppendingString(convertedDate).stringByAppendingString(")")
        
        return cell
    }
    
}

// MARK: - Text Field + API Call

extension SearchEntryViewController: UITextFieldDelegate {
    
    @IBAction func textFieldTextAdded(sender: AnyObject) {

        if let searchItem = textField.text {
            
            // remove spaces and additional characters for url
            let safeURL = searchItem.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            
            if mediaType == "Album" {
                url =  "https://itunes.apple.com/search?media=music&entity=album&term=\(safeURL)&limit=20"
            } else {
                url =  "https://itunes.apple.com/search?media=all&entity=\(searchMediaType)&term=\(safeURL)&limit=10"
            }
            
            // convert string to url
            if  let webURL = NSURL(string: url) {
                print("web url: \(webURL)")
                
                let dataTask = NSURLSession.sharedSession().dataTaskWithURL(webURL) { (iTunesData, response, error) in
                    
                    if let error = error {
                        print("error: \(error.localizedDescription).")
                        return
                    }
                    
                    guard let iTunesData = iTunesData else {
                        print("error no data")
                        return
                    }
                    
                    do {
                        if let object = try NSJSONSerialization.JSONObjectWithData(iTunesData, options: .AllowFragments) as? [String: AnyObject] {
//                            print("\(object)")
//                            print("\(object["results"]![0]["amgArtistId"])")

                            if let results = object["results"] as? [[String: AnyObject]] {
                                
                                for artist in results {
                                    //print(artist["artistName"])
                                    
                                    if let name = artist["artistName"],
                                        let year = artist["releaseDate"],
                                        let image = artist["artworkUrl100"] {
                                        
                                        if self.mediaType == "Film" {
                                            if let description = artist["longDescription"],
                                                let title = artist["trackName"] {
                                                
                                                self.itemsFromAPI = JournalEntry(name: "Director: " + (name as! String), title: title as! String, type: self.mediaType, rating: 3, note: description as! String, image: image as! String, yearMade: year.integerValue)
                                                
                                                print("FILM DETAILS: director: \(self.itemsFromAPI!.name), type: \(self.itemsFromAPI!.type), year: \(self.itemsFromAPI!.yearMade), description: \(self.itemsFromAPI!.note), title: \(self.itemsFromAPI!.title)")
                                            }
                                        }
                                        
                                        if self.mediaType == "Book" {
                                            if let title = artist["trackName"],
                                                let description = artist["description"] {
                                                
                                                self.itemsFromAPI = JournalEntry(name: "Author: " + (name as! String), title: title as! String, type: self.mediaType, rating: 0, note: description as! String, image: image as! String, yearMade: year.integerValue)
                                            }
                                        }
                                        
                                        if self.mediaType == "Album" {
                                            if let album = artist["collectionName"] {
                                                self.itemsFromAPI = JournalEntry(name: "Artist: " + (name as! String), title: album as! String, type: self.mediaType, rating: 0, note: "", image: image as! String, yearMade: year.integerValue)
                                            }
                                        }
                                        // append search results to array for TBV
                                        self.journalItems.append(self.itemsFromAPI!)
                                    }
                                }
                            }
                        }
                    } catch {
                        // handle error
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                        // do other things here, load images if necessary
                    })
                }
                dataTask.resume() // don't forget this
                
                // NOTE: for non HTTPS urls, an app transport security warning message may pop up in the console... we need to allow HTTP connections in the plist -> App Transport Security Settings, Allow Aribitrary Loads.
            }
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        journalItems.removeAll()
        tableView.reloadData()
        return true
    }
}

extension SearchEntryViewController: AddItemDelegate {
    func userAddedItem(item: JournalEntry) {
       delegatePassItem?.passItemToRootView(item)
        print("\(item)")
    }
    
}



