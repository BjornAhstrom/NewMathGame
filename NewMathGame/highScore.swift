//
//  SaveNameAndScoreViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-29.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class highScore: UIViewController {
    var nameAndScore: [String : Int] = [String : Int]()
    
    func saveNameAndScore(name: String, score: Int) {
        nameAndScore = [name : score]
    }
    
    func saveUserData() {
        let saveUserData = UserDefaults.standard
        saveUserData.set(nameAndScore, forKey: "nameAndScore")
        saveUserData.synchronize()
    }
    
    func getUserData() {
        _ = UserDefaults.standard.object(forKey: "nameAndScore")
    }
}
