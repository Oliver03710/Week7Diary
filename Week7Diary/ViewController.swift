//
//  ViewController.swift
//  Week7Diary
//
//  Created by Junhee Yoon on 2022/08/16.
//

import UIKit
import UIFramework

class ViewController: UIViewController {
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        showAlert(title: "테스트 얼럿", message: "테스트 메세지", buttonTitle: "변경") { _ in
//            self.view.backgroundColor = .lightGray
//        }
        
        testOpen()
        
//        let image = UIImage(systemName: "star.fill")!
//        let shareURL = "https://www.apple.com"
//        let text = "WWDC What's New!"
//        showActivityViewController(shareImage: image, shareURL: shareURL, shareText: text)
        
        OpenWebView.presentWebViewController(self, url: "https://www.naver.com", transitionStyle: .present)
        
        
        
        
        
    }
    
    
}

