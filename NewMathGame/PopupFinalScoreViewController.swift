//
//  PopupFinalScoreViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class PopupFinalScoreViewController: UIViewController {
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontAndImagesOnButton()
        fontOnLabels()
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        popupView.layer.cornerRadius = 20
        pulsate()
    }
    
    func fontAndImagesOnButton() {
        quitButton.setBackgroundImage(Theme.current.imagesOnQuitButtons, for: .normal)
        quitButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 18)
        playAgainButton.setBackgroundImage(Theme.current.imagesOnStartPlayAndAnswerButtons, for: .normal)
        playAgainButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 18)
    }
    
    func fontOnLabels() {
        for labels in labels {
            labels.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromFinalSCoreViewSegue" {
            let destination = segue.destination as! SelectGameViewController
            
            if let name = nameLabel.text {
                destination.name = name
            }
        }
    }
    
    func pulsate() {
        popupView.backgroundColor = UIColor(red: 3.0/255, green: 154.0/255, blue: 240.0/255, alpha: 0.7)
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.8
        pulse.fromValue = 0.85
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.9
        pulse.damping = 1.0
        
        popupView.layer.add(pulse, forKey: nil)
    }
}
