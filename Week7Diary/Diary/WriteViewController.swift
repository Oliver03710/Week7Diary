//
//  WriteViewController.swift
//  Week7Diary
//
//  Created by Junhee Yoon on 2022/08/19.
//

import UIKit


class WriteViewController: BaseViewController {
    
    // MARK: - Properties
    
    var mainView = WriteView()
    
    
    // MARK: - Init
    
    //viewDidLoad보다 먼저 호출
    override func loadView() {      // super.loadView 호출 금지
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldClicked(_:)), for: .editingDidEndOnExit)
        
    }
    
    @objc func titleTextFieldClicked(_ textField: UITextField) {
        
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해주세요", button: "확인")
            return
        }
        
    }

}
