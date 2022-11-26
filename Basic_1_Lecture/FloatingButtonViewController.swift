//
//  FloatingButtonViewController.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/11/25.
//

import UIKit

class FloatingButtonViewController: UIViewController {

    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1) {
           
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            
            self.btn1CenterY.constant = 80
            self.btn2CenterY.constant = 160
            self.btn3CenterY.constant = 240
            
            // 화면 갱신
            self.view.layoutIfNeeded()
        } completion: { completion in
            // 애니메이션이 끝나는 시점
        }

    }
    @IBAction func dismissFloating(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            
            self.btn1CenterY.constant = 0
            self.btn2CenterY.constant = 0
            self.btn3CenterY.constant = 0
            
            // 화면 갱신
            self.view.layoutIfNeeded()
        } completion: { completion in
            // 애니메이션이 끝나는 시점
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func food3Action(_ sender: UIButton) {
        print("food3 selected")
    }
    
}
