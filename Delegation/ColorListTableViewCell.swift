//
//  ColorListTableViewCell.swift
//  Delegation
//
//  Created by Swayambhu BANERJEE on 22/03/26.
//

import UIKit

class ColorListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorLabel: UILabel!
    
    static let identifier = "ColorListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Called when the cell is loaded from storyboard
        // Do your one-time setup here instead of init
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
    }
    
    func configure(with color: UIColor) {
        colorLabel.text = "color is \(color)"
        contentView.backgroundColor = color
    }
    
}
