//
//  ViewController.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField 값이 변경되는 걸 캐치하는게 없음.
        // addTarget 매서드는 해당 ui객체를 인수로 넘겨주는 특징이 있다.
        emailTextField.addTarget(self, action: #selector(textFieldEditied), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEditied), for: .editingChanged)
        
        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
    }
    
    @objc func textFieldEditied(textField: UITextField) {
        if textField == emailTextField {
            print("이메일 텍스트 필드 \(textField.text!)")
            if isValidEmail(testStr: textField.text) == true {
                // 에러표시가 안 나와야 함.
                emailErrorHeight.isActive = true
            } else {
                emailErrorHeight.isActive = false
            }
        } else if textField == passwordTextField {
            print("비밀번호 텍스트 필드 \(textField.text!)")
            if isValidPassword(pw: textField.text) == true {
                passwordErrorHeight.isActive = true
            } else {
                passwordErrorHeight.isActive = false
            }
        }
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }
    
    // 정규식 - regular expression
    func isValidEmail(testStr:String?) -> Bool {
      
        guard testStr != nil else { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidPassword(pw: String?) -> Bool {
        if let hasPassword = pw {
            if hasPassword.count < 8 {
                return false
            }
        }
        
        return true
    }
    
    
}



