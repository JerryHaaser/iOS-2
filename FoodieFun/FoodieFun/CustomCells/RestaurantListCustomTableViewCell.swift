//
//  RestaurantListCustomTableViewCell.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class RestaurantListCustomTableViewCell: UITableViewCell {
    
    var restaurant: Restaurant? {
        didSet {
            
        }
    }

    @IBOutlet weak var restaurantListRestaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantListRatingLabel: UILabel!
    @IBOutlet weak var restaurantListImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
