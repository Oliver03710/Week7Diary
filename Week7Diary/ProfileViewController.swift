//
//  ProfileViewController.swift
//  Week7Diary
//
//  Created by Junhee Yoon on 2022/08/18.
//

import UIKit
import SnapKit

enum Notification {
    static let saveButton = NSNotification.Name("saveButtonNotification")
}

class ProfileViewController: UIViewController {
    
    let saveButton: UIButton = {
       let view = UIButton()
        view.setTitle("닉네임", for: .normal)
        view.backgroundColor = .black
        view.tintColor = .black
        return view
    }()
    
    let nameTextField: UITextField = {
       let view = UITextField()
        view.placeholder = "이름을 입력하세요."
        view.backgroundColor = .brown
        view.tintColor = .white
        return view
    }()
    
    var saveButtonActionHandler: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configure()
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: Notification.Name("test"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: Notification) {
        
        if let text = notification.userInfo?["name"] as? String {
            print(text)
            self.nameTextField.text = text
        } else {
            print("데이터 없음")
        }
        
    }
    
    @objc func saveButtonClicked() {
        
        // (2) Notification
        NotificationCenter.default.post(name: Notification.saveButton, object: nil, userInfo: ["name": nameTextField.text!, "value": 123456 ])
        
        // 값 전달 기능 실행 -> 클로저 구문 활용(1)
//        saveButtonActionHandler?(nameTextField.text!)
        
        // 화면 Dismiss
        dismiss(animated: true)
    }
    
    func configure() {
        
        [saveButton, nameTextField].forEach { view.addSubview($0) }
        
        nameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(50)
            make.top.equalTo(50)
            make.height.equalTo(50)
        }
        
        saveButton.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalTo(view)
        }
        
    }
    
}
