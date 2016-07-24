//
//  DetailViewController.swift
//  assignment_three
//
//  Created by Shena Yoshida on 7/19/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
    
    // MARK: Declaration
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCookTime: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var recipeItem: Recipe?
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let recipe = recipeItem {
            
            labelTitle.text = recipe.name
            labelDescription.text = recipe.description
            labelCookTime.text = "Cook time: " + String(recipe.cookTime) + " minutes"
            imageView.image = recipe.image
            
            title = recipe.name // add recipe name to nav bar
        }
    }

}
