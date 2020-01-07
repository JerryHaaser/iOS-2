//
//  RestaurantReviewCustomTableViewCell.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class RestaurantReviewCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantReviewCellReviewTitleLabel: UILabel!
    @IBOutlet weak var restaurantReviewCellDateLabel: UILabel!
    @IBOutlet weak var restaurantReviewCellRatingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
