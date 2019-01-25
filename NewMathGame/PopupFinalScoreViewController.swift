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
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 20
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromFinalSCoreViewSegue" {
            let destination = segue.destination as! SelectGameViewController
            
            if let name = nameLabel.text {
                destination.name = name
            }
        }
    }
}
