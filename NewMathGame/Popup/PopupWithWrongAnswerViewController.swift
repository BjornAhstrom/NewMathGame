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
        
        popupView.layer.cornerRadius = 20
        shake()
    }
    
    func theme() {
        textLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        answerLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
    }
    
    func shake() {
        popupView.backgroundColor = UIColor(red: 255.0/255, green: 30.0/255, blue: 35.0/255, alpha: 0.7)
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
    
    func backGround() {
        
        
    }
}
