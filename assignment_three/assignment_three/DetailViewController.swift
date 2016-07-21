//
//  DetailViewController.swift
//  assignment_three
//
//  Created by Shena Yoshida on 7/19/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCookTime: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var recipeItem: Recipe?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = recipeItem?.name
        labelDescription.text = recipeItem?.description
        
        if let time = recipeItem?.cookTime {
            let timeValue = String(time)
            labelCookTime.text = "Cook time: " + timeValue + " minutes"
        }
    }
    
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
