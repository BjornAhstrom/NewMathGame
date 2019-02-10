//
//  PopupWithWrongAnswerViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class PopupWithWrongAnswerViewController: UIViewController {
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
        
        textLabel.font = UIFont(name: "Marker Felt", size: 30)
        answerLabel.font = UIFont(name: "Marker Felt", size: 30)
        popupView.layer.cornerRadius = 20
        shake()
    }
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let toPoint = CGPoint(x: view.center.x + 10, y: view.center.y + 10)
        let toValue = NSValue(cgPoint: toPoint)
        
        let fromPoint = CGPoint(x: view.center.x - 10, y: view.center.y - 10)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        popupView.layer.add(shake, forKey: nil)
    }
}
