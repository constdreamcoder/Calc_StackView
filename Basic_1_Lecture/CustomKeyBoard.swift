//
//  CustomKeyBoard.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/11/20.
//

import UIKit

// delegate - 기능 값 위임
protocol CustomKeyBoardDelegate {
    func keyboardTapped(str: String)
}

class CustomKeyBoard: UIView {
    
    var delegate: CustomKeyBoardDelegate?

    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.keyboardTapped(str: sender.titleLabel!.text!)
    }
    
}
