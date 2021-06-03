//
//  CaseStudyDetailsTableViewCell.swift
//  EngineeringChallenge
//
//  Created by Artur on 03/06/21.
//

import UIKit

class CaseStudyDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var bodyImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
