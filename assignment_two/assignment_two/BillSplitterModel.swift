//
//  BillSplitterModel.swift
//  assignment_two
//
//  Created by Shena Yoshida on 7/2/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

class calculateTip {
    
    func calculate(totalAmount: Float, tipPercent: Int, numberOfPeople: Int) -> Float {
        
        let tipTotal = totalAmount * (Float(tipPercent) / 100)
        let costPerPerson = (tipTotal + totalAmount) / Float(numberOfPeople)
        return costPerPerson
    }
}

