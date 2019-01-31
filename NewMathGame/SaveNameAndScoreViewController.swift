//
//  SaveNameAndScoreViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-29.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class SaveNameAndScoreViewController: UIViewController {
    var name: [String] = [String]()
    var score: [Int] = [Int]()
    
    func saveName(name: String) -> [String?] {
        self.name = [name]
        
        return self.name
    }
    
    func saveScore(score: Int) -> [Int] {
        self.score = [score]
        
        return self.score
    }
    
}
