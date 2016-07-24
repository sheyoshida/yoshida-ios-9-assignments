//
//  AddItemViewController.swift
//  assignment_three
//
//  Created by Shena Yoshida on 7/24/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit


// MARK: Delegate Protocol

protocol AddViewControllerDelegate {
    func userAddedRecipeItem(item: Recipe)
}

class AddItemViewController: UIViewController {
    
    var delegate: AddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
        // collect item for delegate to pass
        let recipe = Recipe(name: "Hot Dog Sushi", cookTime: 5, description: "Uncle Stan's contribution to the Yoshida family recipe book.", ingredients: ["leftover white rice", "hot dogs"], steps: ["make ball with sticky rice", "cook and slice hot dog", "insert chunk of hot dog into rice ball", "feel like a single guy"], image: UIImage(named: "banana-split")!)
        
        // access delegate method and pass in desired data
        delegate?.userAddedRecipeItem(recipe)
        
        // dismiss view
         dismissViewControllerAnimated(true, completion: nil)
    }
    

}
