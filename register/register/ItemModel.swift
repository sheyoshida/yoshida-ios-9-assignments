//
//  ItemModel.swift
//  register
//
//  Created by Shena Yoshida on 8/1/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class Item {
    
    let name: String
    let price: Float
    let image: UIImage
    
    init(name: String, price: Float, image: UIImage) {
        self.name = name
        self.price = price
        self.image = image
    }
}