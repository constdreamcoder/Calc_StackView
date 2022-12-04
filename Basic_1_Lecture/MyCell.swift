//
//  MyCell.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/12/04.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var myTestView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
