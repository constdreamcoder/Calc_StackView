//
//  ViewController.swift
//  Basic_1_Lecture
//
//  Created by mac on 2022/11/19.
//

import UIKit

class ExpandCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
}

class ViewController: UIViewController {
    
    // 필요한 텍스트 포함
    // expand 상태
    
    // Model
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    var dataModels = [ExpandDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = ["short Text",
        "long long long long long long long long long long long long long long long long long long long long long long long Text",
        "long long long long long long long long long long long long long long long long long long long long long long long Text",
        "long long long long long long long long long long long long long long long long long long long long long long long Text",
         "long long long long long long long long long long long long long long long long long long long long long long long Text",
         "long long long long long long long long long long long long long long long long long long long long long long long Text",
         "long long long long long long long long long long long long long long long long long long long long long long long Text"]

        for (_, value) in textArray.enumerated() {
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as? ExpandCell else {
            return UITableViewCell()
        }
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        // Performance Improvement
        
        // 1. heightForRowAt 에서 정확한 높이를 지정(확실히 해결) -> 퍼포먼스 문제 없음
    
        // 2. tableView.reloadData() -> 어느 정도 해결
        
        // 3. 어느정도 해결
        // tableView.estimatedSectionHeaderHeight = 0
        // tableView.estimatedSectionFooterHeight = 0
        
        
        // 4. 애니메이션 효과 없애는 거의 확실히 해결(View 전체 애니메이션을 없애기)
        // UIView.setAnimationsEnabled(false)
        // UIView.setAnimationsEnabled(true)

        tableView.reloadRows(at: [indexPath], with: .none)

    }
}

