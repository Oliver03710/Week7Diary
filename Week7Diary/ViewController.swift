//
//  ViewController.swift
//  Week7Diary
//
//  Created by Junhee Yoon on 2022/08/16.
//

import UIKit
import UIFramework
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    let nameButton: UIButton = {
       let view = UIButton()
        view.setTitle("닉네임", for: .normal)
        view.backgroundColor = .black
        view.tintColor = .black
        return view
    }()
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: Notification.Name("saveButtonNotification"), object: nil)
    }
    
    
    // MARK: - Selectors
    
    @objc func saveButtonNotificationObserver(notification: Notification) {
        
        if let text = notification.userInfo?["name"] as? String {
            self.nameButton.setTitle(text, for: .normal)
        } else {
            print("데이터 없음")
        }
        
    }
    
    @objc func nameButtonClicked() {
        
        NotificationCenter.default.post(name: NSNotification.Name("test"), object: nil, userInfo: ["name": "\(Int.random(in: 1...100))", "value": 123456 ])
        
        let vc = ProfileViewController()

        vc.saveButtonActionHandler = { text in
            self.nameButton.setTitle(text, for: .normal)

        }

        present(vc, animated: true)
    }
    
    
    // MARK: - Helper Functions
    
    func configure() {
        
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
    }
    
}

