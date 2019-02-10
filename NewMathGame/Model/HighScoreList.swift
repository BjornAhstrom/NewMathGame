//
//  HighScoreList.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-05.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import Foundation

//class Player  : NSObject{
//    var name: String
//    var score: Int
//
//    init(name: String, score: Int) {
//        self.name = name
//        self.score = score
//    }
//
//}

class HighScoreList {
    
    private static let highScoreKey = "highScoreKey"
    
    static func getHighScore() -> [String: Int] {
        let highScore = UserDefaults.standard.dictionary(forKey: highScoreKey)
        if let score = highScore {
            return score as! [String: Int]
        }


        return [String: Int]()
    }
    
    static func add(name: String, score: Int) {

        var highScore = UserDefaults.standard.dictionary(forKey: highScoreKey) as? [String: Int]
        //let sorted = highScore!.sorted(by: { $0.value < $1.value })
        
        //UserDefaults.standard.removeObject(forKey: highScoreKey)
        if highScore == nil {
            highScore = [String: Int]()
            
        }
        highScore![name] = score
        
        UserDefaults.standard.set(highScore, forKey: highScoreKey)
    }
}
