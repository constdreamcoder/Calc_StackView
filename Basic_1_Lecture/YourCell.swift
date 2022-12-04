//
//  YourCell.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/12/04.
//

import UIKit

class YourCell: UITableViewCell {

    @IBOutlet weak var yourTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
