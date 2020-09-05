//
//  MealTableViewCell.swift
//  Cocina
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = 6
    }
    
    func configureCell(image: String, name: String, category: String) {
        nameLabel.text = name
        categoryLabel.text = category
        
        guard let url = URL(string: image) else { return }
        iconImageView.load(url: url)
    }
    
}
