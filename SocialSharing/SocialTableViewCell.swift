//
//  SocialTableViewCell.swift
//  SocialSharing
//
//  Created by max on 02.03.2022.
//

import UIKit

class SocialTableViewCell: UITableViewCell {

    @IBOutlet var featuredImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
