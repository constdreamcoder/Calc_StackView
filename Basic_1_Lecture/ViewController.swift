//
//  ViewController.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/11/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.delegate = self
            chatTableView.dataSource = self
            chatTableView.separatorStyle = .none
        }
    }
    
    var chatDatas = [String]()
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
        }
    }
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var inputVIewBottomMargin: NSLayoutConstraint!
    
    var window: UIWindow!
    var bottom: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사용하려는 셀을 등록행 사용할 수 있다.
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "YourCell")
        
        // 키보드 관련 옵저버 설정을 해야 함.
        // 키보드 올라올 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // 키보드 내려올 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputVIewBottomMargin.constant = height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        let notiInfo = noti.userInfo!
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval

        UIView.animate(withDuration: animationDuration) {
            self.inputVIewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func sendString(_ sender: UIButton) {
        chatDatas.append(inputTextView.text)
        inputTextView.text = ""
        
        // 잘 사용 안함
        // 이유: 전체 테이블 뷰를 갱신하면 전체 레이아웃이 갱신되면서 탁탁 튀는 경향이 있어 UX적으로 보기 안좋기 때문임
//        chatTableView.reloadData()
        let lastIndexPath = IndexPath(row: chatDatas.count-1, section: 0)
        chatTableView.insertRows(at: [lastIndexPath], with: .automatic)
        
        // 3개 데이터가 있는 array일 경우
        // array.count = 3
        // array row => 2
        
        inputTextViewHeight.constant = 40
        
        chatTableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
            myCell.myTestView.text = chatDatas[indexPath.row]
            myCell.selectionStyle = .none
            return myCell
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "YourCell", for: indexPath) as! YourCell
            yourCell.selectionStyle = .none
            yourCell.yourTextView.text = chatDatas[indexPath.row]
            return yourCell
        }
    }
    
    // MARK: - UITextViewDelegate
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 40 {
            inputTextViewHeight.constant = 40
        } else if textView.contentSize.height >= 100{
            inputTextViewHeight.constant = 100
        } else {
            inputTextViewHeight.constant = textView.contentSize.height
        }
    }
}



