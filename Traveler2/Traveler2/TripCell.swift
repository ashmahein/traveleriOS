//
//  TripCell.swift
//  Traveler2
//
//  Created by Ash Mahein on 2/11/18.
//  Copyright © 2018 Ash Mahein. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {
    
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var dates: UILabel!
    
    @IBOutlet weak var tripImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
