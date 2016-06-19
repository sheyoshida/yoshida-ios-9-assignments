//
//  ViewController.swift
//  BioApp
//
//  Created by Shena Yoshida on 6/18/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var buttonPizzaNews: UIButton!
    @IBOutlet weak var buttonPizzaGoals: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pizzaRadius:CGFloat = 3.14
        let pizzaBorderWidth:CGFloat = 1.5
        let pizzaBorderColor = UIColor.blackColor().CGColor
        
        buttonSignIn?.layer.cornerRadius = pizzaRadius
        buttonSignIn?.layer.borderWidth = pizzaBorderWidth
        buttonSignIn?.layer.borderColor = pizzaBorderColor
        
        buttonPizzaNews?.layer.cornerRadius = pizzaRadius
        buttonPizzaNews?.layer.borderWidth = pizzaBorderWidth
        buttonPizzaNews?.layer.borderColor = pizzaBorderColor
        
        buttonPizzaGoals?.layer.cornerRadius = pizzaRadius
        buttonPizzaGoals?.layer.borderWidth = pizzaBorderWidth
        buttonPizzaGoals?.layer.borderColor = pizzaBorderColor
        
    }


}

