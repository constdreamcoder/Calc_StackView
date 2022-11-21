//
//  ViewController.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/11/19.
//

import UIKit

class ViewController: UIViewController, CustomKeyBoardDelegate {
    
    @IBOutlet weak var firstTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 커스텀 키보드 설정 방법
//        firstTextField.inputView = "커스텀 키보드 뷰"
    
        let loadNib = Bundle.main.loadNibNamed("CustomKeyBoard", owner: nil, options: nil)
        
        let myKeyBoardView = loadNib?.first as! CustomKeyBoard
        myKeyBoardView.delegate = self
        firstTextField.inputView = myKeyBoardView
    }

    func keyboardTapped(str: String) {
        print(str)
        
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(str)
        
        if str == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        
        if str == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            if let formatted = numberFormatter.string(from: NSNumber(value: hasNumber)) {
                firstTextField.text = String(describing: formatted)
            }
        }
        
    }
    
}

