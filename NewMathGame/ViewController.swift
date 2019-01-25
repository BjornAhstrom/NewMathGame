//
//  ViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

       @IBOutlet weak var playGameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func swedishLangButton(_ sender: UIButton) {
        self.changeToLanguage("sv")
    }
    
    @IBAction func usaLangButton(_ sender: UIButton) {
        self.changeToLanguage("en")
    }
    
    func changeToLanguage(_ langCode: String) {
        if Bundle.main.preferredLocalizations.first != langCode {
            let confirmAlertCtrl = UIAlertController(title: NSLocalizedString("restartTitle", comment: ""), message: NSLocalizedString("restart", comment: ""), preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "close", style: .destructive) { _ in
                UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
                UserDefaults.standard.synchronize()
                exit(EXIT_SUCCESS)
            }
            confirmAlertCtrl.addAction(confirmAction)
            
            let canselAction = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil)
            confirmAlertCtrl.addAction(canselAction)
            
            present(confirmAlertCtrl, animated: true, completion: nil)
        }
    }

}

