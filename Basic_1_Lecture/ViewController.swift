//
//  ViewController.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchBtn: UIButton!
    
    @IBOutlet weak var switchBG: UIView!
    
    @IBOutlet weak var buttonCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchBtn.layer.cornerRadius = 50 / 2
        // 이 부분이 있어야 버튼에 곡률을 줄 수 있다.
        switchBtn.clipsToBounds = true
        switchBG.layer.cornerRadius = 50 / 2
        
    }
    @IBAction func selectedButton(_ sender: UIButton) {
        if buttonCenterX.constant == 75 {
            buttonCenterX.constant = -75
            switchBG.backgroundColor = .lightGray
        } else {
            buttonCenterX.constant = 75
            switchBG.backgroundColor = .yellow
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}



