//
//  ViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class ViewController: ColorViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var highScorePickerView: UIPickerView!
    @IBOutlet weak var playGameButton: UIButton!
    @IBOutlet weak var mathExerciseButton: UIButton!
    @IBOutlet weak var appNameLabel: UILabel!

    let getSavedResult = HighScoreList()
    var saved = "Name : Score"
    
    var highScore : [String: Int]?
    var highScoreNames : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesAndFontsOnButtons()
        appNameLabel.font = UIFont(name: Theme.current.fontForLabels, size: 95)!
        
        highScorePickerView.dataSource = self
        highScorePickerView.delegate = self
        
//        for player in getSavedResult.highScore {
//            print("\(player.name) score \(player.score)")
//        }
        
        highScore = HighScoreList.getHighScore()
        highScoreNames = Array((highScore?.keys)!)
        
        
    }
    
    func imagesAndFontsOnButtons() {
        playGameButton.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        playGameButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        mathExerciseButton.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        mathExerciseButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return highScore!.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "\(highScore!.keys.first)"
//    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: Theme.current.fontForLabels, size: 30)
            pickerLabel?.textAlignment = .center
        }
        
        let name = highScoreNames![row]
        pickerLabel?.text = "\(name) : \(highScore![name]!)"
        pickerLabel?.textColor = UIColor.magenta
        
        return pickerLabel!
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
