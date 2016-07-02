//
//  GuessNumberModel.swift
//  assignment_two
//
//  Created by Shena Yoshida on 7/2/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

class GuessNumber {
    
    func guess(number: Int) -> Bool {
        
        let randoNumber = Int(arc4random_uniform(10) + 1)
        
        if number != randoNumber {
            print("\(number) != \(randoNumber)")
            return false
        } else {
            print("\(number) == \(randoNumber)")
            return true
        }
    }
}