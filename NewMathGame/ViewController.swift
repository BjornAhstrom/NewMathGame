//
//  ViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var highScorePickerView: UIPickerView!
    @IBOutlet weak var playGameButton: UIButton!
    
    let getSavedResult = SaveNameAndScoreViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        highScorePickerView.dataSource = self
        highScorePickerView.delegate = self
    }
    
    func getResultFromTextFile(){
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return getSavedResult.name.count & getSavedResult.score.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(getSavedResult.name[row]) - \(getSavedResult.score[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
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
