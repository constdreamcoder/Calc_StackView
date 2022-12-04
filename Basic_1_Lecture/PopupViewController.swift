//
//  PopupViewController.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/12/02.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func closePoup(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
   
    @IBAction func doneAction(_ sender: UIButton) {
        print("press done action")
    }
    
}
