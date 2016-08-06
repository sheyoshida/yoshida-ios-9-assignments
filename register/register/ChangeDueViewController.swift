//
//  ChangeDueViewController.swift
//  register
//
//  Created by Shena Yoshida on 8/1/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class ChangeDueViewController: UIViewController {
    
    @IBOutlet weak var labelMessage: UILabel!
    
    var checkoutMessage: String? = nil
    
    
    override func viewDidLoad() {
        if let message = checkoutMessage {
            labelMessage.text = message
        }
    }

}
