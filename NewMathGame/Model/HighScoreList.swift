//
//  HighScoreList.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-05.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import Foundation

private let highScoreKeyEasyLevel = "highScoreKeyEasyLevel"
private let highScoreKeyMediumLevel = "highScoreKeyMediumLevel"
private let highScoreKeyHardLevel = "highScoreKeyHardLevel"
private let difficultLevelKeyEasy = "diffiCultLevelKeyEasy"
private let difficultLevelKeyMedium = "diffiCultLevelKeyMedium"
private let difficultLevelKeyHard = "diffiCultLevelKeyHard"
private let nameKey1 = "nameKey1"
private let nameKey2 = "nameKey2"
private let nameKey3 = "nameKey3"

private var highesScoreName1: String = ""
private var highesScoreName2: String = ""
private var highesScoreName3: String = ""

func getHighScore() -> String {
    let highScore1 = UserDefaults.standard.integer(forKey: highScoreKeyEasyLevel)
    let name1 = UserDefaults.standard.string(forKey: nameKey1)
    
    if let temp = name1 {
        highesScoreName1 = temp
    }
    
    return "\(highesScoreName1) : \(highScore1) \(NSLocalizedString("points", comment: ""))"
    
}

func getHighScoreMediumLevel() -> String {
    let highScore2 = UserDefaults.standard.integer(forKey: highScoreKeyMediumLevel)
    let name2 = UserDefaults.standard.string(forKey: nameKey2)
    
    if let temp = name2 {
        highesScoreName2 = temp
    }
    
    return "\(highesScoreName2) : \(highScore2) \(NSLocalizedString("points", comment: ""))"
}

func getHighScoreHardLevel() -> String {
    let highScore3 = UserDefaults.standard.integer(forKey: highScoreKeyHardLevel)
    let name3 = UserDefaults.standard.string(forKey: nameKey3)
    
    if let temp = name3 {
        highesScoreName3 = temp
    }
    
    return "\(highesScoreName3) : \(highScore3) \(NSLocalizedString("points", comment: ""))"
}

func add(score: Int, name: String, difficultLevelEasy: String, difficultLevelMedium: String, difficultLevelHard: String, valueFromPickerView: Int) {
    let highScoreEasyLevel = UserDefaults.standard.integer(forKey: highScoreKeyEasyLevel)
    let highScoreMediumLevel = UserDefaults.standard.integer(forKey: highScoreKeyMediumLevel)
    let highScoreHardLevel = UserDefaults.standard.integer(forKey: highScoreKeyHardLevel)
    
    switch valueFromPickerView {
    case 0:
        if score > highScoreEasyLevel {
            UserDefaults.standard.set(score, forKey: highScoreKeyEasyLevel)
            UserDefaults.standard.set(name, forKey: nameKey1)
            UserDefaults.standard.synchronize()
        }
        break
    case 1:
        if score > highScoreMediumLevel{
            UserDefaults.standard.set(score, forKey: highScoreKeyMediumLevel)
            UserDefaults.standard.set(name, forKey: nameKey2)
            UserDefaults.standard.synchronize()
        }
        break
    case 2:
        if score > highScoreHardLevel {
            UserDefaults.standard.set(score, forKey: highScoreKeyHardLevel)
            UserDefaults.standard.set(name, forKey: nameKey3)
            UserDefaults.standard.synchronize()
        }
        break
    default:
        print("Error")
    }
}
