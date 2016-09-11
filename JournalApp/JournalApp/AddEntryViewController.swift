//
//  AddEntryViewController.swift
//  JournalApp
//
//  Created by Shena Yoshida on 9/5/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

protocol AddItemDelegate {
    func userAddedItem(item: JournalEntry)
}

class AddEntryViewController: UIViewController {
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!

    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var labelHeadline: UILabel!
    
    
    var reviewData: JournalEntry?
    var rating: Int = 0
    var mediaType = ""
    var wasMade: Int = 0
    var itemDescription = ""
    var itemTitle = ""
    var name = ""
    
    var delegate: AddItemDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detail = reviewData {
            itemTitle = detail.title
            name = detail.name
            mediaType = detail.type
            wasMade = detail.yearMade
            rating = detail.rating
            itemDescription = detail.note
                        
            
//print("title: \(labelHeadline.text), maker: \(labelHeadline.text), type: \(mediaType), year made: \(wasMade), rating: \(rating), description: \(itemDescription)")
            
        }
        
        labelHeadline.text = itemTitle
        labelSubtitle.text = name
        
        print("title: \(itemTitle), maker: \(name), type: \(mediaType), year made: \(wasMade), rating: \(rating), description: \(itemDescription)")
        
        
        setupButtons()
    }

    
    @IBAction func oneStarTapped(sender: AnyObject) {
        rating = 1
        buttonOne.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonTwo.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonThree.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonFour.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonFive.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
    }
    @IBAction func twoStarTapped(sender: AnyObject) {
        rating = 2
        buttonOne.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonTwo.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonThree.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonFour.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonFive.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
    }
    
    @IBAction func threeStarTapped(sender: AnyObject) {
        rating = 3
        buttonOne.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonTwo.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonThree.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonFour.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonFive.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
    }
    
    @IBAction func fourStarTapped(sender: AnyObject) {
        rating = 4
        buttonOne.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonTwo.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonThree.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonFour.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonFive.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
    }
    
    @IBAction func fiveStarTapped(sender: AnyObject) {
        rating = 5
        buttonOne.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonTwo.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonThree.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonFour.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
        buttonFive.setImage(UIImage(named: "star_selected"), forState: UIControlState.Normal)
    }
    
    func setupButtons() {
        buttonOne.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonTwo.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonThree.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonFour.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
        buttonFive.setImage(UIImage(named: "star_unselected"), forState: UIControlState.Normal)
    }
    
    @IBAction func addEntryButtonTapped(sender: AnyObject) {
//        guard
//            let myName = labelHeadline.text,
//            let title = labelSubtitle.text
//            else {
//                return
//            }
        
//        print("title: \(itemTitle), maker: \(name), type: \(mediaType), year made: \(wasMade), rating: \(rating), description: \(itemDescription)")

        let itemToPass = JournalEntry(name: name, title: itemTitle, type: mediaType, rating: rating, note: itemDescription, image: "", yearMade: wasMade)
        delegate?.userAddedItem(itemToPass)
        dismissViewControllerAnimated(true, completion: nil)
        
        
        
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
