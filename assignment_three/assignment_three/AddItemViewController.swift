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
    
    @IBOutlet weak var textFieldItemName: UITextField!
    @IBOutlet weak var textFieldItemDescription: UITextField!
    @IBOutlet weak var textFieldItemCookTime: UITextField!
    
    var delegate: AddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
        guard
            let name = textFieldItemName.text,
            let description = textFieldItemDescription.text,
            let time = Int(textFieldItemCookTime.text!)
            else {
                return
        }
        
        // TODO: add way to populate individual entry items for ingredients, steps and add camera for image. 
        
        let newRecipe = Recipe(name: name, cookTime: time, description: description, ingredients: [], steps: [], image: UIImage(named: "placeholder")!)
        
        delegate?.userAddedRecipeItem(newRecipe)
        
        // MARK: create test item for delegate
        
        // collect item for delegate to pass
        let recipe = Recipe(name: "Hot Dog Sushi", cookTime: 10, description: "Uncle Stan's contribution to the Yoshida family recipe book.", ingredients: ["leftover white sticky rice", "hot dogs", "soy sauce", "nori seaweed"], steps: ["make ball with sticky rice", "cook hot dog in a fry pan with soy sauce", "wrap hot dog with rice and nori", "slice into bite-sized rounds"], image: UIImage(named: "hot-dog-sushi")!)
        
        // access delegate method and pass in desired data
        delegate?.userAddedRecipeItem(recipe)
        
        // dismiss view
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
