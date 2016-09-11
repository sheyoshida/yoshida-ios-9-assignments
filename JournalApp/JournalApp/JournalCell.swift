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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
