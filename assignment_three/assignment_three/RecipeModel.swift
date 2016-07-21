//
//  RecipeModel.swift
//  assignment_three
//
//  Created by Shena Yoshida on 7/19/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class Recipe {
        
    let name: String
    let cookTime: Int
    let description: String
    let ingredients: [String]
    let steps: [String]
    let image: UIImage
    
    init(name: String, cookTime: Int, description: String, ingredients: [String], steps: [String], image: UIImage) {
        self.name = name
        self.cookTime = cookTime
        self.description = description
        self.ingredients = ingredients
        self.steps = steps
        self.image = image
    }
}
