//
//  NewsCell.swift
//  newsAPI
//
//  Created by Артур Басыров on 16.10.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
