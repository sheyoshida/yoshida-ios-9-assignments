//
//  JournalCell.swift
//  JournalApp
//
//  Created by Shena Yoshida on 8/28/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class JournalCell: UITableViewCell {

    @IBOutlet weak var labelDetail: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewArtwork: UIImageView!
    
    @IBOutlet weak var imageStarOne: UIImageView!
    @IBOutlet weak var imageStarTwo: UIImageView!
    @IBOutlet weak var imageStarThree: UIImageView!
    @IBOutlet weak var imageStarFour: UIImageView!
    @IBOutlet weak var imageStarFive: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageStarOne.image = UIImage(named: "star_unselected")
        imageStarTwo.image = UIImage(named: "star_unselected")
        imageStarThree.image = UIImage(named: "star_unselected")
        imageStarFour.image = UIImage(named: "star_unselected")
        imageStarFive.image = UIImage(named: "star_unselected")

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
