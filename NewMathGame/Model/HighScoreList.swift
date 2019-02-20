//
//  HighScoreList.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-05.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import Foundation

//class HighScoreList {

private let highScoreKeyEasyLevel = "highScoreKeyEasyLevel"
private let highScoreKeyMediumLevel = "highScoreKeyMediumLevel"
private let highScoreKeyHardLevel = "highScoreKeyHardLevel"
private let nameKey1 = "nameKey1"
private let nameKey2 = "nameKey2"
private let nameKey3 = "nameKey3"

private let difficultLevelKeyEasy = "diffiCultLevelKeyEasy"
private let difficultLevelKeyMedium = "diffiCultLevelKeyMedium"
private let difficultLevelKeyHard = "diffiCultLevelKeyHard"
private var highesScoreName1: String = ""
private var highesScoreName2: String = ""
private var highesScoreName3: String = ""
private var diffiCultLevel1: String = ""
private var diffiCultLevel2: String = ""
private var diffiCultLevel3: String = ""

func getHighScore() -> String {
    let highScore1 = UserDefaults.standard.integer(forKey: highScoreKeyEasyLevel)
    let name1 = UserDefaults.standard.string(forKey: nameKey1)
    let difficult1 = UserDefaults.standard.string(forKey: difficultLevelKeyEasy)
    
    if let temp = name1 {
        highesScoreName1 = temp
    }
    
    if let temp = difficult1 {
        diffiCultLevel1 = temp
    }
    return "\(highesScoreName1) : \(highScore1) \(NSLocalizedString("points", comment: "")) : \(diffiCultLevel1)"
    
}

func getHighScoreMediumLevel() -> String {
    let highScore2 = UserDefaults.standard.integer(forKey: highScoreKeyMediumLevel)
    let name2 = UserDefaults.standard.string(forKey: nameKey2)
    let difficult2 = UserDefaults.standard.string(forKey: difficultLevelKeyMedium)
    
    if let temp = name2 {
        highesScoreName2 = temp
    }
    
    if let temp = difficult2 {
        diffiCultLevel2 = temp
    }
    return "\(highesScoreName2) : \(highScore2) \(NSLocalizedString("points", comment: "")) : \(diffiCultLevel2)"
}

func getHighScoreHardLevel() -> String {
    let highScore3 = UserDefaults.standard.integer(forKey: highScoreKeyHardLevel)
    let name3 = UserDefaults.standard.string(forKey: nameKey3)
    let difficult3 = UserDefaults.standard.string(forKey: difficultLevelKeyHard)
    
    if let temp = name3 {
        highesScoreName3 = temp
    }
    
    if let temp = difficult3 {
        diffiCultLevel3 = temp
    }
    return "\(highesScoreName3) : \(highScore3) \(NSLocalizedString("points", comment: "")) : \(diffiCultLevel3)"
}

func add(score: Int, name: String, difficultLevelEasy: String, difficultLevelMedium: String, difficultLevelHard: String, valueFromPickerView: Int) {
    let highScoreEasyLevel = UserDefaults.standard.integer(forKey: highScoreKeyEasyLevel)
    let highScoreMediumLevel = UserDefaults.standard.integer(forKey: highScoreKeyMediumLevel)
    let highScoreHardLevel = UserDefaults.standard.integer(forKey: highScoreKeyHardLevel)
    
    switch valueFromPickerView {
    case 0:
        if score > highScoreEasyLevel {
            UserDefaults.standard.set(difficultLevelEasy, forKey: difficultLevelKeyEasy)
            UserDefaults.standard.set(score, forKey: highScoreKeyEasyLevel)
            UserDefaults.standard.set(name, forKey: nameKey1)
            UserDefaults.standard.synchronize()
        }
        break
    case 1:
        if score > highScoreMediumLevel{
            UserDefaults.standard.set(difficultLevelMedium, forKey: difficultLevelKeyMedium)
            UserDefaults.standard.set(score, forKey: highScoreKeyMediumLevel)
            UserDefaults.standard.set(name, forKey: nameKey2)
            UserDefaults.standard.synchronize()
        }
        break
    case 2:
        if score > highScoreHardLevel {
            UserDefaults.standard.set(difficultLevelHard, forKey: difficultLevelKeyHard)
            UserDefaults.standard.set(score, forKey: highScoreKeyHardLevel)
            UserDefaults.standard.set(name, forKey: nameKey3)
            UserDefaults.standard.synchronize()
        }
        break
    default:
        print("Error")
    }
}
