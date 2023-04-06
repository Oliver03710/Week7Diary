//
//  FirstViewController.swift
//  Week7Diary
//
//  Created by Junhee Yoon on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var tutorialLabel: UILabel!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var blackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var appleImageView: UIImageView!
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        
        tutorialLabel.numberOfLines = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.text = """
        일기 씁시다!
        잘 써봅시다!
        """
        
        tutorialLabel.alpha = 0
        UIView.animate(withDuration: 3) {
            self.tutorialLabel.alpha = 1
            self.tutorialLabel.backgroundColor = .systemYellow
        } completion: { _ in
            self.animateBlackView()
        }
        animateImageView()
    }
    
    
    // MARK: - Helper Functions
    
    func animateBlackView() {
        UIView.animate(withDuration: 2) {
            self.blackView.alpha = 1
            self.blackViewWidth.constant += 250
        } completion: { _ in
            
        }

    }
    
    func animateImageView() {
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.appleImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
    }
    
}
