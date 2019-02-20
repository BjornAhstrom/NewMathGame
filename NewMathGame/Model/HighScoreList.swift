//
//  HighScoreList.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-05.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import Foundation

class HighScoreList {
    
    private static let highScoreKey = "highScoreKey"
    private static let namKey = "nameKey"
    //private static let popup = PopupFinalScoreViewController()
    
    static func getHighScore() -> String {
        let highScore = UserDefaults.standard.integer(forKey: highScoreKey)
        //let name = UserDefaults.standard.string(forKey: namKey)
        
        return " : \(highScore) \(NSLocalizedString("points", comment: ""))"
    }
    
    static func add(score: Int) {
        //var currentName: String = ""
        var highScore = UserDefaults.standard.integer(forKey: highScoreKey)
        
        if score >= highScore {
//            if let temp = popup.nameLabel.text {
//            currentName = temp
//                print("\(currentName) Namn")
//            }
            highScore = score
        }
        //UserDefaults.standard.set(currentName, forKey: namKey)
        UserDefaults.standard.set(highScore, forKey: highScoreKey)
        UserDefaults.standard.synchronize()
        
    }
}












//class Person {
//    var name: String
//    var score: Int
//
//    init(name: String, score: Int) {
//        self.name = name
//        self.score = score
//
//    }
//
//}
//
//class HighScore {
//
//    var highScore: [Person]
//
//    init() {
//        // read from user defaults
//        highScore = UserDefaults.standard.array(forKey: "test") as! [Person]
//
//        // if nil
////        if highScore == nil{
////            highScore = [Person(name: "name", score: 0)]
////        }
//         highScore = [Person]()
//
//    }
//
//    func add(person: Person) {
//        highScore.append(person)
//
//        //save to user defaults
//        UserDefaults.standard.set(highScore, forKey: "test")
//    }
//}
