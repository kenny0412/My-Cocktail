//
//  CocktailCell.swift
//  MyCocktail
//
//  Created by Kenny Cardenas Reyes on 8/17/20.
//  Copyright © 2020 Kenny Cardenas Reyes. All rights reserved.
//

import UIKit

class CocktailCell: UITableViewCell {

    @IBOutlet weak var imgCocktail: UIImageView!
    @IBOutlet weak var cocktailName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
