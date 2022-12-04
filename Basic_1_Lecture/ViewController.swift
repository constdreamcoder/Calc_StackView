//
//  ViewController.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    @IBAction func showPopup(_ sender: UIButton) {
        // PopupViewController
        
        let storyBoard = UIStoryboard(name: "PopupViewController", bundle: nil)
        
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        popupVC.modalPresentationStyle = .overCurrentContext
        self.present(popupVC, animated: false, completion: nil)
    }
    
}



