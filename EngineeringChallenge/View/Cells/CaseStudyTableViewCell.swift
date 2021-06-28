//
//  CaseStudyTableViewCell.swift
//  EngineeringChallenge
//
//  Created by Artur on 03/06/21.
//

import UIKit

class CaseStudyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTeaser: UILabel!
    @IBOutlet weak var imageViewHero: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        lblTeaser.text = ""
        imageViewHero.image = nil
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

