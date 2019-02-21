//
//  ViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class StartScreenViewController: ColorViewController {
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabelEasyResult: UILabel!
    @IBOutlet weak var highScoreMediumResult: UILabel!
    @IBOutlet weak var highScoreHardResult: UILabel!
    @IBOutlet weak var playGameButton: UIButton!
    @IBOutlet weak var mathExerciseButton: UIButton!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var easyLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var hardLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playGameButton.titleLabel?.textColor = Theme.current.textColor
        mathExerciseButton.titleLabel?.textColor = Theme.current.textColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setImagesFontAndSizeOnButtonsAndLabels()
        setGradientBackground()
        highScoreLabel.text = NSLocalizedString("highest_Score", comment: "")
        easyLabel.text = NSLocalizedString("difficultLevel_1", comment: "")
        mediumLabel.text = NSLocalizedString("difficultLevel_2", comment: "")
        hardLabel.text = NSLocalizedString("difficultLevel_3", comment: "")   
        highScoreLabelEasyResult.text = getHighScore()
        highScoreMediumResult.text = getHighScoreMediumLevel()
        highScoreHardResult.text = getHighScoreHardLevel()
    }
    
    func setImagesFontAndSizeOnButtonsAndLabels() {
        highScoreLabel.font = UIFont(name: Theme.current.fontForLabels, size: 40)
        highScoreLabel.textColor = Theme.current.textColor
        highScoreLabel.numberOfLines = 2
        
        for label in labels {
            label.font = UIFont(name: Theme.current.fontForLabels, size: 20)
            label.textColor = Theme.current.textColor
        }
        
        appNameLabel.font = UIFont(name: Theme.current.fontForLabels, size: 95)!
        appNameLabel.textColor = Theme.current.textColor
        
        for buttons in buttons {
            buttons.layer.cornerRadius = 10
            buttons.layer.shadowColor = UIColor.white.cgColor
            buttons.layer.shadowRadius = 5
            buttons.layer.shadowOpacity = 2
            buttons.backgroundColor = Theme.current.colorOnButtons
            buttons.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
            buttons.setTitleColor(Theme.current.textColor, for: .normal)
        }
    }
    
    @IBAction func buttonsWithAnimations(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 3.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity }, completion: { Void in() })
    }
    
    //    @IBAction func swedishLangButton(_ sender: UIButton) {
    //        self.changeToLanguage("sv")
    //    }
    //
    //    @IBAction func usaLangButton(_ sender: UIButton) {
    //        self.changeToLanguage("en")
    //    }
    //
    //    func changeToLanguage(_ langCode: String) {
    //        if Bundle.main.preferredLocalizations.first != langCode {
    //            let confirmAlertCtrl = UIAlertController(title: NSLocalizedString("restartTitle", comment: ""), message: NSLocalizedString("restart", comment: ""), preferredStyle: .alert)
    //
    //            let confirmAction = UIAlertAction(title: "close", style: .destructive) { _ in
    //                UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
    //                UserDefaults.standard.synchronize()
    //                exit(EXIT_SUCCESS)
    //            }
    //            confirmAlertCtrl.addAction(confirmAction)
    //
    //            let canselAction = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil)
    //            confirmAlertCtrl.addAction(canselAction)
    //
    //            present(confirmAlertCtrl, animated: true, completion: nil)
    //        }
    //    }
    
}
